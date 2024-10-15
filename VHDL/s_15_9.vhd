library IEEE;
use IEEE.std_logic_1164.all;

package filter_pack is
  type tkernel is array (NATURAL range <>, NATURAL range <>) of std_logic;
--  type tkernel is array (NATURAL range <>) of std_logic_vector; --2008
end filter_pack;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity med_swp is
   generic(
      DATA_WIDTH  : integer
   );
   port(
      RESET : in std_logic;
      CLK   : in std_logic;

      X     : in std_logic_vector(DATA_WIDTH-1 downto 0);
      Y     : in std_logic_vector(DATA_WIDTH-1 downto 0);

      MIN    : out std_logic_vector(DATA_WIDTH-1 downto 0);
      MAX    : out std_logic_vector(DATA_WIDTH-1 downto 0)
   );
end entity med_swp;

architecture behavioral of med_swp is
signal mmin : std_logic_vector(DATA_WIDTH-1 downto 0);
signal mmax : std_logic_vector(DATA_WIDTH-1 downto 0);
begin

-- max, min process
process(X, Y)
begin
   if (X > Y) then
      mmax <= X;
      mmin <= Y;
   else
      mmax <= Y;
      mmin <= X;
   end if;
end process;

process(RESET, CLK)
begin
   if (RESET = '1') then
   elsif (CLK'event AND CLK = '1') then
      MAX <= mmax;
      MIN <= mmin;
   end if;
end process;

end architecture behavioral; 

library IEEE;
use IEEE.std_logic_1164.all;

entity reg is
   generic(
      DATA_WIDTH  : integer
   );
   port(
      RESET : in std_logic;
      CLK   : in std_logic;

      X     : in std_logic_vector(DATA_WIDTH-1 downto 0);
      Q     : out std_logic_vector(DATA_WIDTH-1 downto 0)
   );
end entity reg;

architecture behavioral of reg is
begin

process(CLK)
begin
   if (CLK'event AND CLK = '1') then
      Q <= X;
   end if;
end process;

end architecture behavioral;


library ieee;
use ieee.std_logic_1164.all;
use work.filter_pack.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.filter_pack.all;

entity median_15 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 14,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_15 is
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_4_1, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0, sig_14_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_16_1, sig_15_1, sig_15_2, sig_18_1, sig_17_1, sig_18_2, sig_19_1, sig_20_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_1, sig_24_1, sig_29_1, sig_30_1, sig_31_2, sig_32_2, sig_34_1, sig_33_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_2, sig_35_3, sig_36_3, sig_42_1, sig_41_1, sig_46_2, sig_45_2, sig_50_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_49_2, sig_49_3, sig_51_2, sig_52_2, sig_51_3, sig_53_3, sig_54_3, sig_58_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_4, sig_73_4, sig_74_4, sig_75_5, sig_76_5, sig_83_5, sig_84_5, sig_83_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_89_2, sig_90_2, sig_92_3, sig_91_3, sig_92_4, sig_92_5, sig_98_6, sig_97_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_7, sig_110_7, sig_109_7, sig_115_8, sig_116_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
begin
  cons: for i in 0 to DATA_WIDTH-1 generate
    sig_0_0(i) <= sig_in(0,i);
    sig_1_0(i) <= sig_in(1,i);
    sig_2_0(i) <= sig_in(2,i);
    sig_3_0(i) <= sig_in(3,i);
    sig_4_0(i) <= sig_in(4,i);
    sig_5_0(i) <= sig_in(5,i);
    sig_6_0(i) <= sig_in(6,i);
    sig_7_0(i) <= sig_in(7,i);
    sig_8_0(i) <= sig_in(8,i);
    sig_9_0(i) <= sig_in(9,i);
    sig_10_0(i) <= sig_in(10,i);
    sig_11_0(i) <= sig_in(11,i);
    sig_12_0(i) <= sig_in(12,i);
    sig_13_0(i) <= sig_in(13,i);
    sig_14_0(i) <= sig_in(14,i);
  end generate;
  reg_4_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Q => sig_4_1
  );

  cmpswp_16_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_10_0,
    MIN => sig_16_1,
    MAX => sig_15_1
  );

  reg_15_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Q => sig_15_2
  );

  cmpswp_18_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_1_0,
    MIN => sig_18_1,
    MAX => sig_17_1
  );

  reg_18_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Q => sig_18_2
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_11_0,
    MIN => sig_19_1,
    MAX => sig_20_1
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_9_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_0_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_4_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  cmpswp_34_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_14_0,
    MIN => sig_34_1,
    MAX => sig_33_1
  );

  reg_34_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_1,
    Q => sig_34_2
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_2,
    Y => sig_18_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  cmpswp_42_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_12_0,
    MIN => sig_42_1,
    MAX => sig_41_1
  );

  cmpswp_46_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Y => sig_16_1,
    MIN => sig_46_2,
    MAX => sig_45_2
  );

  cmpswp_50_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Y => sig_42_1,
    MIN => sig_50_2,
    MAX => sig_49_2
  );

  reg_49_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_2,
    Q => sig_49_3
  );

  cmpswp_51_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Y => sig_24_1,
    MIN => sig_51_2,
    MAX => sig_52_2
  );

  reg_51_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_2,
    Q => sig_51_3
  );

  cmpswp_53_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_2,
    Y => sig_34_2,
    MIN => sig_53_3,
    MAX => sig_54_3
  );

  cmpswp_58_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_3,
    Y => sig_54_3,
    MIN => sig_58_4,
    MAX => sig_57_4
  );

  cmpswp_73_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Y => sig_51_3,
    MIN => sig_73_4,
    MAX => sig_74_4
  );

  cmpswp_75_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_4,
    Y => sig_58_4,
    MIN => sig_75_5,
    MAX => sig_76_5
  );

  cmpswp_83_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_4,
    Y => sig_74_4,
    MIN => sig_83_5,
    MAX => sig_84_5
  );

  reg_83_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_5,
    Q => sig_83_6
  );

  cmpswp_89_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_1,
    Y => sig_30_1,
    MIN => sig_89_2,
    MAX => sig_90_2
  );

  cmpswp_92_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_2,
    Y => sig_15_2,
    MIN => sig_92_3,
    MAX => sig_91_3
  );

  reg_92_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_3,
    Q => sig_92_4
  );

  reg_92_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_4,
    Q => sig_92_5
  );

  cmpswp_98_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_5,
    Y => sig_92_5,
    MIN => sig_98_6,
    MAX => sig_97_6
  );

  reg_97_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_6,
    Q => sig_97_7
  );

  cmpswp_110_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_6,
    Y => sig_83_6,
    MIN => sig_110_7,
    MAX => sig_109_7
  );

  cmpswp_115_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_7,
    Y => sig_97_7,
    MIN => sig_115_8,
    MAX => sig_116_8
  );

  sig_out_med <= sig_115_8;
end generated;
