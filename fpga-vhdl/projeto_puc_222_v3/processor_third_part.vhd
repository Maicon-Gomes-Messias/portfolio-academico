LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;

ENTITY processor_third_part IS
	GENERIC (
		base_addr : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000" -- endereço de escrita na port_reg/leitura do latch
	);	
	PORT (
		clk_in, nrst : IN STD_LOGIC; 					-- clock e reset
		abus : IN STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- entrada de endereçamento dos regs de 8 bits
		dbus : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0); 		-- barramento bidirecional de dados de 8 bits
		wr_en : IN STD_LOGIC; 							-- habilitação de escrita nos regs
		rd_en : IN STD_LOGIC; 							-- habilitação de leitura
		port_io : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0) 	-- porta bidirecional com 8 bits
	);
END ENTITY;

ARCHITECTURE port_io OF processor_third_part IS
	SIGNAL port_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL dir_reg : STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL latch : STD_LOGIC_VECTOR(7 DOWNTO 0);
	CONSTANT one  : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000001";	
	
	SIGNAL i : INTEGER; --iterador do for
	BEGIN
		
	PROCESS(nrst, clk_in, abus, dbus, wr_en, rd_en, latch, dir_reg, port_reg)
		BEGIN
			-- Resset
			IF nrst = '0' THEN 
				port_reg <= (OTHERS => '0');
				dir_reg <= (OTHERS => '0');
			ELSIF RISING_EDGE(clk_in) THEN
				-- Escrita nos registradores port_reg e dir_reg
				IF wr_en = '1' AND (abus = base_addr) THEN 
					port_reg <= dbus; -- Escrita em port_reg
				ELSIF wr_en = '1' AND (abus = (base_addr + one)) THEN
					dir_reg <= dbus; -- Escrita em dir_reg
				END IF;			
			END IF;
			
			-- Leitura dos registradores
			IF rd_en = '1' AND (abus = base_addr) THEN
				dbus <= latch; -- Leitura do latch
			ELSIF rd_en = '1' AND (abus = (base_addr + one)) THEN
				dbus <= dir_reg;  -- Leitura do dir_reg
			ELSE
				dbus <= "ZZZZZZZZ";
			END IF;
			
			FOR i IN 0 TO 7 LOOP
				IF dir_reg(i) = '1' THEN
					port_io(i) <= port_reg(i);
				ELSE
					port_io(i) <= 'Z';
				END IF;
			END LOOP;		
		END PROCESS;
		
		PROCESS(rd_en, port_io, abus)
		BEGIN
			IF NOT(rd_en = '1' AND (abus = base_addr)) THEN
				latch <= port_io;
			END IF;
		END PROCESS;		
		
END port_io;