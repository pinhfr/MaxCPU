package cpu_defs_pack is

	constant bus_width  : natural := 12;
	constant data_width : natural := bus_width;
	constant addr_width : natural := bus_width;
	
	constant reg_addr_width : natural := 2;
	constant opcode_width   : natural := 6;

	subtype data_type is
		natural range 0 to 2**data_width-1;

	subtype addr_type is
		natural range 0 to 2**addr_width-1;

	subtype reg_addr_type is
		natural range 0 to 2**reg_addr_width-1;

	subtype opcode_type is
		natural range 0 to 2**opcode_width-1;

	type reg_type is array(reg_addr_type) of data_type;
	
	type mem_type is array(addr_type) of data_type;
	
	function INC(A : in addr_type ) return addr_type;

	procedure Set_Flags_Load (T_s : in integer; Z, N, O : inout boolean);
	procedure Set_Flags_load(result, origin: in data_type; Z, N, O: inout boolean);

	constant code_nop : opcode_type  := 0;
	constant code_stop : opcode_type := 1;
	constant code_add : opcode_type  := 2;
	constant code_addc : opcode_type := 3;
	constant code_sub : opcode_type  := 4;
	constant code_subc : opcode_type := 5;
	constant code_not : opcode_type  := 6;
	constant code_and : opcode_type  := 7;
	constant code_or : opcode_type   := 8;
	constant code_xor : opcode_type  := 9;
	constant code_rea : opcode_type  := 10;
	constant code_reo : opcode_type  := 11;
	constant code_rex : opcode_type  := 12;
	constant code_sll : opcode_type  := 13;
	constant code_srl : opcode_type  := 14;
	constant code_sra : opcode_type  := 15;
	constant code_rol : opcode_type  := 16;
	constant code_rolc : opcode_type := 17;
	constant code_ror : opcode_type  := 18;
	constant code_rorc : opcode_type := 19;
	constant code_ldc : opcode_type  := 32;
	constant code_ldd : opcode_type  := 33;
	constant code_ldr : opcode_type  := 34;
	constant code_std : opcode_type  := 35;
	constant code_str : opcode_type  := 36;
	constant code_in : opcode_type   := 37;
	constant code_out : opcode_type  := 38;
	constant code_jmp : opcode_type  := 48;
	constant code_jz : opcode_type   := 49;            
	constant code_jc : opcode_type   := 50;                            
	constant code_jn  : opcode_type  := 51;            
	constant code_jo : opcode_type   := 52;                                        
	constant code_jnz : opcode_type  := 53;                                    
	constant code_jnc : opcode_type  := 54;
	constant code_jnn : opcode_type  := 55;
	constant code_jno : opcode_type  := 56;

end cpu_defs_pack;

package body cpu_defs_pack is

	function INC(A : in addr_type ) return addr_type is
		begin

		return (A + 1) mod 2**addr_width;

	end INC;
	
	procedure Set_Flags_Load (T_s : in integer; Z, N, O : inout boolean) is
		
		begin
			if T_s >= 2**data_width then
			O := true;
			if T_s mod 2*data_width = 0 then
				Z := true;
			else Z := false;
			end if;
		elsif T_s < -2**data_width then
			O := true;
			if 2**(data_width+1)*T_s mod 2*data_width = 0 then
				Z := true;
			else Z := false;
			end if;
		elsif T_s < 0 then
			N := true;
			if 2**(data_width)*T_s mod 2*data_width = 0 then
				Z := true;
			else Z := false;
			end if;
		end if;
	end procedure;

	procedure Set_Flags_load(result, origin: in data_type; Z, N, O: inout boolean) is
		begin
			if result / 2**(data_width - 1) = origin / 2**(data_width - 1) then --if the msb are alike
				O:= false;
			else O:= true;
			end if;
			if result / 2**(data_width - 1) = 1 then N:= true; else N:= false; end if;
			if result = 0 then Z:= true; else Z:= false; end if;
		end procedure;

end cpu_defs_pack;