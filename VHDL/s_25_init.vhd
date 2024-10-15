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
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_5_0, sig_5_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_7_0, sig_8_0, sig_8_1, sig_9_0, sig_10_0, sig_11_0, sig_11_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_0, sig_13_0, sig_14_0, sig_14_1, sig_15_0, sig_16_0, sig_17_0, sig_17_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_0, sig_19_0, sig_20_0, sig_20_1, sig_21_0, sig_22_0, sig_23_0, sig_24_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_1, sig_26_1, sig_25_2, sig_25_3, sig_25_4, sig_26_2, sig_26_3, sig_27_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_28_1, sig_27_2, sig_29_2, sig_30_2, sig_31_3, sig_32_3, sig_33_1, sig_34_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_2, sig_35_2, sig_36_2, sig_37_3, sig_38_3, sig_39_1, sig_40_1, sig_39_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_2, sig_42_2, sig_42_3, sig_43_3, sig_44_3, sig_43_4, sig_44_4, sig_45_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_1, sig_45_2, sig_47_2, sig_48_2, sig_49_3, sig_50_3, sig_51_1, sig_52_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_2, sig_53_2, sig_54_2, sig_55_3, sig_56_3, sig_57_1, sig_58_1, sig_57_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_59_2, sig_60_2, sig_61_3, sig_62_3, sig_61_4, sig_62_4, sig_63_1, sig_64_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_63_2, sig_65_2, sig_66_2, sig_67_3, sig_68_3, sig_69_1, sig_70_1, sig_69_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_69_3, sig_70_2, sig_70_3, sig_71_4, sig_72_4, sig_71_5, sig_71_6, sig_71_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_72_5, sig_72_6, sig_73_4, sig_74_4, sig_73_5, sig_75_5, sig_76_5, sig_76_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_77_6, sig_78_6, sig_77_7, sig_78_7, sig_79_3, sig_80_3, sig_79_4, sig_81_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_4, sig_83_5, sig_84_5, sig_83_6, sig_84_6, sig_85_4, sig_86_4, sig_85_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_87_5, sig_88_5, sig_89_6, sig_90_6, sig_91_4, sig_92_4, sig_91_5, sig_93_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_94_5, sig_95_6, sig_96_6, sig_97_3, sig_98_3, sig_97_4, sig_99_4, sig_100_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_101_5, sig_102_5, sig_103_4, sig_104_4, sig_103_5, sig_105_5, sig_106_5, sig_107_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_108_6, sig_109_4, sig_110_4, sig_109_5, sig_111_5, sig_112_5, sig_113_6, sig_114_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_115_3, sig_116_3, sig_115_4, sig_115_5, sig_116_4, sig_116_5, sig_117_7, sig_118_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_118_8, sig_119_7, sig_120_7, sig_119_8, sig_121_8, sig_122_8, sig_122_9, sig_122_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_122_11, sig_122_12, sig_122_13, sig_122_14, sig_122_15, sig_122_16, sig_122_17, sig_122_18 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_123_9, sig_124_9, sig_125_6, sig_126_6, sig_125_7, sig_127_7, sig_128_7, sig_129_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_130_8, sig_129_9, sig_131_7, sig_132_7, sig_131_8, sig_133_8, sig_134_8, sig_134_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_134_10, sig_134_11, sig_134_12, sig_134_13, sig_134_14, sig_134_15, sig_134_16, sig_134_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_134_18, sig_134_19, sig_134_20, sig_134_21, sig_135_9, sig_136_9, sig_137_7, sig_138_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_137_8, sig_139_8, sig_140_8, sig_141_9, sig_142_9, sig_143_6, sig_144_6, sig_143_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_145_7, sig_146_7, sig_147_8, sig_148_8, sig_149_6, sig_150_6, sig_149_7, sig_151_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_152_7, sig_152_8, sig_153_8, sig_154_8, sig_154_9, sig_154_10, sig_154_11, sig_155_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_156_6, sig_155_7, sig_157_7, sig_158_7, sig_159_8, sig_160_8, sig_159_9, sig_161_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_162_5, sig_161_6, sig_161_7, sig_163_8, sig_164_8, sig_163_9, sig_165_9, sig_166_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_167_9, sig_168_9, sig_167_10, sig_169_10, sig_170_10, sig_171_11, sig_172_11, sig_173_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_174_10, sig_174_11, sig_175_10, sig_176_10, sig_177_9, sig_178_9, sig_178_10, sig_179_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_180_11, sig_181_12, sig_182_12, sig_182_13, sig_182_14, sig_182_15, sig_182_16, sig_183_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_184_9, sig_183_10, sig_184_10, sig_184_11, sig_184_12, sig_184_13, sig_185_10, sig_186_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_186_11, sig_186_12, sig_187_12, sig_188_12, sig_189_11, sig_190_11, sig_189_12, sig_190_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_190_13, sig_191_13, sig_192_13, sig_193_13, sig_194_13, sig_193_14, sig_195_14, sig_196_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_197_14, sig_198_14, sig_197_15, sig_198_15, sig_198_16, sig_198_17, sig_198_18, sig_199_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_200_15, sig_200_16, sig_200_17, sig_201_16, sig_202_16, sig_202_17, sig_202_18, sig_202_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_203_17, sig_204_17, sig_205_18, sig_206_18, sig_207_19, sig_208_19, sig_209_20, sig_210_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_211_19, sig_212_19, sig_211_20, sig_212_20, sig_213_21, sig_214_21, sig_215_21, sig_216_21 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_215_22, sig_217_22, sig_218_22, sig_217_23, sig_219_23, sig_220_23, sig_221_24, sig_222_24 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_17_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Q => sig_17_1
  );

  reg_20_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_0,
    Q => sig_20_1
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_1_0,
    MIN => sig_25_1,
    MAX => sig_26_1
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
    Y => sig_4_0,
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
    X => sig_2_1,
    Y => sig_28_1,
    MIN => sig_29_2,
    MAX => sig_30_2
  );

  cmpswp_31_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
    Y => sig_27_2,
    MIN => sig_31_3,
    MAX => sig_32_3
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_7_0,
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
    X => sig_5_1,
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
    X => sig_9_0,
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

  cmpswp_41_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_1,
    Y => sig_40_1,
    MIN => sig_41_2,
    MAX => sig_42_2
  );

  reg_42_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_2,
    Q => sig_42_3
  );

  cmpswp_43_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_2,
    Y => sig_39_2,
    MIN => sig_43_3,
    MAX => sig_44_3
  );

  reg_43_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Q => sig_43_4
  );

  reg_44_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_3,
    Q => sig_44_4
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_13_0,
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
    X => sig_11_1,
    Y => sig_46_1,
    MIN => sig_47_2,
    MAX => sig_48_2
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
    X => sig_15_0,
    Y => sig_16_0,
    MIN => sig_51_1,
    MAX => sig_52_1
  );

  reg_51_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_1,
    Q => sig_51_2
  );

  cmpswp_53_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_52_1,
    MIN => sig_53_2,
    MAX => sig_54_2
  );

  cmpswp_55_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_2,
    Y => sig_51_2,
    MIN => sig_55_3,
    MAX => sig_56_3
  );

  cmpswp_57_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_19_0,
    MIN => sig_57_1,
    MAX => sig_58_1
  );

  reg_57_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_1,
    Q => sig_57_2
  );

  cmpswp_59_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_58_1,
    MIN => sig_59_2,
    MAX => sig_60_2
  );

  cmpswp_61_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_2,
    Y => sig_57_2,
    MIN => sig_61_3,
    MAX => sig_62_3
  );

  reg_61_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_3,
    Q => sig_61_4
  );

  reg_62_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_3,
    Q => sig_62_4
  );

  cmpswp_63_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_0,
    Y => sig_22_0,
    MIN => sig_63_1,
    MAX => sig_64_1
  );

  reg_63_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_1,
    Q => sig_63_2
  );

  cmpswp_65_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_64_1,
    MIN => sig_65_2,
    MAX => sig_66_2
  );

  cmpswp_67_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_2,
    Y => sig_63_2,
    MIN => sig_67_3,
    MAX => sig_68_3
  );

  cmpswp_69_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_0,
    Y => sig_24_0,
    MIN => sig_69_1,
    MAX => sig_70_1
  );

  reg_69_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_1,
    Q => sig_69_2
  );

  reg_69_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_2,
    Q => sig_69_3
  );

  reg_70_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_1,
    Q => sig_70_2
  );

  reg_70_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_2,
    Q => sig_70_3
  );

  cmpswp_71_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Y => sig_37_3,
    MIN => sig_71_4,
    MAX => sig_72_4
  );

  reg_71_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_4,
    Q => sig_71_5
  );

  reg_71_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_5,
    Q => sig_71_6
  );

  reg_71_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_6,
    Q => sig_71_7
  );

  reg_72_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_4,
    Q => sig_72_5
  );

  reg_72_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_5,
    Q => sig_72_6
  );

  cmpswp_73_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_38_3,
    MIN => sig_73_4,
    MAX => sig_74_4
  );

  reg_73_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_4,
    Q => sig_73_5
  );

  cmpswp_75_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_4,
    Y => sig_74_4,
    MIN => sig_75_5,
    MAX => sig_76_5
  );

  reg_76_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_5,
    Q => sig_76_6
  );

  cmpswp_77_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_5,
    Y => sig_73_5,
    MIN => sig_77_6,
    MAX => sig_78_6
  );

  reg_77_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_6,
    Q => sig_77_7
  );

  reg_78_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_6,
    Q => sig_78_7
  );

  cmpswp_79_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Y => sig_36_2,
    MIN => sig_79_3,
    MAX => sig_80_3
  );

  reg_79_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_3,
    Q => sig_79_4
  );

  cmpswp_81_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Y => sig_80_3,
    MIN => sig_81_4,
    MAX => sig_82_4
  );

  cmpswp_83_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_4,
    Y => sig_79_4,
    MIN => sig_83_5,
    MAX => sig_84_5
  );

  reg_83_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_5,
    Q => sig_83_6
  );

  reg_84_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_5,
    Q => sig_84_6
  );

  cmpswp_85_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_3,
    Y => sig_55_3,
    MIN => sig_85_4,
    MAX => sig_86_4
  );

  reg_85_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_4,
    Q => sig_85_5
  );

  cmpswp_87_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Y => sig_86_4,
    MIN => sig_87_5,
    MAX => sig_88_5
  );

  cmpswp_89_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_5,
    Y => sig_85_5,
    MIN => sig_89_6,
    MAX => sig_90_6
  );

  cmpswp_91_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Y => sig_56_3,
    MIN => sig_91_4,
    MAX => sig_92_4
  );

  reg_91_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_4,
    Q => sig_91_5
  );

  cmpswp_93_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_4,
    Y => sig_92_4,
    MIN => sig_93_5,
    MAX => sig_94_5
  );

  cmpswp_95_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_5,
    Y => sig_91_5,
    MIN => sig_95_6,
    MAX => sig_96_6
  );

  cmpswp_97_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_2,
    Y => sig_54_2,
    MIN => sig_97_3,
    MAX => sig_98_3
  );

  reg_97_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_3,
    Q => sig_97_4
  );

  cmpswp_99_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Y => sig_98_3,
    MIN => sig_99_4,
    MAX => sig_100_4
  );

  cmpswp_101_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_4,
    Y => sig_97_4,
    MIN => sig_101_5,
    MAX => sig_102_5
  );

  cmpswp_103_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_3,
    Y => sig_69_3,
    MIN => sig_103_4,
    MAX => sig_104_4
  );

  reg_103_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_4,
    Q => sig_103_5
  );

  cmpswp_105_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_4,
    Y => sig_104_4,
    MIN => sig_105_5,
    MAX => sig_106_5
  );

  cmpswp_107_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_5,
    Y => sig_103_5,
    MIN => sig_107_6,
    MAX => sig_108_6
  );

  cmpswp_109_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_3,
    Y => sig_70_3,
    MIN => sig_109_4,
    MAX => sig_110_4
  );

  reg_109_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_4,
    Q => sig_109_5
  );

  cmpswp_111_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_4,
    Y => sig_110_4,
    MIN => sig_111_5,
    MAX => sig_112_5
  );

  cmpswp_113_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_5,
    Y => sig_109_5,
    MIN => sig_113_6,
    MAX => sig_114_6
  );

  cmpswp_115_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_2,
    Y => sig_66_2,
    MIN => sig_115_3,
    MAX => sig_116_3
  );

  reg_115_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_3,
    Q => sig_115_4
  );

  reg_115_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_4,
    Q => sig_115_5
  );

  reg_116_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_3,
    Q => sig_116_4
  );

  reg_116_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_4,
    Q => sig_116_5
  );

  cmpswp_117_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_6,
    Y => sig_107_6,
    MIN => sig_117_7,
    MAX => sig_118_7
  );

  reg_118_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_7,
    Q => sig_118_8
  );

  cmpswp_119_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_6,
    Y => sig_113_6,
    MIN => sig_119_7,
    MAX => sig_120_7
  );

  reg_119_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_7,
    Q => sig_119_8
  );

  cmpswp_121_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_7,
    Y => sig_120_7,
    MIN => sig_121_8,
    MAX => sig_122_8
  );

  reg_122_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_8,
    Q => sig_122_9
  );

  reg_122_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_9,
    Q => sig_122_10
  );

  reg_122_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_10,
    Q => sig_122_11
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

  cmpswp_123_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_121_8,
    Y => sig_119_8,
    MIN => sig_123_9,
    MAX => sig_124_9
  );

  cmpswp_125_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_5,
    Y => sig_115_5,
    MIN => sig_125_6,
    MAX => sig_126_6
  );

  reg_125_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_125_6,
    Q => sig_125_7
  );

  cmpswp_127_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_6,
    Y => sig_126_6,
    MIN => sig_127_7,
    MAX => sig_128_7
  );

  cmpswp_129_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_127_7,
    Y => sig_125_7,
    MIN => sig_129_8,
    MAX => sig_130_8
  );

  reg_129_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_8,
    Q => sig_129_9
  );

  cmpswp_131_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_6,
    Y => sig_108_6,
    MIN => sig_131_7,
    MAX => sig_132_7
  );

  reg_131_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_7,
    Q => sig_131_8
  );

  cmpswp_133_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_7,
    Y => sig_132_7,
    MIN => sig_133_8,
    MAX => sig_134_8
  );

  reg_134_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_8,
    Q => sig_134_9
  );

  reg_134_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_9,
    Q => sig_134_10
  );

  reg_134_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_10,
    Q => sig_134_11
  );

  reg_134_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_11,
    Q => sig_134_12
  );

  reg_134_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_12,
    Q => sig_134_13
  );

  reg_134_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_13,
    Q => sig_134_14
  );

  reg_134_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_14,
    Q => sig_134_15
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

  reg_134_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_17,
    Q => sig_134_18
  );

  reg_134_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_18,
    Q => sig_134_19
  );

  reg_134_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_19,
    Q => sig_134_20
  );

  reg_134_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_20,
    Q => sig_134_21
  );

  cmpswp_135_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_8,
    Y => sig_131_8,
    MIN => sig_135_9,
    MAX => sig_136_9
  );

  cmpswp_137_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_6,
    Y => sig_114_6,
    MIN => sig_137_7,
    MAX => sig_138_7
  );

  reg_137_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_137_7,
    Q => sig_137_8
  );

  cmpswp_139_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_7,
    Y => sig_138_7,
    MIN => sig_139_8,
    MAX => sig_140_8
  );

  cmpswp_141_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_8,
    Y => sig_137_8,
    MIN => sig_141_9,
    MAX => sig_142_9
  );

  cmpswp_143_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_5,
    Y => sig_116_5,
    MIN => sig_143_6,
    MAX => sig_144_6
  );

  reg_143_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_6,
    Q => sig_143_7
  );

  cmpswp_145_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_6,
    Y => sig_144_6,
    MIN => sig_145_7,
    MAX => sig_146_7
  );

  cmpswp_147_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_7,
    Y => sig_143_7,
    MIN => sig_147_8,
    MAX => sig_148_8
  );

  cmpswp_149_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_5,
    Y => sig_106_5,
    MIN => sig_149_6,
    MAX => sig_150_6
  );

  reg_149_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_6,
    Q => sig_149_7
  );

  cmpswp_151_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_6,
    Y => sig_150_6,
    MIN => sig_151_7,
    MAX => sig_152_7
  );

  reg_152_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_152_7,
    Q => sig_152_8
  );

  cmpswp_153_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_151_7,
    Y => sig_149_7,
    MIN => sig_153_8,
    MAX => sig_154_8
  );

  reg_154_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_154_8,
    Q => sig_154_9
  );

  reg_154_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_154_9,
    Q => sig_154_10
  );

  reg_154_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_154_10,
    Q => sig_154_11
  );

  cmpswp_155_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_5,
    Y => sig_112_5,
    MIN => sig_155_6,
    MAX => sig_156_6
  );

  reg_155_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_155_6,
    Q => sig_155_7
  );

  cmpswp_157_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_6,
    Y => sig_156_6,
    MIN => sig_157_7,
    MAX => sig_158_7
  );

  cmpswp_159_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_7,
    Y => sig_155_7,
    MIN => sig_159_8,
    MAX => sig_160_8
  );

  reg_159_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_159_8,
    Q => sig_159_9
  );

  cmpswp_161_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_4,
    Y => sig_100_4,
    MIN => sig_161_5,
    MAX => sig_162_5
  );

  reg_161_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_161_5,
    Q => sig_161_6
  );

  reg_161_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_161_6,
    Q => sig_161_7
  );

  cmpswp_163_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_161_7,
    Y => sig_128_7,
    MIN => sig_163_8,
    MAX => sig_164_8
  );

  reg_163_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_163_8,
    Q => sig_163_9
  );

  cmpswp_165_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_8,
    Y => sig_140_8,
    MIN => sig_165_9,
    MAX => sig_166_9
  );

  cmpswp_167_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_8,
    Y => sig_152_8,
    MIN => sig_167_9,
    MAX => sig_168_9
  );

  reg_167_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_167_9,
    Q => sig_167_10
  );

  cmpswp_169_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_163_9,
    Y => sig_165_9,
    MIN => sig_169_10,
    MAX => sig_170_10
  );

  cmpswp_171_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_169_10,
    Y => sig_167_10,
    MIN => sig_171_11,
    MAX => sig_172_11
  );

  cmpswp_173_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_9,
    Y => sig_124_9,
    MIN => sig_173_10,
    MAX => sig_174_10
  );

  reg_174_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_174_10,
    Q => sig_174_11
  );

  cmpswp_175_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_141_9,
    Y => sig_136_9,
    MIN => sig_175_10,
    MAX => sig_176_10
  );

  cmpswp_177_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_8,
    Y => sig_118_8,
    MIN => sig_177_9,
    MAX => sig_178_9
  );

  reg_178_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_178_9,
    Q => sig_178_10
  );

  cmpswp_179_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_176_10,
    Y => sig_178_10,
    MIN => sig_179_11,
    MAX => sig_180_11
  );

  cmpswp_181_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_174_11,
    Y => sig_180_11,
    MIN => sig_181_12,
    MAX => sig_182_12
  );

  reg_182_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_182_12,
    Q => sig_182_13
  );

  reg_182_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_182_13,
    Q => sig_182_14
  );

  reg_182_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_182_14,
    Q => sig_182_15
  );

  reg_182_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_182_15,
    Q => sig_182_16
  );

  cmpswp_183_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_147_8,
    Y => sig_130_8,
    MIN => sig_183_9,
    MAX => sig_184_9
  );

  reg_183_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_183_9,
    Q => sig_183_10
  );

  reg_184_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_9,
    Q => sig_184_10
  );

  reg_184_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_10,
    Q => sig_184_11
  );

  reg_184_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_11,
    Q => sig_184_12
  );

  reg_184_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_12,
    Q => sig_184_13
  );

  cmpswp_185_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_159_9,
    Y => sig_142_9,
    MIN => sig_185_10,
    MAX => sig_186_10
  );

  reg_186_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_10,
    Q => sig_186_11
  );

  reg_186_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_11,
    Q => sig_186_12
  );

  cmpswp_187_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_171_11,
    Y => sig_154_11,
    MIN => sig_187_12,
    MAX => sig_188_12
  );

  cmpswp_189_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_183_10,
    Y => sig_185_10,
    MIN => sig_189_11,
    MAX => sig_190_11
  );

  reg_189_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_189_11,
    Q => sig_189_12
  );

  reg_190_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_190_11,
    Q => sig_190_12
  );

  reg_190_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_190_12,
    Q => sig_190_13
  );

  cmpswp_191_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_189_12,
    Y => sig_187_12,
    MIN => sig_191_13,
    MAX => sig_192_13
  );

  cmpswp_193_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_12,
    Y => sig_188_12,
    MIN => sig_193_13,
    MAX => sig_194_13
  );

  reg_193_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_193_13,
    Q => sig_193_14
  );

  cmpswp_195_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_13,
    Y => sig_194_13,
    MIN => sig_195_14,
    MAX => sig_196_14
  );

  cmpswp_197_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_190_13,
    Y => sig_192_13,
    MIN => sig_197_14,
    MAX => sig_198_14
  );

  reg_197_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_14,
    Q => sig_197_15
  );

  reg_198_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_14,
    Q => sig_198_15
  );

  reg_198_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_15,
    Q => sig_198_16
  );

  reg_198_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_16,
    Q => sig_198_17
  );

  reg_198_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_17,
    Q => sig_198_18
  );

  cmpswp_199_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_195_14,
    Y => sig_193_14,
    MIN => sig_199_15,
    MAX => sig_200_15
  );

  reg_200_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_200_15,
    Q => sig_200_16
  );

  reg_200_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_200_16,
    Q => sig_200_17
  );

  cmpswp_201_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_15,
    Y => sig_199_15,
    MIN => sig_201_16,
    MAX => sig_202_16
  );

  reg_202_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_202_16,
    Q => sig_202_17
  );

  reg_202_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_202_17,
    Q => sig_202_18
  );

  reg_202_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_202_18,
    Q => sig_202_19
  );

  cmpswp_203_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_201_16,
    Y => sig_182_16,
    MIN => sig_203_17,
    MAX => sig_204_17
  );

  cmpswp_205_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_200_17,
    Y => sig_204_17,
    MIN => sig_205_18,
    MAX => sig_206_18
  );

  cmpswp_207_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_18,
    Y => sig_206_18,
    MIN => sig_207_19,
    MAX => sig_208_19
  );

  cmpswp_209_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_207_19,
    Y => sig_202_19,
    MIN => sig_209_20,
    MAX => sig_210_20
  );

  cmpswp_211_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_18,
    Y => sig_122_18,
    MIN => sig_211_19,
    MAX => sig_212_19
  );

  reg_211_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_19,
    Q => sig_211_20
  );

  reg_212_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_212_19,
    Q => sig_212_20
  );

  cmpswp_213_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_209_20,
    Y => sig_211_20,
    MIN => sig_213_21,
    MAX => sig_214_21
  );

  cmpswp_215_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_210_20,
    Y => sig_212_20,
    MIN => sig_215_21,
    MAX => sig_216_21
  );

  reg_215_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_215_21,
    Q => sig_215_22
  );

  cmpswp_217_22: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_214_21,
    Y => sig_134_21,
    MIN => sig_217_22,
    MAX => sig_218_22
  );

  reg_217_22: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_217_22,
    Q => sig_217_23
  );

  cmpswp_219_23: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_215_22,
    Y => sig_218_22,
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
