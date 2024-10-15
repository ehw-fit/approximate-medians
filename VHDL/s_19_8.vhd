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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_4_1, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_1, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_0, sig_15_0, sig_16_0, sig_16_1, sig_17_0, sig_18_0, sig_20_1, sig_19_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_1, sig_22_1, sig_24_2, sig_23_2, sig_28_1, sig_27_1, sig_28_2, sig_32_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_31_1, sig_33_1, sig_34_1, sig_35_2, sig_36_2, sig_38_2, sig_37_2, sig_39_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_1, sig_39_2, sig_40_2, sig_41_1, sig_42_1, sig_45_2, sig_46_2, sig_45_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_3, sig_47_2, sig_48_2, sig_50_3, sig_49_3, sig_52_1, sig_51_1, sig_58_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_2, sig_64_2, sig_63_2, sig_63_3, sig_66_3, sig_65_3, sig_65_4, sig_65_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_69_4, sig_70_4, sig_72_3, sig_71_3, sig_74_3, sig_73_3, sig_73_4, sig_75_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_76_4, sig_75_5, sig_75_6, sig_80_2, sig_79_2, sig_80_3, sig_80_4, sig_85_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_5, sig_85_6, sig_85_7, sig_86_6, sig_86_7, sig_94_3, sig_93_3, sig_94_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_94_5, sig_95_4, sig_96_4, sig_95_5, sig_95_6, sig_96_5, sig_96_6, sig_98_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_5, sig_101_6, sig_102_6, sig_103_7, sig_104_7, sig_106_6, sig_105_6, sig_108_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_107_8, sig_114_7, sig_113_7, sig_118_7, sig_117_7, sig_131_8, sig_132_8, sig_142_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_141_9, sig_142_10, sig_145_8, sig_146_8, sig_148_9, sig_147_9, sig_152_10, sig_151_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_153_11, sig_154_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_4_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Q => sig_4_1
  );

  reg_6_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Q => sig_6_1
  );

  reg_16_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_0,
    Q => sig_16_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_18_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_14_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  cmpswp_24_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_1,
    Y => sig_22_1,
    MIN => sig_24_2,
    MAX => sig_23_2
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_13_0,
    MIN => sig_28_1,
    MAX => sig_27_1
  );

  reg_28_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Q => sig_28_2
  );

  cmpswp_32_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_17_0,
    MIN => sig_32_1,
    MAX => sig_31_1
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_1_0,
    MIN => sig_33_1,
    MAX => sig_34_1
  );

  cmpswp_35_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_1,
    Y => sig_27_1,
    MIN => sig_35_2,
    MAX => sig_36_2
  );

  cmpswp_38_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Y => sig_33_1,
    MIN => sig_38_2,
    MAX => sig_37_2
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_10_0,
    MIN => sig_39_1,
    MAX => sig_40_1
  );

  reg_39_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Q => sig_39_2
  );

  reg_40_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_1,
    Q => sig_40_2
  );

  cmpswp_41_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_12_0,
    MIN => sig_41_1,
    MAX => sig_42_1
  );

  cmpswp_45_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Y => sig_42_1,
    MIN => sig_45_2,
    MAX => sig_46_2
  );

  reg_45_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_2,
    Q => sig_45_3
  );

  reg_46_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_2,
    Q => sig_46_3
  );

  cmpswp_47_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Y => sig_34_1,
    MIN => sig_47_2,
    MAX => sig_48_2
  );

  cmpswp_50_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_2,
    Y => sig_24_2,
    MIN => sig_50_3,
    MAX => sig_49_3
  );

  cmpswp_52_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_0_0,
    MIN => sig_52_1,
    MAX => sig_51_1
  );

  cmpswp_58_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Y => sig_20_1,
    MIN => sig_58_2,
    MAX => sig_57_2
  );

  cmpswp_64_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_1,
    Y => sig_52_1,
    MIN => sig_64_2,
    MAX => sig_63_2
  );

  reg_63_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_2,
    Q => sig_63_3
  );

  cmpswp_66_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_2,
    Y => sig_35_2,
    MIN => sig_66_3,
    MAX => sig_65_3
  );

  reg_65_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_3,
    Q => sig_65_4
  );

  reg_65_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_4,
    Q => sig_65_5
  );

  cmpswp_69_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_3,
    Y => sig_49_3,
    MIN => sig_69_4,
    MAX => sig_70_4
  );

  cmpswp_72_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_40_2,
    MIN => sig_72_3,
    MAX => sig_71_3
  );

  cmpswp_74_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Y => sig_57_2,
    MIN => sig_74_3,
    MAX => sig_73_3
  );

  reg_73_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_3,
    Q => sig_73_4
  );

  cmpswp_75_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Y => sig_63_3,
    MIN => sig_75_4,
    MAX => sig_76_4
  );

  reg_75_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_4,
    Q => sig_75_5
  );

  reg_75_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_5,
    Q => sig_75_6
  );

  cmpswp_80_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_1,
    Y => sig_51_1,
    MIN => sig_80_2,
    MAX => sig_79_2
  );

  reg_80_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_2,
    Q => sig_80_3
  );

  reg_80_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_3,
    Q => sig_80_4
  );

  cmpswp_85_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_4,
    Y => sig_76_4,
    MIN => sig_85_5,
    MAX => sig_86_5
  );

  reg_85_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_5,
    Q => sig_85_6
  );

  reg_85_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_6,
    Q => sig_85_7
  );

  reg_86_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_5,
    Q => sig_86_6
  );

  reg_86_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_6,
    Q => sig_86_7
  );

  cmpswp_94_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_2,
    Y => sig_37_2,
    MIN => sig_94_3,
    MAX => sig_93_3
  );

  reg_94_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_3,
    Q => sig_94_4
  );

  reg_94_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_4,
    Q => sig_94_5
  );

  cmpswp_95_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_3,
    Y => sig_72_3,
    MIN => sig_95_4,
    MAX => sig_96_4
  );

  reg_95_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_4,
    Q => sig_95_5
  );

  reg_95_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_5,
    Q => sig_95_6
  );

  reg_96_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_4,
    Q => sig_96_5
  );

  reg_96_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_5,
    Q => sig_96_6
  );

  cmpswp_98_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_4,
    Y => sig_80_4,
    MIN => sig_98_5,
    MAX => sig_97_5
  );

  cmpswp_101_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_5,
    Y => sig_98_5,
    MIN => sig_101_6,
    MAX => sig_102_6
  );

  cmpswp_103_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_6,
    Y => sig_96_6,
    MIN => sig_103_7,
    MAX => sig_104_7
  );

  cmpswp_106_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_5,
    Y => sig_94_5,
    MIN => sig_106_6,
    MAX => sig_105_6
  );

  cmpswp_108_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_7,
    Y => sig_103_7,
    MIN => sig_108_8,
    MAX => sig_107_8
  );

  cmpswp_114_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_6,
    Y => sig_101_6,
    MIN => sig_114_7,
    MAX => sig_113_7
  );

  cmpswp_118_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_6,
    Y => sig_95_6,
    MIN => sig_118_7,
    MAX => sig_117_7
  );

  cmpswp_131_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_7,
    Y => sig_117_7,
    MIN => sig_131_8,
    MAX => sig_132_8
  );

  cmpswp_142_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_8,
    Y => sig_131_8,
    MIN => sig_142_9,
    MAX => sig_141_9
  );

  reg_142_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_142_9,
    Q => sig_142_10
  );

  cmpswp_145_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_7,
    Y => sig_118_7,
    MIN => sig_145_8,
    MAX => sig_146_8
  );

  cmpswp_148_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_8,
    Y => sig_146_8,
    MIN => sig_148_9,
    MAX => sig_147_9
  );

  cmpswp_152_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_147_9,
    Y => sig_141_9,
    MIN => sig_152_10,
    MAX => sig_151_10
  );

  cmpswp_153_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_152_10,
    Y => sig_142_10,
    MIN => sig_153_11,
    MAX => sig_154_11
  );

  sig_out_med <= sig_154_11;
end generated;
