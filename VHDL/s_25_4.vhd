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
  signal sig_0_0, sig_1_0, sig_1_1, sig_1_2, sig_2_0, sig_3_0, sig_4_0, sig_4_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_4_2, sig_4_3, sig_5_0, sig_5_1, sig_6_0, sig_7_0, sig_7_1, sig_8_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_9_0, sig_10_0, sig_11_0, sig_11_1, sig_11_2, sig_11_3, sig_12_0, sig_13_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_0, sig_14_1, sig_14_2, sig_15_0, sig_15_1, sig_16_0, sig_16_1, sig_17_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_0, sig_18_1, sig_18_2, sig_18_3, sig_18_4, sig_18_5, sig_18_6, sig_18_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_8, sig_19_0, sig_20_0, sig_20_1, sig_21_0, sig_21_1, sig_21_2, sig_21_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_4, sig_21_5, sig_21_6, sig_22_0, sig_23_0, sig_24_0, sig_25_1, sig_26_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_2, sig_26_2, sig_26_3, sig_27_1, sig_28_1, sig_28_2, sig_29_1, sig_30_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_2, sig_31_2, sig_32_2, sig_31_3, sig_31_4, sig_31_5, sig_31_6, sig_31_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_31_8, sig_31_9, sig_32_3, sig_34_1, sig_33_1, sig_35_2, sig_36_2, sig_35_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_4, sig_37_2, sig_38_2, sig_39_3, sig_40_3, sig_40_4, sig_40_5, sig_41_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_42_3, sig_43_4, sig_44_4, sig_44_5, sig_44_6, sig_44_7, sig_44_8, sig_45_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_1, sig_49_2, sig_50_2, sig_49_3, sig_49_4, sig_49_5, sig_49_6, sig_49_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_49_8, sig_50_3, sig_50_4, sig_52_2, sig_51_2, sig_53_3, sig_54_3, sig_54_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_54_5, sig_54_6, sig_54_7, sig_56_3, sig_55_3, sig_55_4, sig_55_5, sig_55_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_5, sig_58_5, sig_59_4, sig_60_4, sig_62_4, sig_61_4, sig_64_1, sig_63_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_63_2, sig_63_3, sig_63_4, sig_65_2, sig_66_2, sig_65_3, sig_65_4, sig_65_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_3, sig_66_4, sig_70_6, sig_69_6, sig_72_4, sig_71_4, sig_74_5, sig_73_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_73_6, sig_73_7, sig_75_6, sig_76_6, sig_77_7, sig_78_7, sig_78_8, sig_78_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_10, sig_78_11, sig_78_12, sig_78_13, sig_78_14, sig_78_15, sig_80_3, sig_79_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_79_4, sig_79_5, sig_79_6, sig_79_7, sig_81_4, sig_82_4, sig_83_5, sig_84_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_83_6, sig_85_7, sig_86_7, sig_85_8, sig_85_9, sig_85_10, sig_85_11, sig_85_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_85_13, sig_85_14, sig_85_15, sig_87_8, sig_88_8, sig_90_9, sig_89_9, sig_91_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_92_5, sig_93_7, sig_94_7, sig_95_8, sig_96_8, sig_98_9, sig_97_9, sig_100_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_99_1, sig_100_2, sig_100_3, sig_100_4, sig_99_2, sig_99_3, sig_99_4, sig_99_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_99_6, sig_99_7, sig_99_8, sig_99_9, sig_101_10, sig_102_10, sig_105_5, sig_106_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_106_6, sig_106_7, sig_106_8, sig_106_9, sig_106_10, sig_106_11, sig_106_12, sig_106_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_106_14, sig_107_6, sig_108_6, sig_107_7, sig_107_8, sig_107_9, sig_108_7, sig_108_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_108_9, sig_108_10, sig_108_11, sig_108_12, sig_108_13, sig_115_5, sig_116_5, sig_115_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_115_7, sig_115_8, sig_115_9, sig_115_10, sig_115_11, sig_115_12, sig_116_6, sig_116_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_116_8, sig_117_10, sig_118_10, sig_117_11, sig_117_12, sig_117_13, sig_117_14, sig_117_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_117_16, sig_117_17, sig_118_11, sig_122_8, sig_121_8, sig_123_6, sig_124_6, sig_124_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_124_8, sig_124_9, sig_124_10, sig_126_11, sig_125_11, sig_127_12, sig_128_12, sig_128_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_128_14, sig_128_15, sig_129_13, sig_130_13, sig_129_14, sig_129_15, sig_129_16, sig_129_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_129_18, sig_129_19, sig_129_20, sig_129_21, sig_129_22, sig_131_14, sig_132_14, sig_133_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_134_15, sig_139_9, sig_140_9, sig_142_5, sig_141_5, sig_142_6, sig_142_7, sig_143_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_144_8, sig_144_9, sig_145_10, sig_146_10, sig_145_11, sig_145_12, sig_145_13, sig_145_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_145_15, sig_145_16, sig_146_11, sig_146_12, sig_146_13, sig_146_14, sig_146_15, sig_146_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_147_10, sig_148_10, sig_148_11, sig_149_9, sig_150_9, sig_150_10, sig_150_11, sig_150_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_150_13, sig_150_14, sig_150_15, sig_150_16, sig_155_14, sig_156_14, sig_157_9, sig_158_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_157_10, sig_157_11, sig_157_12, sig_157_13, sig_157_14, sig_159_15, sig_160_15, sig_161_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_162_16, sig_163_16, sig_164_16, sig_165_12, sig_166_12, sig_165_13, sig_165_14, sig_165_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_165_16, sig_169_17, sig_170_17, sig_170_18, sig_170_19, sig_170_20, sig_185_16, sig_186_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_185_17, sig_187_17, sig_188_17, sig_189_18, sig_190_18, sig_191_18, sig_192_18, sig_194_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_193_17, sig_194_18, sig_194_19, sig_194_20, sig_194_21, sig_194_22, sig_197_19, sig_198_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_198_20, sig_198_21, sig_199_17, sig_200_17, sig_199_18, sig_199_19, sig_201_20, sig_202_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_210_21, sig_209_21, sig_214_22, sig_213_22, sig_218_23, sig_217_23, sig_219_23, sig_220_23 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_221_24, sig_222_24 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_1_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Q => sig_1_1
  );

  reg_1_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_1,
    Q => sig_1_2
  );

  reg_4_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Q => sig_4_1
  );

  reg_4_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_1,
    Q => sig_4_2
  );

  reg_4_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_2,
    Q => sig_4_3
  );

  reg_5_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Q => sig_5_1
  );

  reg_7_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Q => sig_7_1
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

  reg_14_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Q => sig_14_1
  );

  reg_14_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Q => sig_14_2
  );

  reg_15_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Q => sig_15_1
  );

  reg_16_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_0,
    Q => sig_16_1
  );

  reg_18_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Q => sig_18_1
  );

  reg_18_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Q => sig_18_2
  );

  reg_18_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_2,
    Q => sig_18_3
  );

  reg_18_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_3,
    Q => sig_18_4
  );

  reg_18_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_4,
    Q => sig_18_5
  );

  reg_18_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_5,
    Q => sig_18_6
  );

  reg_18_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_6,
    Q => sig_18_7
  );

  reg_18_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_7,
    Q => sig_18_8
  );

  reg_20_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_0,
    Q => sig_20_1
  );

  reg_21_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_0,
    Q => sig_21_1
  );

  reg_21_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Q => sig_21_2
  );

  reg_21_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_2,
    Q => sig_21_3
  );

  reg_21_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_3,
    Q => sig_21_4
  );

  reg_21_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_4,
    Q => sig_21_5
  );

  reg_21_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_5,
    Q => sig_21_6
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_10_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  reg_25_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Q => sig_25_2
  );

  reg_26_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Q => sig_26_2
  );

  reg_26_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Q => sig_26_3
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_17_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  reg_28_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Q => sig_28_2
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_19_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  reg_30_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_1,
    Q => sig_30_2
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Y => sig_27_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  reg_31_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_2,
    Q => sig_31_3
  );

  reg_31_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Q => sig_31_4
  );

  reg_31_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_4,
    Q => sig_31_5
  );

  reg_31_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_5,
    Q => sig_31_6
  );

  reg_31_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_6,
    Q => sig_31_7
  );

  reg_31_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_7,
    Q => sig_31_8
  );

  reg_31_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_8,
    Q => sig_31_9
  );

  reg_32_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Q => sig_32_3
  );

  cmpswp_34_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_8_0,
    MIN => sig_34_1,
    MAX => sig_33_1
  );

  cmpswp_35_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_1,
    Y => sig_34_1,
    MIN => sig_35_2,
    MAX => sig_36_2
  );

  reg_35_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_2,
    Q => sig_35_3
  );

  reg_35_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_3,
    Q => sig_35_4
  );

  cmpswp_37_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_1,
    Y => sig_33_1,
    MIN => sig_37_2,
    MAX => sig_38_2
  );

  cmpswp_39_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Y => sig_37_2,
    MIN => sig_39_3,
    MAX => sig_40_3
  );

  reg_40_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_3,
    Q => sig_40_4
  );

  reg_40_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_4,
    Q => sig_40_5
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_2,
    Y => sig_38_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  cmpswp_43_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Y => sig_39_3,
    MIN => sig_43_4,
    MAX => sig_44_4
  );

  reg_44_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_4,
    Q => sig_44_5
  );

  reg_44_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_5,
    Q => sig_44_6
  );

  reg_44_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_6,
    Q => sig_44_7
  );

  reg_44_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_7,
    Q => sig_44_8
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_13_0,
    MIN => sig_45_1,
    MAX => sig_46_1
  );

  cmpswp_49_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Y => sig_45_1,
    MIN => sig_49_2,
    MAX => sig_50_2
  );

  reg_49_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_2,
    Q => sig_49_3
  );

  reg_49_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_3,
    Q => sig_49_4
  );

  reg_49_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_4,
    Q => sig_49_5
  );

  reg_49_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_5,
    Q => sig_49_6
  );

  reg_49_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_6,
    Q => sig_49_7
  );

  reg_49_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_7,
    Q => sig_49_8
  );

  reg_50_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_2,
    Q => sig_50_3
  );

  reg_50_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Q => sig_50_4
  );

  cmpswp_52_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_1,
    Y => sig_16_1,
    MIN => sig_52_2,
    MAX => sig_51_2
  );

  cmpswp_53_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_2,
    Y => sig_52_2,
    MIN => sig_53_3,
    MAX => sig_54_3
  );

  reg_54_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_3,
    Q => sig_54_4
  );

  reg_54_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_4,
    Q => sig_54_5
  );

  reg_54_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_5,
    Q => sig_54_6
  );

  reg_54_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_6,
    Q => sig_54_7
  );

  cmpswp_56_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Y => sig_51_2,
    MIN => sig_56_3,
    MAX => sig_55_3
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

  reg_55_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_5,
    Q => sig_55_6
  );

  cmpswp_57_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Y => sig_35_4,
    MIN => sig_57_5,
    MAX => sig_58_5
  );

  cmpswp_59_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Y => sig_26_3,
    MIN => sig_59_4,
    MAX => sig_60_4
  );

  cmpswp_62_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_53_3,
    MIN => sig_62_4,
    MAX => sig_61_4
  );

  cmpswp_64_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_0,
    Y => sig_24_0,
    MIN => sig_64_1,
    MAX => sig_63_1
  );

  reg_63_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_1,
    Q => sig_63_2
  );

  reg_63_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_2,
    Q => sig_63_3
  );

  reg_63_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_3,
    Q => sig_63_4
  );

  cmpswp_65_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_64_1,
    MIN => sig_65_2,
    MAX => sig_66_2
  );

  reg_65_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_2,
    Q => sig_65_3
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

  reg_66_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_2,
    Q => sig_66_3
  );

  reg_66_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_3,
    Q => sig_66_4
  );

  cmpswp_70_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_5,
    Y => sig_65_5,
    MIN => sig_70_6,
    MAX => sig_69_6
  );

  cmpswp_72_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_3,
    Y => sig_4_3,
    MIN => sig_72_4,
    MAX => sig_71_4
  );

  cmpswp_74_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_4,
    Y => sig_71_4,
    MIN => sig_74_5,
    MAX => sig_73_5
  );

  reg_73_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_5,
    Q => sig_73_6
  );

  reg_73_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_6,
    Q => sig_73_7
  );

  cmpswp_75_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_5,
    Y => sig_74_5,
    MIN => sig_75_6,
    MAX => sig_76_6
  );

  cmpswp_77_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_6,
    Y => sig_75_6,
    MIN => sig_77_7,
    MAX => sig_78_7
  );

  reg_78_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_7,
    Q => sig_78_8
  );

  reg_78_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_8,
    Q => sig_78_9
  );

  reg_78_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_9,
    Q => sig_78_10
  );

  reg_78_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_10,
    Q => sig_78_11
  );

  reg_78_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_11,
    Q => sig_78_12
  );

  reg_78_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_12,
    Q => sig_78_13
  );

  reg_78_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_13,
    Q => sig_78_14
  );

  reg_78_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_14,
    Q => sig_78_15
  );

  cmpswp_80_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Y => sig_36_2,
    MIN => sig_80_3,
    MAX => sig_79_3
  );

  reg_79_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_3,
    Q => sig_79_4
  );

  reg_79_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_4,
    Q => sig_79_5
  );

  reg_79_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_5,
    Q => sig_79_6
  );

  reg_79_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_6,
    Q => sig_79_7
  );

  cmpswp_81_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_3,
    Y => sig_80_3,
    MIN => sig_81_4,
    MAX => sig_82_4
  );

  cmpswp_83_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_4,
    Y => sig_62_4,
    MIN => sig_83_5,
    MAX => sig_84_5
  );

  reg_83_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_5,
    Q => sig_83_6
  );

  cmpswp_85_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Y => sig_83_6,
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

  reg_85_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_9,
    Q => sig_85_10
  );

  reg_85_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_10,
    Q => sig_85_11
  );

  reg_85_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_11,
    Q => sig_85_12
  );

  reg_85_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_12,
    Q => sig_85_13
  );

  reg_85_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_13,
    Q => sig_85_14
  );

  reg_85_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_14,
    Q => sig_85_15
  );

  cmpswp_87_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_7,
    Y => sig_86_7,
    MIN => sig_87_8,
    MAX => sig_88_8
  );

  cmpswp_90_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_8,
    Y => sig_87_8,
    MIN => sig_90_9,
    MAX => sig_89_9
  );

  cmpswp_91_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_4,
    Y => sig_72_4,
    MIN => sig_91_5,
    MAX => sig_92_5
  );

  cmpswp_93_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_6,
    Y => sig_76_6,
    MIN => sig_93_7,
    MAX => sig_94_7
  );

  cmpswp_95_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_7,
    Y => sig_93_7,
    MIN => sig_95_8,
    MAX => sig_96_8
  );

  cmpswp_98_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_8,
    Y => sig_18_8,
    MIN => sig_98_9,
    MAX => sig_97_9
  );

  cmpswp_100_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_23_0,
    MIN => sig_100_1,
    MAX => sig_99_1
  );

  reg_100_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_1,
    Q => sig_100_2
  );

  reg_100_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_2,
    Q => sig_100_3
  );

  reg_100_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_3,
    Q => sig_100_4
  );

  reg_99_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_1,
    Q => sig_99_2
  );

  reg_99_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_2,
    Q => sig_99_3
  );

  reg_99_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_3,
    Q => sig_99_4
  );

  reg_99_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_4,
    Q => sig_99_5
  );

  reg_99_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_5,
    Q => sig_99_6
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

  reg_99_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_8,
    Q => sig_99_9
  );

  cmpswp_101_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_9,
    Y => sig_97_9,
    MIN => sig_101_10,
    MAX => sig_102_10
  );

  cmpswp_105_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_4,
    Y => sig_59_4,
    MIN => sig_105_5,
    MAX => sig_106_5
  );

  reg_106_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_5,
    Q => sig_106_6
  );

  reg_106_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_6,
    Q => sig_106_7
  );

  reg_106_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_7,
    Q => sig_106_8
  );

  reg_106_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_8,
    Q => sig_106_9
  );

  reg_106_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_9,
    Q => sig_106_10
  );

  reg_106_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_10,
    Q => sig_106_11
  );

  reg_106_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_11,
    Q => sig_106_12
  );

  reg_106_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_12,
    Q => sig_106_13
  );

  reg_106_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_13,
    Q => sig_106_14
  );

  cmpswp_107_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_5,
    Y => sig_92_5,
    MIN => sig_107_6,
    MAX => sig_108_6
  );

  reg_107_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_6,
    Q => sig_107_7
  );

  reg_107_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_7,
    Q => sig_107_8
  );

  reg_107_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_8,
    Q => sig_107_9
  );

  reg_108_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_6,
    Q => sig_108_7
  );

  reg_108_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_7,
    Q => sig_108_8
  );

  reg_108_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_8,
    Q => sig_108_9
  );

  reg_108_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_9,
    Q => sig_108_10
  );

  reg_108_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_10,
    Q => sig_108_11
  );

  reg_108_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_11,
    Q => sig_108_12
  );

  reg_108_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_12,
    Q => sig_108_13
  );

  cmpswp_115_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_4,
    Y => sig_66_4,
    MIN => sig_115_5,
    MAX => sig_116_5
  );

  reg_115_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_5,
    Q => sig_115_6
  );

  reg_115_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_6,
    Q => sig_115_7
  );

  reg_115_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_7,
    Q => sig_115_8
  );

  reg_115_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_8,
    Q => sig_115_9
  );

  reg_115_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_9,
    Q => sig_115_10
  );

  reg_115_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_10,
    Q => sig_115_11
  );

  reg_115_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_11,
    Q => sig_115_12
  );

  reg_116_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_5,
    Q => sig_116_6
  );

  reg_116_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_6,
    Q => sig_116_7
  );

  reg_116_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_7,
    Q => sig_116_8
  );

  cmpswp_117_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_9,
    Y => sig_107_9,
    MIN => sig_117_10,
    MAX => sig_118_10
  );

  reg_117_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_10,
    Q => sig_117_11
  );

  reg_117_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_11,
    Q => sig_117_12
  );

  reg_117_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_12,
    Q => sig_117_13
  );

  reg_117_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_13,
    Q => sig_117_14
  );

  reg_117_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_14,
    Q => sig_117_15
  );

  reg_117_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_15,
    Q => sig_117_16
  );

  reg_117_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_16,
    Q => sig_117_17
  );

  reg_118_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_10,
    Q => sig_118_11
  );

  cmpswp_122_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_7,
    Y => sig_73_7,
    MIN => sig_122_8,
    MAX => sig_121_8
  );

  cmpswp_123_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_5,
    Y => sig_91_5,
    MIN => sig_123_6,
    MAX => sig_124_6
  );

  reg_124_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_6,
    Q => sig_124_7
  );

  reg_124_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_7,
    Q => sig_124_8
  );

  reg_124_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_8,
    Q => sig_124_9
  );

  reg_124_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_9,
    Q => sig_124_10
  );

  cmpswp_126_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_10,
    Y => sig_124_10,
    MIN => sig_126_11,
    MAX => sig_125_11
  );

  cmpswp_127_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_11,
    Y => sig_126_11,
    MIN => sig_127_12,
    MAX => sig_128_12
  );

  reg_128_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_128_12,
    Q => sig_128_13
  );

  reg_128_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_128_13,
    Q => sig_128_14
  );

  reg_128_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_128_14,
    Q => sig_128_15
  );

  cmpswp_129_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_127_12,
    Y => sig_115_12,
    MIN => sig_129_13,
    MAX => sig_130_13
  );

  reg_129_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_13,
    Q => sig_129_14
  );

  reg_129_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_14,
    Q => sig_129_15
  );

  reg_129_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_15,
    Q => sig_129_16
  );

  reg_129_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_16,
    Q => sig_129_17
  );

  reg_129_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_17,
    Q => sig_129_18
  );

  reg_129_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_18,
    Q => sig_129_19
  );

  reg_129_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_19,
    Q => sig_129_20
  );

  reg_129_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_20,
    Q => sig_129_21
  );

  reg_129_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_21,
    Q => sig_129_22
  );

  cmpswp_131_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_130_13,
    Y => sig_108_13,
    MIN => sig_131_14,
    MAX => sig_132_14
  );

  cmpswp_133_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_14,
    Y => sig_132_14,
    MIN => sig_133_15,
    MAX => sig_134_15
  );

  cmpswp_139_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_8,
    Y => sig_116_8,
    MIN => sig_139_9,
    MAX => sig_140_9
  );

  cmpswp_142_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_4,
    Y => sig_100_4,
    MIN => sig_142_5,
    MAX => sig_141_5
  );

  reg_142_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_142_5,
    Q => sig_142_6
  );

  reg_142_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_142_6,
    Q => sig_142_7
  );

  cmpswp_143_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_142_7,
    Y => sig_77_7,
    MIN => sig_143_8,
    MAX => sig_144_8
  );

  reg_144_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_8,
    Q => sig_144_9
  );

  cmpswp_145_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_9,
    Y => sig_144_9,
    MIN => sig_145_10,
    MAX => sig_146_10
  );

  reg_145_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_10,
    Q => sig_145_11
  );

  reg_145_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_11,
    Q => sig_145_12
  );

  reg_145_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_12,
    Q => sig_145_13
  );

  reg_145_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_13,
    Q => sig_145_14
  );

  reg_145_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_14,
    Q => sig_145_15
  );

  reg_145_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_15,
    Q => sig_145_16
  );

  reg_146_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_10,
    Q => sig_146_11
  );

  reg_146_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_11,
    Q => sig_146_12
  );

  reg_146_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_12,
    Q => sig_146_13
  );

  reg_146_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_13,
    Q => sig_146_14
  );

  reg_146_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_14,
    Q => sig_146_15
  );

  reg_146_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_15,
    Q => sig_146_16
  );

  cmpswp_147_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_9,
    Y => sig_139_9,
    MIN => sig_147_10,
    MAX => sig_148_10
  );

  reg_148_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_10,
    Q => sig_148_11
  );

  cmpswp_149_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_8,
    Y => sig_85_8,
    MIN => sig_149_9,
    MAX => sig_150_9
  );

  reg_150_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_9,
    Q => sig_150_10
  );

  reg_150_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_10,
    Q => sig_150_11
  );

  reg_150_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_11,
    Q => sig_150_12
  );

  reg_150_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_12,
    Q => sig_150_13
  );

  reg_150_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_13,
    Q => sig_150_14
  );

  reg_150_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_14,
    Q => sig_150_15
  );

  reg_150_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_15,
    Q => sig_150_16
  );

  cmpswp_155_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_130_13,
    Y => sig_108_13,
    MIN => sig_155_14,
    MAX => sig_156_14
  );

  cmpswp_157_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_8,
    Y => sig_44_8,
    MIN => sig_157_9,
    MAX => sig_158_9
  );

  reg_157_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_9,
    Q => sig_157_10
  );

  reg_157_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_10,
    Q => sig_157_11
  );

  reg_157_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_11,
    Q => sig_157_12
  );

  reg_157_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_12,
    Q => sig_157_13
  );

  reg_157_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_13,
    Q => sig_157_14
  );

  cmpswp_159_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_14,
    Y => sig_155_14,
    MIN => sig_159_15,
    MAX => sig_160_15
  );

  cmpswp_161_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_15,
    Y => sig_133_15,
    MIN => sig_161_16,
    MAX => sig_162_16
  );

  cmpswp_163_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_15,
    Y => sig_128_15,
    MIN => sig_163_16,
    MAX => sig_164_16
  );

  cmpswp_165_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_11,
    Y => sig_125_11,
    MIN => sig_165_12,
    MAX => sig_166_12
  );

  reg_165_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_165_12,
    Q => sig_165_13
  );

  reg_165_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_165_13,
    Q => sig_165_14
  );

  reg_165_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_165_14,
    Q => sig_165_15
  );

  reg_165_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_165_15,
    Q => sig_165_16
  );

  cmpswp_169_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_163_16,
    Y => sig_165_16,
    MIN => sig_169_17,
    MAX => sig_170_17
  );

  reg_170_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_170_17,
    Q => sig_170_18
  );

  reg_170_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_170_18,
    Q => sig_170_19
  );

  reg_170_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_170_19,
    Q => sig_170_20
  );

  cmpswp_185_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_159_15,
    Y => sig_78_15,
    MIN => sig_185_16,
    MAX => sig_186_16
  );

  reg_185_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_185_16,
    Q => sig_185_17
  );

  cmpswp_187_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_16,
    Y => sig_150_16,
    MIN => sig_187_17,
    MAX => sig_188_17
  );

  cmpswp_189_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_169_17,
    Y => sig_185_17,
    MIN => sig_189_18,
    MAX => sig_190_18
  );

  cmpswp_191_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_17,
    Y => sig_187_17,
    MIN => sig_191_18,
    MAX => sig_192_18
  );

  cmpswp_194_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_164_16,
    Y => sig_145_16,
    MIN => sig_194_17,
    MAX => sig_193_17
  );

  reg_194_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_17,
    Q => sig_194_18
  );

  reg_194_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_18,
    Q => sig_194_19
  );

  reg_194_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_19,
    Q => sig_194_20
  );

  reg_194_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_20,
    Q => sig_194_21
  );

  reg_194_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_21,
    Q => sig_194_22
  );

  cmpswp_197_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_190_18,
    Y => sig_192_18,
    MIN => sig_197_19,
    MAX => sig_198_19
  );

  reg_198_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_19,
    Q => sig_198_20
  );

  reg_198_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_20,
    Q => sig_198_21
  );

  cmpswp_199_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_162_16,
    Y => sig_146_16,
    MIN => sig_199_17,
    MAX => sig_200_17
  );

  reg_199_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_17,
    Q => sig_199_18
  );

  reg_199_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_18,
    Q => sig_199_19
  );

  cmpswp_201_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_19,
    Y => sig_199_19,
    MIN => sig_201_20,
    MAX => sig_202_20
  );

  cmpswp_210_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_170_20,
    Y => sig_202_20,
    MIN => sig_210_21,
    MAX => sig_209_21
  );

  cmpswp_214_22: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_21,
    Y => sig_210_21,
    MIN => sig_214_22,
    MAX => sig_213_22
  );

  cmpswp_218_23: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_214_22,
    Y => sig_129_22,
    MIN => sig_218_23,
    MAX => sig_217_23
  );

  cmpswp_219_23: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_213_22,
    Y => sig_194_22,
    MIN => sig_219_23,
    MAX => sig_220_23
  );

  cmpswp_221_24: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_219_23,
    Y => sig_217_23,
    MIN => sig_221_24,
    MAX => sig_222_24
  );

  sig_out_med <= sig_222_24;
end generated;
