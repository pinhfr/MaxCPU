package logical_defs_pack is
	function "NOT" (constant A    : data_type)
		return data_type;
	function "AND" (constant A, B : data_type)	
		return data_type;
	function "OR"  (constant A, B : data_type)
		return data_type;
	function "XOR" (constant A, B : data_type)
		return data_type;
	function "REA" (constant A    : data_type)
		return data_type;
	function "REO" (constant A    : data_type)
		return data_type;
	function "REX" (constant A    : data_type)
		return data_type;
end logical_defs_pack;

package body logical_defs_pack is
	-- X := NOT Y
	function "NOT" (constant A: data_type) return data_type is
	--
	--
	end "NOT";

	-- X := Y AND Z
	function "AND" (constant A, B: data_type) return data_type is
	--
	--
	end "AND";

	-- X := Y OR Z
	function "OR" (constant A, B: data_type) return data_type is
	--
	--
	end "OR";

	-- X := Y XOR Z
	function "XOR" (constant A, B: data_type) return data_type is
	--
	--
	end "XOR";

	-- Use AND operator on all bits of Y and assign it to the least significant bit of X
	function "REA" (constant A: data_type) return data_type is
	--
	--
	end "REA";

	-- Use OR operator on all bits of Y and assign it to the least significant bit of X
	function "REO" (constant A: data_type) return data_type is
	--
	--
	end "REO";

	-- Use XOR operator on all bits of Y and assign it to the least significant bit of X
	function "REX" (constant A: data_type) return data_type is
	--
	--
	end "REX";
end logical_defs_pack;
