package bit_vector_natural_pack is
	function bit_vector2natural (bv  : in bit_vector) return natural;
	function natural2bit_vector (nat : in natural)    return bit_vector;
end bit_vector_natural_pack;

package body bit_vector_natural_pack is
	function bit_vector2natural (bv : bit_vector) return natural is
		variable nrnat : natural := 0;

		begin
		assert bv'LEFT >= 0 and bv'LEFT < 31;
		assert bv'RIGHT = 0;
		for i in bv'LEFT downto 0 loop
			nrnat := nrnat + bit'pos(bv(i)) * 2;
		end loop;

		return nrnat;
	end bit_vector2natural;

	function natural2bit_vector (nat : in natural) return bit_vector is
		variable result : bit_vector (11 downto 0);
		variable result_temp : natural := nat;

		begin 
		for i in 0 to (11) loop
			result(i) := bit'val(result_temp mod 2); -- bit'val converts the type integer to bit, bit'pos does the opposite 
			result_temp := result_temp/2;
		end loop;

		assert result_temp = 0;
		return result;

	end natural2bit_vector;

end bit_vector_natural_pack;