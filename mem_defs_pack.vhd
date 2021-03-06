  -- coded by Mahmoud Kassar

use WORK.cpu_defs_pack.all;
use std.textio.all;

package mem_defs_pack is

	procedure init_memory(variable f : in text; variable mem: out mem_type);

 constant memory_content : mem_type;

  -- EXEC_ldc
procedure EXEC_ldc(constant memory: in mem_type;
		variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean);
  --  EXEC_ldd
  procedure EXEC_ldd(constant memory: in mem_type;
		variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean);
  -- EXEC_ldr
  procedure EXEC_ldr(constant memory: in mem_type;
	        constant Reg_Y: in data_type;
		variable Reg_X: out data_type;
		variable Z, N, O: out Boolean);

  -- EXEC_std
  procedure EXEC_std(variable memory: inout mem_type;
		variable Reg_X: in data_type;
		variable PC: inout addr_type);
  -- EXEC_str
  procedure EXEC_str(variable memory: out mem_type;
		constant Reg_Y, Reg_X: in data_type);

  procedure dump_memory(
		variable f : out text;
		variable mem: in mem_type);
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
		outest: loop 
		exit when endfile (f);
		readline (f, l);
		success := TRUE;
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



	procedure dump_memory(
		variable f : out text;
		variable mem: in mem_type) is

		variable i: addr_type := 0;
		variable l_d: line;
		begin
			for i in 0 to 2**addr_width -1 loop
				write(l_d, mem(i));
				writeline(f,l_d);
			end loop; 
	end dump_memory;


	constant memory_content : mem_type :=
		(0      => code_nop * (2**reg_addr_width)**3,
       		 1      => code_stop * (2**reg_addr_width)**3,
       		 others => 0 );


    --ldc
procedure EXEC_ldc(constant memory: in mem_type;
		variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean) is

  variable data_var: data_type:=0;  
   variable data_int:integer:=0;
  variable p: line;	
  begin
	data_var := memory(PC); 
 	Reg_X := data_var; 
	
	PC:=INC(PC);
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



  -- ldd
  procedure EXEC_ldd(constant memory: in mem_type;
	        variable Reg_X: out data_type;
		variable PC: inout addr_type;
		variable Z, N, O: out Boolean) is
  variable address: data_type:=0;
  variable data_var: data_type:=0;
  variable data_int:integer:=0;	

  begin
	address := memory(PC); 
	data_var := memory(address); 
	Reg_X := data_var;  
	PC:=INC(PC); 
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


  -- ldr
  procedure EXEC_ldr(constant memory: in mem_type;
	        constant Reg_Y: in data_type;
		variable Reg_X: out data_type;
		variable Z, N, O: out Boolean) is
  variable address: data_type:=0;
  variable data_var: data_type:=0;
   variable data_int:integer:=0;	
begin
	address := Reg_Y; 
	data_var := memory(address); 

	Reg_X := data_var; 
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
  	address:=memory(PC);
	memory(address):=Reg_X; 
  end EXEC_std;
  -- end std


  --  str
  procedure EXEC_str(variable memory: out mem_type;
		constant Reg_Y, Reg_X: in data_type) is
  variable address: data_type:=0;
  begin
  	address:= Reg_Y; 	
	memory(address):= Reg_X; 
  end EXEC_str;
  -- end str

end mem_defs_pack;