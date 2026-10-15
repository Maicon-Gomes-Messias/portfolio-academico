LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.all;
----------------------------------------
ENTITY trabalho_ula IS
	PORT (
		a_in, b_in: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		op_sel: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		c_in: IN STD_LOGIC;
		
		r_out: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		c_out: OUT STD_LOGIC;
		z_out: OUT STD_LOGIC
	);
END ENTITY;
----------------------------------------
ARCHITECTURE ula OF trabalho_ula IS

	SIGNAL aux : STD_LOGIC_VECTOR(8 DOWNTO 0);
	
	CONSTANT op_and		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	CONSTANT op_or		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
	CONSTANT op_xor		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
	CONSTANT op_com		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
	CONSTANT op_add		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
	CONSTANT op_addc	: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
	CONSTANT op_sub		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
	CONSTANT op_subc	: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
	CONSTANT op_rl		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
	CONSTANT op_rr		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
	CONSTANT op_rlc		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
	CONSTANT op_rrc		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
	CONSTANT op_sll		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
	CONSTANT op_srl		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1101";
	CONSTANT op_sra		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1110";
	CONSTANT op_pass_b	: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";

BEGIN
	WITH op_sel SELECT
		aux <=	('0' & a_in) AND ('0' & b_in) WHEN op_and, 			-- AND
				('0' & a_in) OR ('0' & b_in) WHEN op_or, 			-- OR
				('0' & a_in) XOR ('0' & b_in) WHEN op_xor, 			-- XOR
				NOT ('0' & a_in) WHEN op_com,						-- COM
				('0' & a_in) + ('0' & b_in) WHEN op_add, 			-- ADD
				('0' & a_in) + ('0' & b_in) + c_in WHEN op_addc, 	-- ADDC
				('0' & a_in) - ('0' & b_in) WHEN op_sub, 			-- SUB
				('0' & a_in) - ('0' & b_in) - c_in WHEN op_subc,	-- SUBC
				('0' & a_in(6 DOWNTO 0)) & a_in(7) WHEN op_rl,		-- RL
				('0' & a_in(0)) & a_in(7 DOWNTO 1) WHEN op_rr,		-- RR
				('0' & a_in (6 DOWNTO 0)) & c_in WHEN op_rlc, 		-- RLC
				c_in & ('0' & a_in (7 DOWNTO 1)) WHEN op_rrc, 		-- RRC
				('0' & a_in (6 DOWNTO 0)) & '0' WHEN op_sll, 		-- SLL
				("00" & a_in(7 DOWNTO 1)) WHEN op_srl, 				-- SRL
				('0' & a_in(7)) & a_in (7 DOWNTO 1) WHEN op_sra,	-- SRA
				('0' & b_in) WHEN op_pass_b; 						-- PASS_B

	r_out <= aux(7 DOWNTO 0);
		
	WITH op_sel SELECT
		c_out <= 	aux(8) WHEN op_add,
					aux(8) WHEN op_addc,
					aux(8) WHEN op_sub,
					aux(8) WHEN op_subc,
					a_in(7) WHEN op_rl,
					a_in(0) WHEN op_rr,
					a_in(7) WHEN op_rlc,
					a_in(0) WHEN op_rrc,
					a_in(7) WHEN op_sll,
					a_in(0) WHEN op_srl,
					a_in(0) WHEN op_sra,
					'0' WHEN OTHERS;
	
	z_out <= '1' WHEN aux = "00000000" ELSE '0';
END ula;