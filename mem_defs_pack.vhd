use WORK.cpu_defs_pack.all;

package mem_defs_pack is
	function init_memory return mem_type;
end mem_defs_pack;

package body mem_defs_pack is
	function init_memory return mem_type is
	begin

	return(
		0 => code_nop * (2**reg_addr_width)**3,
		1 => code_stop * (2**reg_addr_width)**3,
		others => 0 
	);

	end init_memory;
end mem_defs_pack;