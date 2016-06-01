use WORK.cpu_defs_pack.all;
use WORK.mem_defs_pack.all;
use WORK.arithm_defs_pack.all;
use WORK.logical_defs_pack.all;
use WORK.IO_defs_pack.all;
use std.textio.all;

entity MaxCPU is
end MaxCPU;

architecture functional of MaxCPU is
begin
	process

	file TraceFile : Text is out "testbench/TraceFile.txt";
	file DumpFile : Text is out "testbench/DumpFile.txt";
	file MemoryFile : Text is in "testbench/MemoryFile.txt";
	file IOInputFile : Text is in "testbench/IO_InputFile.txt";
	file IOOutputFile : Text is out "testbench/IO_OutputFile.txt"; 
 
	variable l : line; -- pointer to string
	variable l_in : line; -- pointer to string
	variable l_out : line; -- pointer to string
	variable illegal : boolean;
	variable Reg : reg_type;
	variable Data : data_type;
	variable Instr : data_type; -- Intruction for the CPU
	variable OP : opcode_type; -- Operations of the CPU
	variable tmp : integer;
	variable var : data_type; -- temporary data_type variable for I/0
	variable erfolg : boolean; -- erfolg variable I/0
	-- variable Memory : mem_type := init_memory;
	variable Memory : mem_type := (
	0 => code_nop * (2 ** reg_addr_width) ** 3, 
	1 => code_stop * (2 ** reg_addr_width) ** 3, 
	others => 0
	);
	variable PC : addr_type := 0;
	variable X, Y, Z : reg_addr_type; -- die Variablen, auf denen Befehle gemacht werden

	variable my_line : line;

	-- in order to store particular results of some operations
	-- for details see pdf spec
	variable Zero, Carry, Negative, Overflow : boolean := FALSE;

	-- further objects
	begin
		init_memory(MemoryFile, Memory);

		-- cmd fetch - Fetch the first instruction from the memory
		-- Format: OOOOOO XX YY ZZ
		-- Instr := O * 64 + X * 16 + Y * 4 + Z;
		-- Obs: reg_addr_width = 2
 
		print_header(TraceFile);
 
		loop 

			Instr := Memory(PC);

			OP := Instr / (2 ** reg_addr_width) ** 3;
			X := (Instr / (2 ** reg_addr_width) ** 2) mod 2 ** reg_addr_width; -- zweiter Teil (2 st. E.)
			Y := (Instr / 2 ** reg_addr_width) mod 2 ** reg_addr_width; -- dritter Teil (2 st. E.)
			Z := Instr mod 2 ** reg_addr_width; -- vierter Teil (2 st. E.)

			write_PC_CMD(l, PC, OP, X, Y, Z);
			 
			-- Points to the memory address of the next instruction
			-- PC := PC + 1 would cause an overflow when the highest address is reached
			-- INC returns when end position is reached
			PC := INC(PC);

			-- cmd decode
			case OP is

				------------------------------------------------- MISCELLANEOUS

				when code_nop => null;
					write_NoParam(l);
			 
				when code_stop => write_NoParam(l);
					write_regs (l, Reg, Zero, Carry, Negative, Overflow); 
					writeline(TraceFile, l);
					print_tail(TraceFile );
					dump_memory(DumpFile, Memory); 
					wait;
					------------------------------------------------- ARITHMETIC
			 
					-- Memory() and Reg() at the same line means
					-- they will run simultaneously
			 
					-- 000000 XX YY ZZ
					-- ADD D S1 S2

					-- EXEC_ADD -> D := S1 + S2
					-- EXEC_ADDC -> D := S1 + S2 + Carry
					-- EXEC_SUB -> D := S1 - S2
					-- EXEC_SUBC -> D := S1 - S2 - Carry

				when code_add => write_NoParam(l);
					EXEC_ADDC(Reg(Y), Reg(Z), FALSE, Reg(X), Zero, Carry, Negative, Overflow);
				when code_addc => write_NoParam(l);
					EXEC_ADDC(Reg(Y), Reg(Z), Carry, Reg(X), Zero, Carry, Negative, Overflow);
				when code_sub => write_NoParam(l);
					EXEC_SUBC(Reg(Y), Reg(Z), FALSE, Reg(X), Zero, Carry, Negative, Overflow);
				when code_subc => write_NoParam(l);
					EXEC_SUBC(Reg(Y), Reg(Z), Carry, Reg(X), Zero, Carry, Negative, Overflow);

					------------------------------------------------- LOGICAL
					-- OPCODE D S1 S2
					-- not ~ D := not S1
					-- and ~ D := S1 and S2
					-- or ~ D := S1 or S2
					-- xor ~ D := S1 xor S2
					-- REA ~ LSB(D) := reduced_and(S1)
					-- REO ~ LSB(D) := reduced_or(S1)
					-- REX ~ LSB(D) := reduced_xor(S1)

				when code_not => write_NoParam(l);
					Data := "not"(Reg(Y));
					Reg(X) := Data;

				when code_and => write_NoParam(l);
					Data := "and"(Reg(Y), Reg(Z));
					Reg(X) := Data;

				when code_or => write_NoParam(l);
					Data := "or"(Reg(Y), Reg(Z));
					Reg(X) := Data;

				when code_xor => write_NoParam(l);
					Data := "xor"(Reg(Y), Reg(Z));
					Reg(X) := Data;

				when code_rea => write_NoParam(l);
					Reg(X) := setLsb(Reg(X), REA(Reg(Y)));

				when code_reo => write_NoParam(l);
					Reg(X) := setLsb(Reg(X), REO(Reg(Y)));

				when code_rex => write_NoParam(l);
					Reg(X) := setLsb(Reg(X), REX(Reg(Y)));

					------------------------------------------------- SHIFT/ROTATE

					-- sll ~ Carry & D := S1 & '0'
					-- srl ~ D & Carry := '0' & S1
					-- sra ~ D & Carry := MSB(S1) & S1
					-- rol ~ D := rotate_left(S1)
					-- ROLC ~ Carry & D := rotate_left(Carry & S1)
					-- ror ~ D := rotate_right(S1)
					-- RORC ~ Carry & D := rotate_right(Carry & S1)
			 
				when code_sll => write_NoParam(l);
					if Reg(Y) / 2 ** (data_width - 1) = 1 then
						Carry := true;
					else Carry := false;
					end if;
					tmp := (Reg(Y) mod 2 ** (data_width - 1)) * 2;
				Data := tmp mod 2 ** (data_width - 1);
				Set_Flags_Load(Data, Reg(Y), Zero, Negative, Overflow);
				Reg(X) := Data;

				-- 100101 => 1; 001010
				-- 011101 => 0; 111010

				when code_srl => write_NoParam(l);
					if Reg(Y) mod 2 = 1 then
						Carry := true;
					else Carry := false;
					end if;
					tmp := Reg(Y) / 2;
					Data := tmp mod 2 ** (data_width);
					Set_Flags_Load(Data, Reg(Y), Zero, Negative, Overflow);
					Reg(X) := Data;

					-- 100101 => 010010; 1
					-- 011101 => 001110; 1
				when code_sra => write_NoParam(l);
					if Reg(Y) mod 2 = 1 then
						Carry := true;
					else Carry := false;
					end if;
					tmp := Reg(Y) - (Reg(Y) mod 2 ** (data_width - 1)) + Reg(Y) / 2;
					Data := tmp mod 2 ** (data_width);
					Set_Flags_Load(Data, Reg(Y), Zero, Negative, Overflow);
					Reg(X) := Data;

					-- 100101 => 110010; 1
					-- 011101 => 001110; 1
				when code_rol => write_NoParam(l);
					tmp := (Reg(Y) mod 2 ** (data_width - 1)) * 2 + Reg(Y) / 2 ** (data_width - 1);
				Data := tmp mod 2 ** (data_width);
				Set_Flags_Load(Data, Reg(Y), Zero, Negative, Overflow);
				Reg(X) := Data;

				-- 100101 => 001011
				-- 011101 => 111010
				when code_rolc => write_NoParam(l);
					tmp := (Reg(Y) mod 2 ** (data_width - 1)) * 2;
				if Carry then
					tmp := tmp + 1;
				end if;
				if Reg(Y) / 2 ** (data_width - 1) = 1 then
					Carry := true;
				else Carry := false;
				end if;
				Data := tmp mod 2 ** (data_width);
				Set_Flags_Load(Data, Reg(Y), Zero, Negative, Overflow);
				Reg(X) := Data;

				-- 1;00101 => 0;01011
				-- 0;11101 => 1;11010
				when code_ror => write_NoParam(l);
					tmp := Reg(Y) / 2 + (Reg(Y) mod 2) * 2 ** (data_width - 1);
					--Set_Flags_Load(tmp, Zero, Negative, Overflow);
					Data := tmp mod 2 ** (data_width);
					Reg(X) := Data;

					-- 100101 => 110010
					-- 011101 => 101110
				when code_rorc => write_NoParam(l);
					tmp := Reg(Y) / 2;
					if Carry then
						tmp := tmp + 2 ** (data_width - 1);
					end if;
					if Reg(Y) mod 2 = 1 then
						Carry := true;
					else Carry := false;
					end if;
					Data := tmp mod 2 ** (data_width);					Set_Flags_Load(Data, Reg(Y), Zero, Negative, Overflow);
					Reg(X) := Data;
			 
					-- 1;00101 => 1;10010
					-- 0;11101 => 1;01110

					------------------------------------------------- MEMORY access

					-- LDC ~ D := const
					-- LDD ~ D := mem(addr)
					-- LDR ~ D := mem(RA)
					-- STD ~ mem(addr) := S
					-- STR ~ mem(RA) := S

				when code_ldc => write_Param(l, Memory(PC));
					EXEC_ldc(memory, Reg(X), PC, zero, Negative, Overflow); 
					--PC := INC(PC); 
			 
				when code_ldd => write_Param(l, Memory(PC));
					EXEC_ldd(memory, Reg(X), PC, zero, Negative, Overflow);
					--PC := INC(PC);

				when code_ldr => write_Param(l, Memory(Reg(Y)));
					EXEC_ldr(memory, Reg(Y), Reg(X), zero, Negative, Overflow);
					--PC := INC(PC);
			 
				when code_std => write_Param(l, Memory(PC));
					EXEC_std(memory, Reg(X), PC); 
					--PC := INC(PC);

				when code_str => write_Param(l, Memory(Reg(Y)));
					EXEC_str(memory, Reg(Y), Reg(X));
					--PC := INC(PC);

					------------------------------------------------- I/O

					-- in D _ _ ~ D := data_from_input_device
					-- out S _ _ ~ data_to_output_device := S
			 
				when code_in => write_NoParam(l);
					if (not endfile(IOInputFile)) then
						readline(IOInputFile, l_in);
						read(l_in, var, erfolg);
						if erfolg then
							Set_Flags_Load(var, var, Zero, Negative, Overflow);
							Reg(X) := var;
						end if;
					end if;
			 
				when code_out => write_NoParam(l);
					write(l_out, Reg(X));
					writeline(IOOutputFile, l_out);
			 
					------------------------------------------------- JUMP OPERATIONS

				when code_jmp => write_Param(l, Memory(PC));
					PC := Memory(PC); -- Unconditional Jump. Simply points to the memory address

				when code_jz => write_Param(l, Memory(PC));
					if Zero then
						PC := Memory(PC); -- Jump if Zero flag = '1'
					else PC := INC(PC);
					end if;
				when code_jc => write_Param(l, Memory(PC));
					if Carry then
						PC := Memory(PC); -- Jump if Carry flag = '1'
					else PC := INC(PC);
					end if;
				when code_jn => write_Param(l, Memory(PC));
					if Negative then
						PC := Memory(PC); -- Jump if Negative flag is = '1'
					else PC := INC(PC);
					end if;
				when code_jo => write_Param(l, Memory(PC));
					if Overflow then
						PC := Memory(PC); -- Jump if Overflow flag is = '1'
					else PC := INC(PC);
					end if;
				when code_jnz => write_Param(l, Memory(PC));
					if not Zero then
						PC := Memory(PC); -- Jump if Zero flag = '0'
					else PC := INC(PC);
					end if;
				when code_jnc => write_Param(l, Memory(PC));
					if not Carry then
						PC := Memory(PC); -- Jump if Carry flag = '0'
					else PC := INC(PC);
					end if;
				when code_jnn => write_Param(l, Memory(PC));
					if not Negative then
						PC := Memory(PC); -- Jump if Negative flag is = '0'
					else PC := INC(PC);
					end if;
				when code_jno => write_Param(l, Memory(PC));
					if not Overflow then
						PC := Memory(PC); -- Jump if Negative flag is = '0'
					else PC := INC(PC);
					end if;

					------------------------------------------------- UNEXPECTED CODE

				when others => -- Illegal or not yet implemented operations 
					write_NoParam(l);
					assert FALSE
					report "Illegal Operation"
						severity error;
			end case;

			write_regs (l, Reg, Zero, Carry, Negative, Overflow);
			writeline (TraceFile, l);
 
		end loop;
	end process;
end functional;
