entity and2 is
	port( a : in bit; b : in bit; c : out bit); 
end and2;

architecture RTL of and2 is
Begin
--all Read Signals in Sensitivity List
	process(a, b) 
	begin
		c <= a AND b;
	end process;
end RTL; 