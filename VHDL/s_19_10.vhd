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

entity median_19 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 18,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_19 is
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0, sig_7_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_8_0, sig_8_1, sig_8_2, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_0, sig_15_0, sig_16_0, sig_17_0, sig_18_0, sig_19_1, sig_20_1, sig_22_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_1, sig_24_1, sig_23_1, sig_25_1, sig_26_1, sig_28_2, sig_27_2, sig_29_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_2, sig_31_3, sig_32_3, sig_31_4, sig_40_1, sig_39_1, sig_42_1, sig_41_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_1, sig_46_1, sig_48_2, sig_47_2, sig_53_2, sig_54_2, sig_60_1, sig_59_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_64_1, sig_63_1, sig_69_2, sig_70_2, sig_90_3, sig_89_3, sig_93_3, sig_94_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_4, sig_98_4, sig_104_2, sig_103_2, sig_103_3, sig_103_4, sig_103_5, sig_103_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_141_5, sig_142_5, sig_144_4, sig_143_4, sig_144_5, sig_148_6, sig_147_6, sig_147_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_152_7, sig_151_7, sig_155_8, sig_156_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
    sig_15_0(i) <= sig_in(15,i);
    sig_16_0(i) <= sig_in(16,i);
    sig_17_0(i) <= sig_in(17,i);
    sig_18_0(i) <= sig_in(18,i);
  end generate;
  reg_8_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Q => sig_8_1
  );

  reg_8_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_1,
    Q => sig_8_2
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Y => sig_3_0,
    MIN => sig_19_1,
    MAX => sig_20_1
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_11_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  cmpswp_24_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_13_0,
    MIN => sig_24_1,
    MAX => sig_23_1
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_1_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  cmpswp_28_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Y => sig_24_1,
    MIN => sig_28_2,
    MAX => sig_27_2
  );

  cmpswp_29_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Y => sig_19_1,
    MIN => sig_29_2,
    MAX => sig_30_2
  );

  cmpswp_31_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Y => sig_27_2,
    MIN => sig_31_3,
    MAX => sig_32_3
  );

  reg_31_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Q => sig_31_4
  );

  cmpswp_40_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_10_0,
    MIN => sig_40_1,
    MAX => sig_39_1
  );

  cmpswp_42_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_15_0,
    MIN => sig_42_1,
    MAX => sig_41_1
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_16_0,
    MIN => sig_45_1,
    MAX => sig_46_1
  );

  cmpswp_48_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_1,
    Y => sig_45_1,
    MIN => sig_48_2,
    MAX => sig_47_2
  );

  cmpswp_53_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Y => sig_46_1,
    MIN => sig_53_2,
    MAX => sig_54_2
  );

  cmpswp_60_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_0_0,
    MIN => sig_60_1,
    MAX => sig_59_1
  );

  cmpswp_64_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Y => sig_7_0,
    MIN => sig_64_1,
    MAX => sig_63_1
  );

  cmpswp_69_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Y => sig_20_1,
    MIN => sig_69_2,
    MAX => sig_70_2
  );

  cmpswp_90_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_2,
    Y => sig_47_2,
    MIN => sig_90_3,
    MAX => sig_89_3
  );

  cmpswp_93_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_2,
    Y => sig_53_2,
    MIN => sig_93_3,
    MAX => sig_94_3
  );

  cmpswp_97_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_3,
    Y => sig_93_3,
    MIN => sig_97_4,
    MAX => sig_98_4
  );

  cmpswp_104_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_1,
    Y => sig_64_1,
    MIN => sig_104_2,
    MAX => sig_103_2
  );

  reg_103_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_2,
    Q => sig_103_3
  );

  reg_103_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_3,
    Q => sig_103_4
  );

  reg_103_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_4,
    Q => sig_103_5
  );

  reg_103_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_5,
    Q => sig_103_6
  );

  cmpswp_141_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_4,
    Y => sig_98_4,
    MIN => sig_141_5,
    MAX => sig_142_5
  );

  cmpswp_144_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_89_3,
    MIN => sig_144_4,
    MAX => sig_143_4
  );

  reg_144_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_4,
    Q => sig_144_5
  );

  cmpswp_148_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_142_5,
    Y => sig_144_5,
    MIN => sig_148_6,
    MAX => sig_147_6
  );

  reg_147_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_147_6,
    Q => sig_147_7
  );

  cmpswp_152_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_6,
    Y => sig_103_6,
    MIN => sig_152_7,
    MAX => sig_151_7
  );

  cmpswp_155_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_147_7,
    Y => sig_151_7,
    MIN => sig_155_8,
    MAX => sig_156_8
  );

  sig_out_med <= sig_155_8;
end generated;
