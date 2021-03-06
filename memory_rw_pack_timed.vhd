package memory_rw_pack_timed is

	subtype word is integer range 0 to 4095;

	procedure memory_read (constant Td : in time;
			       constant r_addr : in word;
			       variable r_data : out word;
			       signal w_en : out boolean;
			       signal addr : out word;
			       signal data_from_memory: in word);

	procedure memory_write (constant Td : in time;
			        constant w_addr : in word;
			        constant w_data : in word;
			        signal w_en : out boolean;
			        signal addr : out word;
			        signal data_to_memory: out word);

end memory_rw_pack_timed;

package body memory_rw_pack_timed is

	procedure memory_write (constant Td : in time;
			        constant w_addr : in word;
			        constant w_data : in word;
			        signal w_en : out boolean;
			        signal addr : out word;
			        signal data_to_memory: out word) is
	begin
		assert Td > 0 ns;
		addr <= w_addr;
		data_to_memory <= w_data;
		w_en <= TRUE;
		wait for Td;
		w_en <= FALSE;
		wait for Td;
	end memory_write;
	
	procedure memory_read (constant Td : in time;
			       constant r_addr : in integer range 0 to 4095;
			       variable r_data : out word;
			       signal w_en : out boolean;
			       signal addr : out word;
			       signal data_from_memory: in word) is
	begin
		assert Td > 0 ns;
		addr <= r_addr;
		w_en <= FALSE;
		wait for Td;
		r_data := data_from_memory;
		wait for Td;
	end memory_read;

end memory_rw_pack_timed;
