library ieee;
use ieee.std_logic_1164.all;

entity bregMIPS is
	port (
			clk, wreg : in std_logic;
			add1, add2, wadd : in std_logic_vector(4 downto 0);
			wdata : in std_logic_vector(31 downto 0);
			r1, r2 : out std_logic_vector(31 downto 0));
end bregMIPS;

--• wreg: sinal de escrita. Ao ser acionado, o registrador endereçado por wadd é
--			 escrito com o valor presente no barramento wdata na transição de subida do
--			 relógio.
--• clk: relógio do circuito.
--• add1: endereço do registrador a ser lido em r1, 5 bits.
--• add2: endereço do registrador a ser lido em r2, 5 bits.
--• wdata: valor a ser escrito no registrador endereçado por wadd, 32 bits.
--• r1: barramento de saída para leitura do registrador endereçado por add1.
--• r2: barramento de saída para leitura do registrador endereçado por add2.

architecture arc_bregMIPS of bregMIPS is

signal rzero, rat, rv0, rv1, ra0, ra1, ra2, ra3: std_logic_vector(31 downto 0); 
signal rt0, rt1, rt2, rt3, rt4, rt5, rt6, rt7 : std_logic_vector(31 downto 0);
signal rs0, rs1, rs2, rs3, rs4, rs5, rs6, rs7 : std_logic_vector(31 downto 0);
signal rt8, rt9, rk0, rk1, rgp, rsp, rfp, rra : std_logic_vector(31 downto 0);
		
begin
	process (clk)
	begin

		if (wreg = '1') and (rising_edge(clk)) then
			case wadd is 
				when "00000" => rzero <= X"00000000";
				when "00001" => rat <= wdata; 
				when "00010" => rv0 <= wdata; 
				when "00011" => rv1 <= wdata;
				when "00100" => ra0 <= wdata;
				when "00101" => ra1 <= wdata;
				when "00110" => ra2 <= wdata;
				when "00111" => ra3 <= wdata;
				when "01000" => rt0 <= wdata;
				when "01001" => rt1 <= wdata;
				when "01010" => rt2 <= wdata;
				when "01011" => rt3 <= wdata;
				when "01100" => rt4 <= wdata;
				when "01101" => rt5 <= wdata;
				when "01110" => rt6 <= wdata;
				when "01111" => rt7 <= wdata;
				when "10000" => rs0 <= wdata;
				when "10001" => rs1 <= wdata;
				when "10010" => rs2 <= wdata;
				when "10011" => rs3 <= wdata;
				when "10100" => rs4 <= wdata;
				when "10101" => rs5 <= wdata;
				when "10110" => rs6 <= wdata;
				when "10111" => rs7 <= wdata;
				when "11000" => rt8 <= wdata;
				when "11001" => rt9 <= wdata;
				when "11010" => rk0 <= wdata;
				when "11011" => rk1 <= wdata;
				when "11100" => rgp <= wdata;
				when "11101" => rsp <= wdata;
				when "11110" => rfp <= wdata; 
				when others => rra <= wdata;
			 end case;
		end if;
		
		case add1 is 
			when "00000" => r1 <= X"00000000";
			when "00001" => r1 <= rat; 
			when "00010" => r1 <= rv0; 
			when "00011" => r1 <= rv1;
			when "00100" => r1 <= ra0;
			when "00101" => r1 <= ra1;
			when "00110" => r1 <= ra2;
			when "00111" => r1 <= ra3;
			when "01000" => r1 <= rt0;
			when "01001" => r1 <= rt1;
			when "01010" => r1 <= rt2;
			when "01011" => r1 <= rt3;
			when "01100" => r1 <= rt4;
			when "01101" => r1 <= rt5;
			when "01110" => r1 <= rt6;
			when "01111" => r1 <= rt7;
			when "10000" => r1 <= rs0;
			when "10001" => r1 <= rs1;
			when "10010" => r1 <= rs2;
			when "10011" => r1 <= rs3;
			when "10100" => r1 <= rs4;
			when "10101" => r1 <= rs5;
			when "10110" => r1 <= rs6;
			when "10111" => r1 <= rs7;
			when "11000" => r1 <= rt8;
			when "11001" => r1 <= rt9;
			when "11010" => r1 <= rk0;
			when "11011" => r1 <= rk1;
			when "11100" => r1 <= rgp;
			when "11101" => r1 <= rsp;
			when "11110" => r1 <= rfp;
			when others => r1 <= rra;
		 end case;
		
		case add2 is 
			when "00000" => r2 <= X"00000000";
			when "00001" => r2 <= rat; 
			when "00010" => r2 <= rv0; 
			when "00011" => r2 <= rv1;
			when "00100" => r2 <= ra0;
			when "00101" => r2 <= ra1;
			when "00110" => r2 <= ra2;
			when "00111" => r2 <= ra3;
			when "01000" => r2 <= rt0;
			when "01001" => r2 <= rt1;
			when "01010" => r2 <= rt2;
			when "01011" => r2 <= rt3;
			when "01100" => r2 <= rt4;
			when "01101" => r2 <= rt5;
			when "01110" => r2 <= rt6;
			when "01111" => r2 <= rt7;
			when "10000" => r2 <= rs0;
			when "10001" => r2 <= rs1;
			when "10010" => r2 <= rs2;
			when "10011" => r2 <= rs3;
			when "10100" => r2 <= rs4;
			when "10101" => r2 <= rs5;
			when "10110" => r2 <= rs6;
			when "10111" => r2 <= rs7;
			when "11000" => r2 <= rt8;
			when "11001" => r2 <= rt9;
			when "11010" => r2 <= rk0;
			when "11011" => r2 <= rk1;
			when "11100" => r2 <= rgp;
			when "11101" => r2 <= rsp;
			when "11110" => r2 <= rfp;
			when others => r2 <= rra;
		 end case;
		
	end process;
end arc_bregMIPS;
	
	
	
	
	
	
	

