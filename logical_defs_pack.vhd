use WORK.cpu_defs_pack.all;

package logical_defs_pack is
	function "NOT"  (constant A    : data_type)
		return data_type;
	function "AND"  (constant A, B : data_type)	
		return data_type;
	function "OR"   (constant A, B : data_type)
		return data_type;
	function "XOR"  (constant A, B : data_type)
		return data_type;
	function REA  (constant A      : data_type)
		return bit;
	function REO  (constant A      : data_type)
		return bit;
	function REX  (constant A      : data_type)
		return bit;
	function setLsb (constant A: data_type; constant b_set: bit)
		return data_type;
end logical_defs_pack;

package body logical_defs_pack is
	-- X := NOT Y
	function "NOT" (constant A: data_type) return data_type is
		begin

		return 2**data_width - 1 - A;

	end "NOT";

	-- X := Y AND Z
	function "AND" (constant A, B: data_type) return data_type is
		variable c : data_type; 
		begin 
		c:=0;
		for i in 0 to data_width - 1 loop
				c :=c+2**(data_width-1-i)*((A mod 2**(data_width-i))/2**(data_width-1-i))*((B mod 2**(data_width-i))/2**(data_width-1-i));
			end loop;
		return c;
	end "AND";

	-- X := Y OR Z
	function "OR" (constant A, B: data_type) return data_type is
		variable c,v : data_type; 
		begin 
		c:=0;
		v:=0;
		for i in 0 to data_width - 1 loop
				v:=((A mod 2**(data_width-i))/2**(data_width-1-i))+((B mod 2**(data_width-i))/2**(data_width-1-i))+((A mod 2**(data_width-i))/2**(data_width-1-i))*((B mod 2**(data_width-i))/2**(data_width-1-i));
				c :=c+2**(data_width-1-i)*(v mod 2);
			end loop;
		return c;
	end "OR";

	-- X := Y XOR Z
	function "XOR" (constant A, B: data_type) return data_type is
		variable c,v : data_type; 
		begin 
		c:=0;
		v:=0;
		for i in 0 to data_width - 1 loop
				v:=((A mod 2**(data_width-i))/2**(data_width-1-i))+((B mod 2**(data_width-i))/2**(data_width-1-i));
				c :=c+2**(data_width-1-i)*(v mod 2);
			end loop;
		return c;
	end "XOR";

	-- Use AND operator on all bits of Y and assign it to the least significant bit of X
	function REA (constant A: data_type) return bit is

		begin
		if A = 2**data_width-1 then 
			return '1';
		else 
			return '0';

		end if;
	end REA;

	-- Use OR operator on all bits of Y and assign it to the least significant bit of X
	function REO (constant A: data_type) return bit is
		begin
		if A = 0 then 
			return '0';
		else 
			return '1';

		end if;
	end REO;

	-- Use XOR operator on all bits of Y and assign it to the least significant bit of X
	function REX (constant A: data_type) return bit is
		variable c : data_type; 
		begin 
		c:=0;
		for i in 0 to data_width - 1 loop
				c :=c+((A mod 2**(data_width-i))/2**(data_width-1-i));
			end loop;
		if c mod 2 = 1 then
			return '1';
		else 
			return '0';
		end if; 
	end REX;

	function setLsb (constant A: data_type; constant b_set: bit) return data_type is

		variable tmp_x : bit_vector((addr_width-1) downto 0);		

		begin
		
		if b_set = '1' then return (A / 2) * 2 + 1;
 		else return (A / 2) * 2;
		end if;
	end setLsb;

end logical_defs_pack;
