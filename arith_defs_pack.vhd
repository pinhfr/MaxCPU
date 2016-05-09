library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use WORK.cpu_defs_pack.all;
use WORK.mem_defs_pack.all;

package arith_defs_pack is
	-- boolean variable CI determines whether the function will run as a ADDC or SUBC or not

	-- false: EXEC_ADD  -> R := A + B 
	--	  EXEC_SUB  -> R := A - B

	-- true:  EXEC_ADD  -> R := A + B + Carry
 	--        EXEC_SUBC -> R := A - B - Carry

	procedure EXEC_ADD (	constant A, B:	 in data_type;				
				CI:	 	 in boolean;
				R: 		 out data_type;
				Z,CO,N,O: 	 out boolean);
	
	procedure EXEC_SUB (	constant A, B:	 in data_type;
				CI:		 in boolean;
				D: 		 out data_type;
				Z,CO,N,O: 	 out boolean);
end arith_defs_pack;

package body arith_defs_pack is
	procedure EXEC_ADD (	constant A, B:	 in data_type;
				CI:		 in boolean;
				R: 		 out data_type;
				Z,CO,N,O: 	 out boolean)
	is

	--
	--
	--

	end EXEC_ADD;

	procedure EXEC_SUB (	constant A, B:  in data_type;
				CI:	 	in boolean;
				R: 		out data_type;
				Z,CO,N,O: 	out boolean)
	is
	--
	--
	--

	end EXEC_SUB;

end arith_defs_pack;