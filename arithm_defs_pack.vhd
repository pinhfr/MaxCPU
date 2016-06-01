library ieee ;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

use WORK.cpu_defs_pack.all;
use WORK.mem_defs_pack.all;
--ramzi
package arithm_defs_pack is
	
	--- procedure ADDC declaration

	procedure EXEC_ADDC (	
	      constant A, B     : in data_type;				
	      constant CI       : in boolean;
	      variable R        : out data_type;
	      variable Z,CO,N,O : inout boolean);
				
	--- procedure SUBC declaration
	
	procedure EXEC_SUBC (	
	      constant A, B     : in data_type;				
	      constant CI       : in boolean;
	      variable R        : out data_type;
	      variable Z,CO,N,O : inout boolean);
	

end arithm_defs_pack;


package body arithm_defs_pack is
	
	---- procedure ADDC implementation
	
	procedure EXEC_ADDC (	
	  constant A, B     : in data_type; --- input variables
		constant CI       : in boolean; --- input carry 
		variable R        : out data_type;  --- result
		variable Z,CO,N,O : inout boolean) is --- zero,  carry output, Negative,   Overflow
				
          variable T: integer := A+B+Boolean'Pos(CI); -- make the unsigned sum
	  variable p: line;
	variable A_s, B_s, T_s :integer; -- signed interpretation

	  begin
	    --- determine the sign of A
	    if A >= 2**(data_width-1) then 
	      A_s := A - 2**(data_width);
	    else 
	      A_s := A;
	    end if;
	  
	    --- determine the sign of B
	    if B >= 2**(data_width-1) then
	      B_s := B - 2**(data_width);
	    else 
	      B_s := B;
	    end if;
		
	    T_s := A_s + B_s + Boolean'Pos( CI ); -- make the signed sum
	   
	   if T_s >= 2**(data_width-1) or T_s < -2**(data_width-1) then CO:= true;
	   else CO := false; end if;
		
	    Set_Flags_Load(T_s, Z, N, O);
	    if T_s<0 then 
		R := T_s + 2**data_width;
	    else
		R:= T_s mod 2**data_width;
	    end if;
	end EXEC_ADDC;  
	
	---- procedure SUBC implemantation
	
	procedure EXEC_SUBC (	
          constant A, B     : in data_type;  --- input variables
	  constant CI       : in boolean;  --- input carry 
          variable R        : out data_type;   --- result
	  variable Z,CO,N,O : inout boolean )is --- zero, output carry, Negative,   Overflow
				
	variable T: integer := A-B-Boolean'Pos( CI );
	variable A_s, B_s, T_s :integer; -- signed interpretation
	begin
	  --- determine the sign of A
	  if A >= 2**(data_width-1) then 
	    A_s := A-2**(data_width);
	  else 
	    A_s := A;
	  end if;
	  --- determine the sign of B
	  if B >= 2**(data_width-1) then
	    B_s := B-2**(data_width);
	  else 
	    B_s := B;
	  end if;
		
		T_s := A_s-B_s-Boolean'Pos( CI );
		
		 if T_s >= 2**(data_width-1) or T_s < -2**(data_width-1) then CO:= true;
	   else CO := false; end if;
		
	    Set_Flags_Load(T_s, Z, N, O);
	    if T_s<0 then 
		R := T_s + 2**data_width;
	    else
		R:= T_s mod 2**data_width;
            end if;
	end EXEC_SUBC;
	

end arithm_defs_pack;