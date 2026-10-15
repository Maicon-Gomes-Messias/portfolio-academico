LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY registradores IS
	PORT (
		clk_in, nrst : IN STD_LOGIC;
		regn_di : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		regn_wr_sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		regn_wr_ena : IN STD_LOGIC;
		regn_rd_sel_a : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		regn_rd_sel_b : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		regz_di : IN STD_LOGIC;
		regz_wr_ena : IN STD_LOGIC;
		regc_di : IN STD_LOGIC;
		regc_wr_ena : IN STD_LOGIC;
		
		regn_do_a : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		regn_do_b : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		regz_do : OUT STD_LOGIC;
		regc_do : OUT STD_LOGIC
	);
END ENTITY;

ARCHITECTURE arch OF registradores IS
	SIGNAL reg_r0 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_r1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_r2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_r3 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_r4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_r5 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_r6 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL reg_r7 : STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	SIGNAL reg_rz : STD_LOGIC;
	SIGNAL reg_rc : STD_LOGIC;
	
	SIGNAL selecao_wr : INTEGER;
	SIGNAL selecao_rd_a : INTEGER;
	SIGNAL selecao_rd_b : INTEGER;
BEGIN

PROCESS(nrst, clk_in, regn_wr_ena, regn_rd_sel_a, regn_rd_sel_b, selecao_rd_a, selecao_rd_b,
		regn_wr_sel, reg_r0, reg_r1, reg_r2, reg_r3, reg_r4, reg_r5, reg_r6, reg_r7)
	-- Escrita e Leitura nos registradores R0-7
	BEGIN
		
		selecao_wr 	 <= to_integer(unsigned(regn_wr_sel(2 DOWNTO 0))); 	 --converte os bits de selecao da escrita para inteiro
		selecao_rd_a <= to_integer(unsigned(regn_rd_sel_a(2 DOWNTO 0))); --converte os bits de selecao da leitura A para inteiro
		selecao_rd_b <= to_integer(unsigned(regn_rd_sel_b(2 DOWNTO 0))); --converte os bits de selecao da leitura B para inteiro
		
		IF nrst = '0' THEN
			reg_r0 <= (OTHERS => '0');
			reg_r1 <= (OTHERS => '0');
			reg_r2 <= (OTHERS => '0');
			reg_r3 <= (OTHERS => '0');
			reg_r4 <= (OTHERS => '0');
			reg_r5 <= (OTHERS => '0');
			reg_r6 <= (OTHERS => '0');
			reg_r7 <= (OTHERS => '0');
		
		ELSIF RISING_EDGE(clk_in) AND regn_wr_ena = '1' THEN
			--Escrita nos resgistradores R0-7
			CASE selecao_wr IS
				WHEN 0 => reg_r0 <= regn_di;
				WHEN 1 => reg_r1 <= regn_di;
				WHEN 2 => reg_r2 <= regn_di;
				WHEN 3 => reg_r3 <= regn_di;
				WHEN 4 => reg_r4 <= regn_di;
				WHEN 5 => reg_r5 <= regn_di;
				WHEN 6 => reg_r6 <= regn_di;
				WHEN OTHERS => reg_r7 <= regn_di;
			END CASE;
		
		END IF;
		
		-- Saída A
		CASE selecao_rd_a IS
			WHEN 0 => regn_do_a <= reg_r0;
			WHEN 1 => regn_do_a <= reg_r1;
			WHEN 2 => regn_do_a <= reg_r2;
			WHEN 3 => regn_do_a <= reg_r3;
			WHEN 4 => regn_do_a <= reg_r4;
			WHEN 5 => regn_do_a <= reg_r5;
			WHEN 6 => regn_do_a <= reg_r6;
			WHEN OTHERS => regn_do_a <= reg_r7;
		END CASE;
		
		-- Saída B
		CASE selecao_rd_b IS
			WHEN 0 => regn_do_b <= reg_r0;
			WHEN 1 => regn_do_b <= reg_r1;
			WHEN 2 => regn_do_b <= reg_r2;
			WHEN 3 => regn_do_b <= reg_r3;
			WHEN 4 => regn_do_b <= reg_r4;
			WHEN 5 => regn_do_b <= reg_r5;
			WHEN 6 => regn_do_b <= reg_r6;
			WHEN OTHERS => regn_do_b <= reg_r7;
		END CASE;
		
	END PROCESS;
	
PROCESS (regz_wr_ena, regc_wr_ena, regz_di, regc_di, reg_rz, reg_rc, nrst, clk_in)
	--Escrita e Leitura nos registradores RZ e RC
	BEGIN
		IF nrst = '0' THEN
			reg_rc <= '0';
			reg_rz <= '0';
		ELSIF RISING_EDGE(clk_in) THEN
			--Escrita no resgistrador RZ
			IF regz_wr_ena = '1' THEN
				reg_rz <= regz_di;
			END IF;
			
			IF regc_wr_ena = '1' THEN
				reg_rc <= regc_di;
			END IF;
			
		END IF;
				
		regz_do <= reg_rz;
		regc_do <= reg_rc;
		
	END PROCESS;

END arch;