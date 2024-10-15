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

entity median_25 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 24,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_25 is
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_4_1, sig_5_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_11_1, sig_11_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_3, sig_11_4, sig_11_5, sig_11_6, sig_11_7, sig_12_0, sig_12_1, sig_13_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_0, sig_15_0, sig_15_1, sig_15_2, sig_16_0, sig_16_1, sig_16_2, sig_16_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_17_0, sig_17_1, sig_17_2, sig_17_3, sig_17_4, sig_18_0, sig_19_0, sig_19_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_2, sig_20_0, sig_21_0, sig_22_0, sig_23_0, sig_24_0, sig_24_1, sig_26_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_1, sig_26_2, sig_25_2, sig_25_3, sig_25_4, sig_25_5, sig_25_6, sig_25_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_8, sig_27_1, sig_28_1, sig_30_2, sig_29_2, sig_30_3, sig_32_3, sig_31_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_1, sig_36_1, sig_37_2, sig_38_2, sig_38_3, sig_38_4, sig_39_1, sig_40_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_2, sig_40_3, sig_41_1, sig_42_1, sig_42_2, sig_42_3, sig_42_4, sig_42_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_2, sig_43_2, sig_43_3, sig_43_4, sig_43_5, sig_43_6, sig_45_2, sig_46_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_3, sig_48_1, sig_47_1, sig_48_2, sig_48_3, sig_48_4, sig_47_2, sig_47_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_4, sig_47_5, sig_52_3, sig_51_3, sig_53_4, sig_54_4, sig_58_4, sig_57_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_5, sig_59_5, sig_60_6, sig_60_7, sig_60_8, sig_60_9, sig_60_10, sig_60_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_12, sig_60_13, sig_60_14, sig_60_15, sig_60_16, sig_60_17, sig_60_18, sig_60_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_63_1, sig_64_1, sig_66_1, sig_65_1, sig_67_2, sig_68_2, sig_69_2, sig_70_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_71_6, sig_72_6, sig_73_4, sig_74_4, sig_73_5, sig_74_5, sig_74_6, sig_75_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_76_7, sig_76_8, sig_76_9, sig_76_10, sig_76_11, sig_76_12, sig_77_2, sig_78_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_77_3, sig_77_4, sig_77_5, sig_77_6, sig_78_3, sig_78_4, sig_78_5, sig_79_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_80_4, sig_80_5, sig_80_6, sig_80_7, sig_80_8, sig_80_9, sig_80_10, sig_80_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_80_12, sig_80_13, sig_80_14, sig_81_3, sig_82_3, sig_81_4, sig_82_4, sig_82_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_6, sig_82_7, sig_82_8, sig_82_9, sig_82_10, sig_82_11, sig_82_12, sig_82_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_83_5, sig_84_5, sig_85_6, sig_86_6, sig_88_7, sig_87_7, sig_88_8, sig_88_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_88_10, sig_88_11, sig_88_12, sig_88_13, sig_90_6, sig_89_6, sig_89_7, sig_93_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_94_8, sig_95_5, sig_96_5, sig_95_6, sig_96_6, sig_97_5, sig_98_5, sig_99_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_100_6, sig_99_7, sig_99_8, sig_100_7, sig_100_8, sig_100_9, sig_100_10, sig_100_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_100_12, sig_100_13, sig_100_14, sig_100_15, sig_102_7, sig_101_7, sig_101_8, sig_101_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_103_3, sig_104_3, sig_103_4, sig_103_5, sig_103_6, sig_103_7, sig_103_8, sig_104_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_104_5, sig_106_6, sig_105_6, sig_107_7, sig_108_7, sig_109_9, sig_110_9, sig_110_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_111_9, sig_112_9, sig_120_10, sig_119_10, sig_119_11, sig_122_11, sig_121_11, sig_122_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_122_13, sig_122_14, sig_122_15, sig_122_16, sig_122_17, sig_122_18, sig_122_19, sig_122_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_122_21, sig_122_22, sig_122_23, sig_124_3, sig_123_3, sig_123_4, sig_123_5, sig_123_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_123_7, sig_131_8, sig_132_8, sig_131_9, sig_131_10, sig_131_11, sig_131_12, sig_131_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_131_14, sig_131_15, sig_133_9, sig_134_9, sig_133_10, sig_133_11, sig_133_12, sig_133_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_133_14, sig_133_15, sig_133_16, sig_133_17, sig_133_18, sig_137_7, sig_138_7, sig_137_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_137_9, sig_137_10, sig_137_11, sig_137_12, sig_139_12, sig_140_12, sig_141_13, sig_142_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_142_14, sig_149_14, sig_150_14, sig_149_15, sig_149_16, sig_149_17, sig_149_18, sig_149_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_149_20, sig_149_21, sig_149_22, sig_151_15, sig_152_15, sig_153_16, sig_154_16, sig_153_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_153_18, sig_157_13, sig_158_13, sig_160_14, sig_159_14, sig_171_8, sig_172_8, sig_171_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_171_10, sig_171_11, sig_171_12, sig_171_13, sig_171_14, sig_171_15, sig_171_16, sig_185_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_186_15, sig_186_16, sig_186_17, sig_187_17, sig_188_17, sig_189_16, sig_190_16, sig_189_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_191_18, sig_192_18, sig_191_19, sig_194_18, sig_193_18, sig_197_19, sig_198_19, sig_199_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_200_19, sig_201_20, sig_202_20, sig_207_20, sig_208_20, sig_209_21, sig_210_21, sig_212_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_211_20, sig_211_21, sig_213_22, sig_214_22, sig_218_23, sig_217_23, sig_221_24, sig_222_24 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
    sig_19_0(i) <= sig_in(19,i);
    sig_20_0(i) <= sig_in(20,i);
    sig_21_0(i) <= sig_in(21,i);
    sig_22_0(i) <= sig_in(22,i);
    sig_23_0(i) <= sig_in(23,i);
    sig_24_0(i) <= sig_in(24,i);
  end generate;
  reg_2_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Q => sig_2_1
  );

  reg_4_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Q => sig_4_1
  );

  reg_11_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Q => sig_11_1
  );

  reg_11_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_1,
    Q => sig_11_2
  );

  reg_11_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_2,
    Q => sig_11_3
  );

  reg_11_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_3,
    Q => sig_11_4
  );

  reg_11_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_4,
    Q => sig_11_5
  );

  reg_11_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_5,
    Q => sig_11_6
  );

  reg_11_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_6,
    Q => sig_11_7
  );

  reg_12_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Q => sig_12_1
  );

  reg_15_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Q => sig_15_1
  );

  reg_15_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Q => sig_15_2
  );

  reg_16_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_0,
    Q => sig_16_1
  );

  reg_16_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Q => sig_16_2
  );

  reg_16_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_2,
    Q => sig_16_3
  );

  reg_17_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Q => sig_17_1
  );

  reg_17_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Q => sig_17_2
  );

  reg_17_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_2,
    Q => sig_17_3
  );

  reg_17_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_3,
    Q => sig_17_4
  );

  reg_19_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_0,
    Q => sig_19_1
  );

  reg_19_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Q => sig_19_2
  );

  reg_24_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_0,
    Q => sig_24_1
  );

  cmpswp_26_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_13_0,
    MIN => sig_26_1,
    MAX => sig_25_1
  );

  reg_26_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Q => sig_26_2
  );

  reg_25_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Q => sig_25_2
  );

  reg_25_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Q => sig_25_3
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

  reg_25_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_5,
    Q => sig_25_6
  );

  reg_25_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_6,
    Q => sig_25_7
  );

  reg_25_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_7,
    Q => sig_25_8
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_18_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  cmpswp_30_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_1,
    Y => sig_28_1,
    MIN => sig_30_2,
    MAX => sig_29_2
  );

  reg_30_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Q => sig_30_3
  );

  cmpswp_32_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
    Y => sig_19_2,
    MIN => sig_32_3,
    MAX => sig_31_3
  );

  cmpswp_35_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_14_0,
    MIN => sig_35_1,
    MAX => sig_36_1
  );

  cmpswp_37_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_1,
    Y => sig_4_1,
    MIN => sig_37_2,
    MAX => sig_38_2
  );

  reg_38_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_2,
    Q => sig_38_3
  );

  reg_38_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_3,
    Q => sig_38_4
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_10_0,
    MIN => sig_39_1,
    MAX => sig_40_1
  );

  reg_40_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_1,
    Q => sig_40_2
  );

  reg_40_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_2,
    Q => sig_40_3
  );

  cmpswp_41_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_0_0,
    MIN => sig_41_1,
    MAX => sig_42_1
  );

  reg_42_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_1,
    Q => sig_42_2
  );

  reg_42_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_2,
    Q => sig_42_3
  );

  reg_42_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Q => sig_42_4
  );

  reg_42_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_4,
    Q => sig_42_5
  );

  cmpswp_44_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Y => sig_39_1,
    MIN => sig_44_2,
    MAX => sig_43_2
  );

  reg_43_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_2,
    Q => sig_43_3
  );

  reg_43_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Q => sig_43_4
  );

  reg_43_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Q => sig_43_5
  );

  reg_43_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_5,
    Q => sig_43_6
  );

  cmpswp_45_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Y => sig_36_1,
    MIN => sig_45_2,
    MAX => sig_46_2
  );

  reg_45_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_2,
    Q => sig_45_3
  );

  cmpswp_48_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_1_0,
    MIN => sig_48_1,
    MAX => sig_47_1
  );

  reg_48_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_1,
    Q => sig_48_2
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

  reg_47_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_1,
    Q => sig_47_2
  );

  reg_47_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_2,
    Q => sig_47_3
  );

  reg_47_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Q => sig_47_4
  );

  reg_47_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_4,
    Q => sig_47_5
  );

  cmpswp_52_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_2,
    Y => sig_46_2,
    MIN => sig_52_3,
    MAX => sig_51_3
  );

  cmpswp_53_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_3,
    Y => sig_52_3,
    MIN => sig_53_4,
    MAX => sig_54_4
  );

  cmpswp_58_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_3,
    Y => sig_31_3,
    MIN => sig_58_4,
    MAX => sig_57_4
  );

  cmpswp_60_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_4,
    Y => sig_58_4,
    MIN => sig_60_5,
    MAX => sig_59_5
  );

  reg_60_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_5,
    Q => sig_60_6
  );

  reg_60_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_6,
    Q => sig_60_7
  );

  reg_60_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_7,
    Q => sig_60_8
  );

  reg_60_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_8,
    Q => sig_60_9
  );

  reg_60_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_9,
    Q => sig_60_10
  );

  reg_60_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_10,
    Q => sig_60_11
  );

  reg_60_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_11,
    Q => sig_60_12
  );

  reg_60_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_12,
    Q => sig_60_13
  );

  reg_60_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_13,
    Q => sig_60_14
  );

  reg_60_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_14,
    Q => sig_60_15
  );

  reg_60_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_15,
    Q => sig_60_16
  );

  reg_60_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_16,
    Q => sig_60_17
  );

  reg_60_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_17,
    Q => sig_60_18
  );

  reg_60_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_18,
    Q => sig_60_19
  );

  cmpswp_63_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_0,
    Y => sig_22_0,
    MIN => sig_63_1,
    MAX => sig_64_1
  );

  cmpswp_66_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_0,
    Y => sig_23_0,
    MIN => sig_66_1,
    MAX => sig_65_1
  );

  cmpswp_67_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_1,
    Y => sig_63_1,
    MIN => sig_67_2,
    MAX => sig_68_2
  );

  cmpswp_69_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_1,
    Y => sig_24_1,
    MIN => sig_69_2,
    MAX => sig_70_2
  );

  cmpswp_71_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_5,
    Y => sig_59_5,
    MIN => sig_71_6,
    MAX => sig_72_6
  );

  cmpswp_73_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_40_3,
    MIN => sig_73_4,
    MAX => sig_74_4
  );

  reg_73_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_4,
    Q => sig_73_5
  );

  reg_74_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_4,
    Q => sig_74_5
  );

  reg_74_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_5,
    Q => sig_74_6
  );

  cmpswp_75_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_6,
    Y => sig_74_6,
    MIN => sig_75_7,
    MAX => sig_76_7
  );

  reg_76_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_7,
    Q => sig_76_8
  );

  reg_76_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_8,
    Q => sig_76_9
  );

  reg_76_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_9,
    Q => sig_76_10
  );

  reg_76_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_10,
    Q => sig_76_11
  );

  reg_76_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_11,
    Q => sig_76_12
  );

  cmpswp_77_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_1,
    Y => sig_27_1,
    MIN => sig_77_2,
    MAX => sig_78_2
  );

  reg_77_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_2,
    Q => sig_77_3
  );

  reg_77_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_3,
    Q => sig_77_4
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

  reg_78_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_2,
    Q => sig_78_3
  );

  reg_78_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_3,
    Q => sig_78_4
  );

  reg_78_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_4,
    Q => sig_78_5
  );

  cmpswp_79_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Y => sig_51_3,
    MIN => sig_79_4,
    MAX => sig_80_4
  );

  reg_80_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_4,
    Q => sig_80_5
  );

  reg_80_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_5,
    Q => sig_80_6
  );

  reg_80_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_6,
    Q => sig_80_7
  );

  reg_80_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_7,
    Q => sig_80_8
  );

  reg_80_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_8,
    Q => sig_80_9
  );

  reg_80_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_9,
    Q => sig_80_10
  );

  reg_80_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_10,
    Q => sig_80_11
  );

  reg_80_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_11,
    Q => sig_80_12
  );

  reg_80_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_12,
    Q => sig_80_13
  );

  reg_80_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_13,
    Q => sig_80_14
  );

  cmpswp_81_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Y => sig_70_2,
    MIN => sig_81_3,
    MAX => sig_82_3
  );

  reg_81_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_3,
    Q => sig_81_4
  );

  reg_82_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_3,
    Q => sig_82_4
  );

  reg_82_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_4,
    Q => sig_82_5
  );

  reg_82_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_5,
    Q => sig_82_6
  );

  reg_82_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_6,
    Q => sig_82_7
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

  cmpswp_83_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_4,
    Y => sig_79_4,
    MIN => sig_83_5,
    MAX => sig_84_5
  );

  cmpswp_85_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_5,
    Y => sig_84_5,
    MIN => sig_85_6,
    MAX => sig_86_6
  );

  cmpswp_88_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_6,
    Y => sig_86_6,
    MIN => sig_88_7,
    MAX => sig_87_7
  );

  reg_88_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_7,
    Q => sig_88_8
  );

  reg_88_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_8,
    Q => sig_88_9
  );

  reg_88_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_9,
    Q => sig_88_10
  );

  reg_88_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_10,
    Q => sig_88_11
  );

  reg_88_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_11,
    Q => sig_88_12
  );

  reg_88_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_12,
    Q => sig_88_13
  );

  cmpswp_90_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_5,
    Y => sig_73_5,
    MIN => sig_90_6,
    MAX => sig_89_6
  );

  reg_89_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_6,
    Q => sig_89_7
  );

  cmpswp_93_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_7,
    Y => sig_11_7,
    MIN => sig_93_8,
    MAX => sig_94_8
  );

  cmpswp_95_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_4,
    Y => sig_53_4,
    MIN => sig_95_5,
    MAX => sig_96_5
  );

  reg_95_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_5,
    Q => sig_95_6
  );

  reg_96_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_5,
    Q => sig_96_6
  );

  cmpswp_97_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_4,
    Y => sig_54_4,
    MIN => sig_97_5,
    MAX => sig_98_5
  );

  cmpswp_99_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_5,
    Y => sig_98_5,
    MIN => sig_99_6,
    MAX => sig_100_6
  );

  reg_99_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_6,
    Q => sig_99_7
  );

  reg_99_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_7,
    Q => sig_99_8
  );

  reg_100_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_6,
    Q => sig_100_7
  );

  reg_100_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_7,
    Q => sig_100_8
  );

  reg_100_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_8,
    Q => sig_100_9
  );

  reg_100_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_9,
    Q => sig_100_10
  );

  reg_100_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_10,
    Q => sig_100_11
  );

  reg_100_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_11,
    Q => sig_100_12
  );

  reg_100_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_12,
    Q => sig_100_13
  );

  reg_100_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_13,
    Q => sig_100_14
  );

  reg_100_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_14,
    Q => sig_100_15
  );

  cmpswp_102_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_6,
    Y => sig_95_6,
    MIN => sig_102_7,
    MAX => sig_101_7
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

  cmpswp_103_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_2,
    Y => sig_69_2,
    MIN => sig_103_3,
    MAX => sig_104_3
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

  reg_103_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_6,
    Q => sig_103_7
  );

  reg_103_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_7,
    Q => sig_103_8
  );

  reg_104_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_3,
    Q => sig_104_4
  );

  reg_104_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_4,
    Q => sig_104_5
  );

  cmpswp_106_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_5,
    Y => sig_104_5,
    MIN => sig_106_6,
    MAX => sig_105_6
  );

  cmpswp_107_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_6,
    Y => sig_77_6,
    MIN => sig_107_7,
    MAX => sig_108_7
  );

  cmpswp_109_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_8,
    Y => sig_93_8,
    MIN => sig_109_9,
    MAX => sig_110_9
  );

  reg_110_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_9,
    Q => sig_110_10
  );

  cmpswp_111_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_8,
    Y => sig_94_8,
    MIN => sig_111_9,
    MAX => sig_112_9
  );

  cmpswp_120_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_9,
    Y => sig_111_9,
    MIN => sig_120_10,
    MAX => sig_119_10
  );

  reg_119_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_10,
    Q => sig_119_11
  );

  cmpswp_122_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_10,
    Y => sig_120_10,
    MIN => sig_122_11,
    MAX => sig_121_11
  );

  reg_122_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_11,
    Q => sig_122_12
  );

  reg_122_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_12,
    Q => sig_122_13
  );

  reg_122_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_13,
    Q => sig_122_14
  );

  reg_122_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_14,
    Q => sig_122_15
  );

  reg_122_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_15,
    Q => sig_122_16
  );

  reg_122_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_16,
    Q => sig_122_17
  );

  reg_122_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_17,
    Q => sig_122_18
  );

  reg_122_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_18,
    Q => sig_122_19
  );

  reg_122_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_19,
    Q => sig_122_20
  );

  reg_122_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_20,
    Q => sig_122_21
  );

  reg_122_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_21,
    Q => sig_122_22
  );

  reg_122_22: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_22,
    Q => sig_122_23
  );

  cmpswp_124_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_2,
    Y => sig_44_2,
    MIN => sig_124_3,
    MAX => sig_123_3
  );

  reg_123_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_3,
    Q => sig_123_4
  );

  reg_123_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_4,
    Q => sig_123_5
  );

  reg_123_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_5,
    Q => sig_123_6
  );

  reg_123_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_6,
    Q => sig_123_7
  );

  cmpswp_131_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_7,
    Y => sig_108_7,
    MIN => sig_131_8,
    MAX => sig_132_8
  );

  reg_131_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_8,
    Q => sig_131_9
  );

  reg_131_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_9,
    Q => sig_131_10
  );

  reg_131_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_10,
    Q => sig_131_11
  );

  reg_131_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_11,
    Q => sig_131_12
  );

  reg_131_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_12,
    Q => sig_131_13
  );

  reg_131_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_13,
    Q => sig_131_14
  );

  reg_131_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_14,
    Q => sig_131_15
  );

  cmpswp_133_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_8,
    Y => sig_132_8,
    MIN => sig_133_9,
    MAX => sig_134_9
  );

  reg_133_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_9,
    Q => sig_133_10
  );

  reg_133_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_10,
    Q => sig_133_11
  );

  reg_133_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_11,
    Q => sig_133_12
  );

  reg_133_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_12,
    Q => sig_133_13
  );

  reg_133_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_13,
    Q => sig_133_14
  );

  reg_133_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_14,
    Q => sig_133_15
  );

  reg_133_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_15,
    Q => sig_133_16
  );

  reg_133_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_16,
    Q => sig_133_17
  );

  reg_133_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_17,
    Q => sig_133_18
  );

  cmpswp_137_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_6,
    Y => sig_72_6,
    MIN => sig_137_7,
    MAX => sig_138_7
  );

  reg_137_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_137_7,
    Q => sig_137_8
  );

  reg_137_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_137_8,
    Q => sig_137_9
  );

  reg_137_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_137_9,
    Q => sig_137_10
  );

  reg_137_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_137_10,
    Q => sig_137_11
  );

  reg_137_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_137_11,
    Q => sig_137_12
  );

  cmpswp_139_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_121_11,
    Y => sig_119_11,
    MIN => sig_139_12,
    MAX => sig_140_12
  );

  cmpswp_141_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_12,
    Y => sig_137_12,
    MIN => sig_141_13,
    MAX => sig_142_13
  );

  reg_142_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_142_13,
    Q => sig_142_14
  );

  cmpswp_149_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_13,
    Y => sig_141_13,
    MIN => sig_149_14,
    MAX => sig_150_14
  );

  reg_149_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_14,
    Q => sig_149_15
  );

  reg_149_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_15,
    Q => sig_149_16
  );

  reg_149_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_16,
    Q => sig_149_17
  );

  reg_149_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_17,
    Q => sig_149_18
  );

  reg_149_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_18,
    Q => sig_149_19
  );

  reg_149_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_19,
    Q => sig_149_20
  );

  reg_149_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_20,
    Q => sig_149_21
  );

  reg_149_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_21,
    Q => sig_149_22
  );

  cmpswp_151_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_14,
    Y => sig_150_14,
    MIN => sig_151_15,
    MAX => sig_152_15
  );

  cmpswp_153_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_151_15,
    Y => sig_131_15,
    MIN => sig_153_16,
    MAX => sig_154_16
  );

  reg_153_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_16,
    Q => sig_153_17
  );

  reg_153_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_17,
    Q => sig_153_18
  );

  cmpswp_157_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_12,
    Y => sig_140_12,
    MIN => sig_157_13,
    MAX => sig_158_13
  );

  cmpswp_160_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_13,
    Y => sig_82_13,
    MIN => sig_160_14,
    MAX => sig_159_14
  );

  cmpswp_171_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_7,
    Y => sig_87_7,
    MIN => sig_171_8,
    MAX => sig_172_8
  );

  reg_171_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_8,
    Q => sig_171_9
  );

  reg_171_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_9,
    Q => sig_171_10
  );

  reg_171_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_10,
    Q => sig_171_11
  );

  reg_171_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_11,
    Q => sig_171_12
  );

  reg_171_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_12,
    Q => sig_171_13
  );

  reg_171_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_13,
    Q => sig_171_14
  );

  reg_171_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_14,
    Q => sig_171_15
  );

  reg_171_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_15,
    Q => sig_171_16
  );

  cmpswp_185_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_14,
    Y => sig_142_14,
    MIN => sig_185_15,
    MAX => sig_186_15
  );

  reg_186_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_15,
    Q => sig_186_16
  );

  reg_186_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_16,
    Q => sig_186_17
  );

  cmpswp_187_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_16,
    Y => sig_154_16,
    MIN => sig_187_17,
    MAX => sig_188_17
  );

  cmpswp_189_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_15,
    Y => sig_185_15,
    MIN => sig_189_16,
    MAX => sig_190_16
  );

  reg_189_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_189_16,
    Q => sig_189_17
  );

  cmpswp_191_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_189_17,
    Y => sig_187_17,
    MIN => sig_191_18,
    MAX => sig_192_18
  );

  reg_191_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_191_18,
    Q => sig_191_19
  );

  cmpswp_194_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_17,
    Y => sig_188_17,
    MIN => sig_194_18,
    MAX => sig_193_18
  );

  cmpswp_197_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_18,
    Y => sig_192_18,
    MIN => sig_197_19,
    MAX => sig_198_19
  );

  cmpswp_199_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_18,
    Y => sig_194_18,
    MIN => sig_199_19,
    MAX => sig_200_19
  );

  cmpswp_201_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_19,
    Y => sig_60_19,
    MIN => sig_201_20,
    MAX => sig_202_20
  );

  cmpswp_207_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_19,
    Y => sig_200_19,
    MIN => sig_207_20,
    MAX => sig_208_20
  );

  cmpswp_209_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_207_20,
    Y => sig_202_20,
    MIN => sig_209_21,
    MAX => sig_210_21
  );

  cmpswp_212_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_19,
    Y => sig_191_19,
    MIN => sig_212_20,
    MAX => sig_211_20
  );

  reg_211_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_20,
    Q => sig_211_21
  );

  cmpswp_213_22: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_209_21,
    Y => sig_211_21,
    MIN => sig_213_22,
    MAX => sig_214_22
  );

  cmpswp_218_23: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_214_22,
    Y => sig_149_22,
    MIN => sig_218_23,
    MAX => sig_217_23
  );

  cmpswp_221_24: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_23,
    Y => sig_217_23,
    MIN => sig_221_24,
    MAX => sig_222_24
  );

  sig_out_med <= sig_222_24;
end generated;
