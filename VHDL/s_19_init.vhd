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
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_5_0, sig_5_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_7_0, sig_8_0, sig_8_1, sig_9_0, sig_10_0, sig_11_0, sig_11_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_0, sig_13_0, sig_14_0, sig_14_1, sig_15_0, sig_16_0, sig_17_0, sig_18_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_1, sig_20_1, sig_19_2, sig_19_3, sig_20_2, sig_21_1, sig_22_1, sig_21_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_2, sig_24_2, sig_25_3, sig_26_3, sig_25_4, sig_25_5, sig_27_1, sig_28_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_27_2, sig_29_2, sig_30_2, sig_30_3, sig_31_3, sig_32_3, sig_31_4, sig_32_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_1, sig_34_1, sig_33_2, sig_35_2, sig_36_2, sig_37_3, sig_38_3, sig_39_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_1, sig_39_2, sig_41_2, sig_42_2, sig_43_3, sig_44_3, sig_45_1, sig_46_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_2, sig_47_2, sig_48_2, sig_48_3, sig_48_4, sig_48_5, sig_49_3, sig_50_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_1, sig_52_1, sig_51_2, sig_51_3, sig_52_2, sig_52_3, sig_53_4, sig_54_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_53_5, sig_53_6, sig_53_7, sig_54_5, sig_55_3, sig_56_3, sig_55_4, sig_55_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_56_4, sig_57_4, sig_58_4, sig_57_5, sig_59_5, sig_60_5, sig_61_6, sig_62_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_63_4, sig_64_4, sig_63_5, sig_65_5, sig_66_5, sig_67_6, sig_68_6, sig_69_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_70_3, sig_69_4, sig_71_4, sig_72_4, sig_73_5, sig_74_5, sig_75_4, sig_76_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_75_5, sig_75_6, sig_76_5, sig_76_6, sig_77_4, sig_78_4, sig_77_5, sig_77_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_5, sig_78_6, sig_79_7, sig_80_7, sig_81_7, sig_82_7, sig_81_8, sig_81_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_81_10, sig_81_11, sig_82_8, sig_82_9, sig_82_10, sig_82_11, sig_82_12, sig_82_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_14, sig_82_15, sig_82_16, sig_82_17, sig_82_18, sig_83_6, sig_84_6, sig_85_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_7, sig_85_8, sig_85_9, sig_86_8, sig_86_9, sig_86_10, sig_86_11, sig_86_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_13, sig_86_14, sig_86_15, sig_86_16, sig_86_17, sig_86_18, sig_86_19, sig_86_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_21, sig_87_7, sig_88_7, sig_87_8, sig_89_8, sig_90_8, sig_91_9, sig_92_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_93_6, sig_94_6, sig_94_7, sig_94_8, sig_95_6, sig_96_6, sig_95_7, sig_96_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_96_8, sig_96_9, sig_96_10, sig_96_11, sig_97_6, sig_98_6, sig_97_7, sig_97_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_9, sig_98_7, sig_98_8, sig_98_9, sig_98_10, sig_99_5, sig_100_5, sig_99_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_101_7, sig_102_7, sig_101_8, sig_101_9, sig_103_9, sig_104_9, sig_105_10, sig_106_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_107_11, sig_108_11, sig_109_10, sig_110_10, sig_111_8, sig_112_8, sig_112_9, sig_112_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_113_11, sig_114_11, sig_115_12, sig_116_12, sig_116_13, sig_116_14, sig_116_15, sig_116_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_117_7, sig_118_7, sig_117_8, sig_117_9, sig_117_10, sig_118_8, sig_118_9, sig_118_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_118_11, sig_118_12, sig_118_13, sig_119_10, sig_120_10, sig_120_11, sig_120_12, sig_121_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_122_12, sig_123_11, sig_124_11, sig_123_12, sig_124_12, sig_124_13, sig_125_13, sig_126_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_127_13, sig_128_13, sig_127_14, sig_129_14, sig_130_14, sig_131_14, sig_132_14, sig_131_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_132_15, sig_132_16, sig_132_17, sig_132_18, sig_133_15, sig_134_15, sig_134_16, sig_134_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_135_16, sig_136_16, sig_136_17, sig_136_18, sig_136_19, sig_137_17, sig_138_17, sig_139_18 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_140_18, sig_141_19, sig_142_19, sig_143_20, sig_144_20, sig_145_19, sig_146_19, sig_145_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_146_20, sig_147_21, sig_148_21, sig_149_21, sig_150_21, sig_149_22, sig_151_22, sig_152_22 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_151_23, sig_153_23, sig_154_23, sig_155_24, sig_156_24 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_2_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Q => sig_2_1
  );

  reg_5_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Q => sig_5_1
  );

  reg_8_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Q => sig_8_1
  );

  reg_11_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Q => sig_11_1
  );

  reg_14_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Q => sig_14_1
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_1_0,
    MIN => sig_19_1,
    MAX => sig_20_1
  );

  reg_19_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Q => sig_19_2
  );

  reg_19_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Q => sig_19_3
  );

  reg_20_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Q => sig_20_2
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_4_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  reg_21_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Q => sig_21_2
  );

  cmpswp_23_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_1,
    Y => sig_22_1,
    MIN => sig_23_2,
    MAX => sig_24_2
  );

  cmpswp_25_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_21_2,
    MIN => sig_25_3,
    MAX => sig_26_3
  );

  reg_25_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Q => sig_25_4
  );

  reg_25_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_4,
    Q => sig_25_5
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_7_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  reg_27_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_1,
    Q => sig_27_2
  );

  cmpswp_29_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_1,
    Y => sig_28_1,
    MIN => sig_29_2,
    MAX => sig_30_2
  );

  reg_30_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Q => sig_30_3
  );

  cmpswp_31_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
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

  reg_32_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Q => sig_32_4
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_10_0,
    MIN => sig_33_1,
    MAX => sig_34_1
  );

  reg_33_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_1,
    Q => sig_33_2
  );

  cmpswp_35_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_1,
    Y => sig_34_1,
    MIN => sig_35_2,
    MAX => sig_36_2
  );

  cmpswp_37_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_2,
    Y => sig_33_2,
    MIN => sig_37_3,
    MAX => sig_38_3
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_13_0,
    MIN => sig_39_1,
    MAX => sig_40_1
  );

  reg_39_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Q => sig_39_2
  );

  cmpswp_41_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_1,
    Y => sig_40_1,
    MIN => sig_41_2,
    MAX => sig_42_2
  );

  cmpswp_43_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_2,
    Y => sig_39_2,
    MIN => sig_43_3,
    MAX => sig_44_3
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_16_0,
    MIN => sig_45_1,
    MAX => sig_46_1
  );

  reg_45_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_1,
    Q => sig_45_2
  );

  cmpswp_47_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_46_1,
    MIN => sig_47_2,
    MAX => sig_48_2
  );

  reg_48_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_2,
    Q => sig_48_3
  );

  reg_48_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_3,
    Q => sig_48_4
  );

  reg_48_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_4,
    Q => sig_48_5
  );

  cmpswp_49_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_2,
    Y => sig_45_2,
    MIN => sig_49_3,
    MAX => sig_50_3
  );

  cmpswp_51_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Y => sig_18_0,
    MIN => sig_51_1,
    MAX => sig_52_1
  );

  reg_51_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_1,
    Q => sig_51_2
  );

  reg_51_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_2,
    Q => sig_51_3
  );

  reg_52_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_1,
    Q => sig_52_2
  );

  reg_52_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_2,
    Q => sig_52_3
  );

  cmpswp_53_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_3,
    Y => sig_26_3,
    MIN => sig_53_4,
    MAX => sig_54_4
  );

  reg_53_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_4,
    Q => sig_53_5
  );

  reg_53_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_5,
    Q => sig_53_6
  );

  reg_53_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_6,
    Q => sig_53_7
  );

  reg_54_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_4,
    Q => sig_54_5
  );

  cmpswp_55_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_24_2,
    MIN => sig_55_3,
    MAX => sig_56_3
  );

  reg_55_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_3,
    Q => sig_55_4
  );

  reg_55_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_4,
    Q => sig_55_5
  );

  reg_56_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_3,
    Q => sig_56_4
  );

  cmpswp_57_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_3,
    Y => sig_43_3,
    MIN => sig_57_4,
    MAX => sig_58_4
  );

  reg_57_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_4,
    Q => sig_57_5
  );

  cmpswp_59_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_4,
    Y => sig_58_4,
    MIN => sig_59_5,
    MAX => sig_60_5
  );

  cmpswp_61_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_5,
    Y => sig_57_5,
    MIN => sig_61_6,
    MAX => sig_62_6
  );

  cmpswp_63_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_3,
    Y => sig_44_3,
    MIN => sig_63_4,
    MAX => sig_64_4
  );

  reg_63_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_4,
    Q => sig_63_5
  );

  cmpswp_65_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_4,
    Y => sig_64_4,
    MIN => sig_65_5,
    MAX => sig_66_5
  );

  cmpswp_67_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_5,
    Y => sig_63_5,
    MIN => sig_67_6,
    MAX => sig_68_6
  );

  cmpswp_69_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_2,
    Y => sig_42_2,
    MIN => sig_69_3,
    MAX => sig_70_3
  );

  reg_69_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_3,
    Q => sig_69_4
  );

  cmpswp_71_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Y => sig_70_3,
    MIN => sig_71_4,
    MAX => sig_72_4
  );

  cmpswp_73_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_4,
    Y => sig_69_4,
    MIN => sig_73_5,
    MAX => sig_74_5
  );

  cmpswp_75_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_3,
    Y => sig_51_3,
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

  reg_76_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_4,
    Q => sig_76_5
  );

  reg_76_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_5,
    Q => sig_76_6
  );

  cmpswp_77_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Y => sig_52_3,
    MIN => sig_77_4,
    MAX => sig_78_4
  );

  reg_77_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_4,
    Q => sig_77_5
  );

  reg_77_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_5,
    Q => sig_77_6
  );

  reg_78_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_4,
    Q => sig_78_5
  );

  reg_78_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_5,
    Q => sig_78_6
  );

  cmpswp_79_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_6,
    Y => sig_75_6,
    MIN => sig_79_7,
    MAX => sig_80_7
  );

  cmpswp_81_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_6,
    Y => sig_77_6,
    MIN => sig_81_7,
    MAX => sig_82_7
  );

  reg_81_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_7,
    Q => sig_81_8
  );

  reg_81_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_8,
    Q => sig_81_9
  );

  reg_81_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_9,
    Q => sig_81_10
  );

  reg_81_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_10,
    Q => sig_81_11
  );

  reg_82_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_7,
    Q => sig_82_8
  );

  reg_82_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_8,
    Q => sig_82_9
  );

  reg_82_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_9,
    Q => sig_82_10
  );

  reg_82_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_10,
    Q => sig_82_11
  );

  reg_82_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_11,
    Q => sig_82_12
  );

  reg_82_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_12,
    Q => sig_82_13
  );

  reg_82_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_13,
    Q => sig_82_14
  );

  reg_82_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_14,
    Q => sig_82_15
  );

  reg_82_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_15,
    Q => sig_82_16
  );

  reg_82_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_16,
    Q => sig_82_17
  );

  reg_82_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_17,
    Q => sig_82_18
  );

  cmpswp_83_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_5,
    Y => sig_48_5,
    MIN => sig_83_6,
    MAX => sig_84_6
  );

  cmpswp_85_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_6,
    Y => sig_76_6,
    MIN => sig_85_7,
    MAX => sig_86_7
  );

  reg_85_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_7,
    Q => sig_85_8
  );

  reg_85_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_8,
    Q => sig_85_9
  );

  reg_86_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_7,
    Q => sig_86_8
  );

  reg_86_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_8,
    Q => sig_86_9
  );

  reg_86_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_9,
    Q => sig_86_10
  );

  reg_86_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_10,
    Q => sig_86_11
  );

  reg_86_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_11,
    Q => sig_86_12
  );

  reg_86_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_12,
    Q => sig_86_13
  );

  reg_86_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_13,
    Q => sig_86_14
  );

  reg_86_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_14,
    Q => sig_86_15
  );

  reg_86_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_15,
    Q => sig_86_16
  );

  reg_86_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_16,
    Q => sig_86_17
  );

  reg_86_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_17,
    Q => sig_86_18
  );

  reg_86_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_18,
    Q => sig_86_19
  );

  reg_86_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_19,
    Q => sig_86_20
  );

  reg_86_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_20,
    Q => sig_86_21
  );

  cmpswp_87_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_6,
    Y => sig_78_6,
    MIN => sig_87_7,
    MAX => sig_88_7
  );

  reg_87_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_7,
    Q => sig_87_8
  );

  cmpswp_89_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_7,
    Y => sig_88_7,
    MIN => sig_89_8,
    MAX => sig_90_8
  );

  cmpswp_91_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_8,
    Y => sig_87_8,
    MIN => sig_91_9,
    MAX => sig_92_9
  );

  cmpswp_93_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_5,
    Y => sig_74_5,
    MIN => sig_93_6,
    MAX => sig_94_6
  );

  reg_94_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_6,
    Q => sig_94_7
  );

  reg_94_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_7,
    Q => sig_94_8
  );

  cmpswp_95_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_5,
    Y => sig_60_5,
    MIN => sig_95_6,
    MAX => sig_96_6
  );

  reg_95_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_6,
    Q => sig_95_7
  );

  reg_96_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_6,
    Q => sig_96_7
  );

  reg_96_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_7,
    Q => sig_96_8
  );

  reg_96_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_8,
    Q => sig_96_9
  );

  reg_96_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_9,
    Q => sig_96_10
  );

  reg_96_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_10,
    Q => sig_96_11
  );

  cmpswp_97_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_5,
    Y => sig_66_5,
    MIN => sig_97_6,
    MAX => sig_98_6
  );

  reg_97_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_6,
    Q => sig_97_7
  );

  reg_97_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_7,
    Q => sig_97_8
  );

  reg_97_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_8,
    Q => sig_97_9
  );

  reg_98_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_6,
    Q => sig_98_7
  );

  reg_98_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_7,
    Q => sig_98_8
  );

  reg_98_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_8,
    Q => sig_98_9
  );

  reg_98_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_9,
    Q => sig_98_10
  );

  cmpswp_99_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Y => sig_72_4,
    MIN => sig_99_5,
    MAX => sig_100_5
  );

  reg_99_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_5,
    Q => sig_99_6
  );

  cmpswp_101_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_6,
    Y => sig_84_6,
    MIN => sig_101_7,
    MAX => sig_102_7
  );

  reg_101_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_7,
    Q => sig_101_8
  );

  reg_101_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_8,
    Q => sig_101_9
  );

  cmpswp_103_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_8,
    Y => sig_90_8,
    MIN => sig_103_9,
    MAX => sig_104_9
  );

  cmpswp_105_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_9,
    Y => sig_103_9,
    MIN => sig_105_10,
    MAX => sig_106_10
  );

  cmpswp_107_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_10,
    Y => sig_98_10,
    MIN => sig_107_11,
    MAX => sig_108_11
  );

  cmpswp_109_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_9,
    Y => sig_85_9,
    MIN => sig_109_10,
    MAX => sig_110_10
  );

  cmpswp_111_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_7,
    Y => sig_80_7,
    MIN => sig_111_8,
    MAX => sig_112_8
  );

  reg_112_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_8,
    Q => sig_112_9
  );

  reg_112_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_9,
    Q => sig_112_10
  );

  cmpswp_113_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_10,
    Y => sig_112_10,
    MIN => sig_113_11,
    MAX => sig_114_11
  );

  cmpswp_115_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_11,
    Y => sig_114_11,
    MIN => sig_115_12,
    MAX => sig_116_12
  );

  reg_116_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_12,
    Q => sig_116_13
  );

  reg_116_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_13,
    Q => sig_116_14
  );

  reg_116_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_14,
    Q => sig_116_15
  );

  reg_116_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_15,
    Q => sig_116_16
  );

  cmpswp_117_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_6,
    Y => sig_83_6,
    MIN => sig_117_7,
    MAX => sig_118_7
  );

  reg_117_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_7,
    Q => sig_117_8
  );

  reg_117_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_8,
    Q => sig_117_9
  );

  reg_117_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_9,
    Q => sig_117_10
  );

  reg_118_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_7,
    Q => sig_118_8
  );

  reg_118_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_8,
    Q => sig_118_9
  );

  reg_118_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_9,
    Q => sig_118_10
  );

  reg_118_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_10,
    Q => sig_118_11
  );

  reg_118_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_11,
    Q => sig_118_12
  );

  reg_118_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_12,
    Q => sig_118_13
  );

  cmpswp_119_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_9,
    Y => sig_92_9,
    MIN => sig_119_10,
    MAX => sig_120_10
  );

  reg_120_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_10,
    Q => sig_120_11
  );

  reg_120_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_11,
    Q => sig_120_12
  );

  cmpswp_121_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_11,
    Y => sig_96_11,
    MIN => sig_121_12,
    MAX => sig_122_12
  );

  cmpswp_123_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_10,
    Y => sig_119_10,
    MIN => sig_123_11,
    MAX => sig_124_11
  );

  reg_123_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_11,
    Q => sig_123_12
  );

  reg_124_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_11,
    Q => sig_124_12
  );

  reg_124_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_12,
    Q => sig_124_13
  );

  cmpswp_125_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_12,
    Y => sig_121_12,
    MIN => sig_125_13,
    MAX => sig_126_13
  );

  cmpswp_127_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_12,
    Y => sig_122_12,
    MIN => sig_127_13,
    MAX => sig_128_13
  );

  reg_127_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_127_13,
    Q => sig_127_14
  );

  cmpswp_129_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_13,
    Y => sig_128_13,
    MIN => sig_129_14,
    MAX => sig_130_14
  );

  cmpswp_131_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_13,
    Y => sig_126_13,
    MIN => sig_131_14,
    MAX => sig_132_14
  );

  reg_131_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_14,
    Q => sig_131_15
  );

  reg_132_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_14,
    Q => sig_132_15
  );

  reg_132_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_15,
    Q => sig_132_16
  );

  reg_132_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_16,
    Q => sig_132_17
  );

  reg_132_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_17,
    Q => sig_132_18
  );

  cmpswp_133_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_14,
    Y => sig_127_14,
    MIN => sig_133_15,
    MAX => sig_134_15
  );

  reg_134_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_15,
    Q => sig_134_16
  );

  reg_134_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_16,
    Q => sig_134_17
  );

  cmpswp_135_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_15,
    Y => sig_133_15,
    MIN => sig_135_16,
    MAX => sig_136_16
  );

  reg_136_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_136_16,
    Q => sig_136_17
  );

  reg_136_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_136_17,
    Q => sig_136_18
  );

  reg_136_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_136_18,
    Q => sig_136_19
  );

  cmpswp_137_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_135_16,
    Y => sig_116_16,
    MIN => sig_137_17,
    MAX => sig_138_17
  );

  cmpswp_139_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_17,
    Y => sig_138_17,
    MIN => sig_139_18,
    MAX => sig_140_18
  );

  cmpswp_141_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_18,
    Y => sig_140_18,
    MIN => sig_141_19,
    MAX => sig_142_19
  );

  cmpswp_143_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_141_19,
    Y => sig_136_19,
    MIN => sig_143_20,
    MAX => sig_144_20
  );

  cmpswp_145_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_18,
    Y => sig_82_18,
    MIN => sig_145_19,
    MAX => sig_146_19
  );

  reg_145_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_19,
    Q => sig_145_20
  );

  reg_146_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_19,
    Q => sig_146_20
  );

  cmpswp_147_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_20,
    Y => sig_145_20,
    MIN => sig_147_21,
    MAX => sig_148_21
  );

  cmpswp_149_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_20,
    Y => sig_146_20,
    MIN => sig_149_21,
    MAX => sig_150_21
  );

  reg_149_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_21,
    Q => sig_149_22
  );

  cmpswp_151_22: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_21,
    Y => sig_86_21,
    MIN => sig_151_22,
    MAX => sig_152_22
  );

  reg_151_22: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_151_22,
    Q => sig_151_23
  );

  cmpswp_153_23: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_22,
    Y => sig_152_22,
    MIN => sig_153_23,
    MAX => sig_154_23
  );

  cmpswp_155_24: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_23,
    Y => sig_151_23,
    MIN => sig_155_24,
    MAX => sig_156_24
  );

  sig_out_med <= sig_156_24;
end generated;
