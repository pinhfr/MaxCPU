use WORK.cpu_defs_pack.all;
use std.textio.all;

package mem_defs_pack is

	procedure init_memory(variable f : in text; variable mem: out mem_type);

 constant memory_content : mem_type;
procedure EXEC_ldc(constant memory: in mem_type;
		variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean);
  -- declaration EXEC_ldd
  procedure EXEC_ldd(constant memory: in mem_type;
		variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean);
  -- declaration EXEC_ldr
  procedure EXEC_ldr(constant memory: in mem_type;
	        constant Reg_Y: in data_type;
		variable Reg_X: out data_type;
		variable Z, N, O: out Boolean);

  -- declaration EXEC_std
  procedure EXEC_std(variable memory: inout mem_type;
		variable Reg_X: in data_type;
		variable PC: inout addr_type);
  -- declaration EXEC_str
  procedure EXEC_str(variable memory: out mem_type;
		constant Reg_Y, Reg_X: in data_type);

end mem_defs_pack;

package body mem_defs_pack is

	procedure init_memory(
		variable f : in text;
		variable mem: out mem_type) is
		
		variable l: line;
		variable success : boolean;
		variable v: data_type;
		variable i: addr_type := 0;
	
		begin
		
		outest: loop -- read line by line
		
		exit when endfile (f);
		readline (f, l);
	
		success := TRUE;
		-- read values in each line
		
		while success loop

			read (l, v, success);
			if success then
				mem (i):=v;
				exit outest when
					i = 2**addr_width -1;
					i := i+1;
			end if;
		end loop;
		end loop;
	end init_memory;

	constant memory_content : mem_type :=
		(0      => code_nop * (2**reg_addr_width)**3,
       		 1      => code_stop * (2**reg_addr_width)**3,
       		 others => 0 );

	procedure EXEC_ldc(constant memory: in mem_type;
		variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean) is

  variable data_var: data_type:=0;  
   variable data_int:integer:=0;	
  begin
	data_var := memory(PC); -- take content from memory(PC)
 	Reg_X := data_var; -- store it in Reg(X)
	PC:=INC(PC); -- increment PC by 1
	if data_var >= 2**(data_width-1) then
 		data_int:= data_var -2**(data_width);
	end if;
	if data_int<0 then
		 N:=TRUE; 
	end if;
	if data_var=0 then 
		Z:=TRUE; 
	end if;
	O:=FALSE;
  end EXEC_ldc;
  -- end ldc

  -- Defintion ldd
  procedure EXEC_ldd(constant memory: in mem_type;
	        variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean) is
  variable address: data_type:=0;
  variable data_var: data_type:=0;
  variable data_int:integer:=0;	
  begin
	address := memory(PC); -- address is the value in memory(PC)
	data_var := memory(address); -- take content from memory(address)
	Reg_X := data_var;  -- store it in Reg(X)
	PC:=INC(PC); -- increment PC by 1
	if data_var >= 2**(data_width-1) then
 		data_int:= data_var -2**(data_width);
	end if;
	if data_int<0 then
		 N:=TRUE; 
	end if;
	if data_var=0 then 
		Z:=TRUE; 
	end if;
	O:=FALSE;
  end EXEC_ldd;
  -- end ldd

  -- Defintion ldr
  procedure EXEC_ldr(constant memory: in mem_type;
	        constant Reg_Y: in data_type;
		variable Reg_X: out data_type;
		variable Z, N, O: out Boolean) is
  variable address: data_type:=0;
  variable data_var: data_type:=0;
   variable data_int:integer:=0;	
begin
	address := Reg_Y; -- address is the value in Reg(Y)
	data_var := memory(address); -- take content from memory(address)
	Reg_X := data_var;  -- store it in Reg(X)
	if data_var >= 2**(data_width-1) then
 		data_int:= data_var -2**(data_width);
	end if;
	if data_int<0 then
		 N:=TRUE; 
	end if;
	if data_var=0 then 
		Z:=TRUE; 
	end if;
	O:=FALSE;
  end EXEC_ldr;
  -- end ldr

  -- std
  procedure EXEC_std(variable memory: inout mem_type;
		variable Reg_X: in data_type;
		variable PC: inout addr_type) is

  variable address:data_type:=0; 
  begin
  	address:=memory(PC); -- address is the value in memory(PC)
	memory(address):=Reg_X; -- assign content of Reg(X) in memory indexed by address
	PC:=INC(PC); -- increment PC by 1
  end EXEC_std;
  -- end std

  -- Defintion str
  procedure EXEC_str(variable memory: out mem_type;
		constant Reg_Y, Reg_X: in data_type) is
  variable address: data_type:=0;
  begin
  	address:= Reg_Y; 	-- address is the value in memory(PC)
	memory(address):= Reg_X;  -- assign content of Reg(X) in memory indexed by address
  end EXEC_str;
  -- end str



end mem_defs_pack;