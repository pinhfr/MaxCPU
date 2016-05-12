use WORK.bit_vector_natural_pack.all;
use WORK.cpu_defs_pack.all;

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
		return WORK.bit_vector_natural_pack.bit_vector2natural(
			not WORK.bit_vector_natural_pack.natural2bit_vector(A)
		);
	end "NOT";

	-- X := Y AND Z
	function "AND" (constant A, B: data_type) return data_type is
		return WORK.bit_vector_natural_pack.bit_vector2natural(
			WORK.bit_vector_natural_pack.natural2bit_vector(A) 
			and 
			WORK.bit_vector_natural_pack.natural2bit_vector(B)
		);
	end "AND";

	-- X := Y OR Z
	function "OR" (constant A, B: data_type) return data_type is
		return WORK.bit_vector_natural_pack.bit_vector2natural(
			WORK.bit_vector_natural_pack.natural2bit_vector(A) 
			or 
			WORK.bit_vector_natural_pack.natural2bit_vector(B)
		);
	end "OR";

	-- X := Y XOR Z
	function "XOR" (constant A, B: data_type) return data_type is
		return WORK.bit_vector_natural_pack.bit_vector2natural(
			WORK.bit_vector_natural_pack.natural2bit_vector(A) 
			xor 
			WORK.bit_vector_natural_pack.natural2bit_vector(B)
		);
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
