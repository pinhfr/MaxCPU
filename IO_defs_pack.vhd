use WORK.cpu_defs_pack.all;
use std.textio.all;

package IO_defs_pack is
	procedure print_header(variable f : out text);
	procedure print_tail(variable f : out text);
	procedure write_PC_CMD (variable l: inout line;
				constant PC: in data_type;
				constant OP: in opcode_type;
				constant X,Y,Z: in reg_addr_type);

	procedure write_param (variable l: inout line; constant P: in data_type);
	
	procedure write_NoParam (variable l: inout line);

	procedure write_regs (variable l: inout line;
		constant Reg: in reg_type;
		variable Zero, Carry, Negative, Overflow: Boolean);

	function bool_character(b : Boolean) return character;
	
	function hex_image( d : data_type ) return string;

	function cmd_image(cmd : opcode_type) return string;

end IO_defs_pack;

package body IO_defs_pack is

	procedure print_header(variable f : out text) is
	
		variable l:line;
		
		begin
		write(l , string'("PC  | Cmd  | XYZ | P    | R0  | R1  | R2  | R3  | ZCNO"));
		writeline(f , l);
		write( l , string'("------------------------------------------------------"));
		writeline( f , l );
	
	end print_header;

	procedure print_tail(variable f : out text) is
	
		variable l:line;
		
		begin
		write( l , string'("------------------------------------------------------"));
		writeline( f , l );
	
	end print_tail;

	procedure write_PC_CMD (variable l: inout line;
		constant PC: in data_type;
		constant OP: in opcode_type;
		constant X,Y,Z: in reg_addr_type) is
		variable my_line : line;
		begin

		write( l , hex_image(PC), left, 3);
		write( l , string'(" | "));
		write( l , cmd_image(OP), left, 4);
		write( l , string'(" | "));
		write( l , X, left, 1);
		write( l , Y, left, 1);	
		write( l , Z, left, 1);	
		write( l , string'(" | "));

	end write_PC_CMD;

	procedure write_param (variable l: inout line;
		constant P: in data_type) is
		
		begin

		write( l , hex_image(P), left, 3);
		write( l , string'(" | "));

	end write_param;

	procedure write_NoParam (variable l: inout line) is
		
		begin

		write( l , string'("--- | "));

	end write_NoParam;

	procedure write_regs (variable l: inout line;
		constant Reg: in reg_type;
		variable Zero, Carry, Negative, Overflow: Boolean) is
		
		begin

		write( l , hex_image(Reg(0)), left, 3);
		write( l , string'(" | "));
		write( l , hex_image(Reg(1)), left, 3);
		write( l , string'(" | "));
		write( l , hex_image(Reg(2)), left, 3);
		write( l , string'(" | "));
		write( l , hex_image(Reg(3)), left, 3);
		write( l , string'(" | "));
		write( l , bool_character(Zero), left, 1);
		write( l , bool_character(Carry), left, 1);
		write( l , bool_character(Negative), left, 1);
		write( l , bool_character(Overflow), left, 1);

	end write_regs;

	function hex_image( d : data_type ) return string is
		constant hex_table : string(1 to 16):= "0123456789ABCDEF";
		variable result : string( 1 to 3 );

		begin	

		result(3):=hex_table(d mod 16 + 1);
		result(2):=hex_table((d / 16) mod 16 + 1);
		result(1):=hex_table(d / 256 + 1);

		return result;

	end hex_image;

	function bool_character(b : Boolean) return character is
	
		begin
	
		if b then return 'T';
		else
			return 'F';
		end if;
		
	end bool_character;

	function cmd_image(cmd : opcode_type) return string is
		
		begin	
		case cmd is

		when code_nop => return "NOP";
		when code_stop => return "STOP";
		when code_add => return "ADD";
		when code_addc => return "ADDC";
		when code_sub => return "SUB";
		when code_subc => return "SUBC";
		when code_not => return "NOT";
		when code_and => return "AND";
		when code_or => return "OR";
		when code_xor => return "XOR";
		when code_rea => return "REA";
		when code_reo => return "REO";
		when code_rex => return "REX";
		when code_sll => return "SLL";
		when code_srl => return "SRL";
		when code_sra => return "SRA";
		when code_rol => return "ROL";
		when code_rolc => return "ROLC";
		when code_ror => return "ROR";
		when code_rorc => return "RORC";
		when code_ldc => return "LDC";
		when code_ldd => return "LDD";
		when code_ldr => return "LDR";
		when code_std => return "STD";
		when code_str => return "STR";
		when code_in => return "IN";
		when code_out => return "OUT";
		when code_jmp => return "JMP";
		when code_jz => return "JZ";
		when code_jc  => return "JC";
		when code_jn => return "JN";
		when code_jo => return "JO";
		when code_jnz  => return "JNZ";
		when code_jnc => return "JNC";
		when code_jnn => return "JNN";
		when code_jno => return "JNO";	
		
		when others =>
			assert FALSE
			report "Illegal command in cmd_image"
			severity warning;
			return "ILL";
		end case;

	end cmd_image;

end IO_defs_pack;