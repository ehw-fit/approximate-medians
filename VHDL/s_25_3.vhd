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
  signal sig_0_0, sig_1_0, sig_1_1, sig_1_2, sig_1_3, sig_2_0, sig_2_1, sig_3_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_3_1, sig_3_2, sig_4_0, sig_5_0, sig_6_0, sig_7_0, sig_8_0, sig_8_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_9_0, sig_10_0, sig_11_0, sig_11_1, sig_11_2, sig_11_3, sig_11_4, sig_12_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_0, sig_13_1, sig_13_2, sig_13_3, sig_14_0, sig_14_1, sig_15_0, sig_16_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_17_0, sig_17_1, sig_18_0, sig_19_0, sig_20_0, sig_20_1, sig_21_0, sig_22_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_0, sig_24_0, sig_25_1, sig_26_1, sig_25_2, sig_25_3, sig_25_4, sig_25_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_32_2, sig_31_2, sig_31_3, sig_31_4, sig_31_5, sig_33_1, sig_34_1, sig_34_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_3, sig_34_4, sig_34_5, sig_34_6, sig_34_7, sig_34_8, sig_34_9, sig_34_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_11, sig_34_12, sig_35_1, sig_36_1, sig_37_2, sig_38_2, sig_39_1, sig_40_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_2, sig_41_2, sig_42_2, sig_44_3, sig_43_3, sig_43_4, sig_43_5, sig_43_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_43_7, sig_45_4, sig_46_4, sig_45_5, sig_45_6, sig_45_7, sig_45_8, sig_45_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_10, sig_45_11, sig_45_12, sig_45_13, sig_45_14, sig_47_5, sig_48_5, sig_50_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_49_6, sig_50_7, sig_50_8, sig_51_1, sig_52_1, sig_51_2, sig_53_2, sig_54_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_56_3, sig_55_3, sig_56_4, sig_56_5, sig_56_6, sig_56_7, sig_58_1, sig_57_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_58_2, sig_58_3, sig_58_4, sig_58_5, sig_58_6, sig_57_2, sig_59_2, sig_60_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_61_3, sig_62_3, sig_61_4, sig_62_4, sig_63_1, sig_64_1, sig_63_2, sig_65_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_2, sig_67_3, sig_68_3, sig_69_1, sig_70_1, sig_69_2, sig_69_3, sig_70_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_70_3, sig_71_3, sig_72_3, sig_71_4, sig_71_5, sig_71_6, sig_71_7, sig_71_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_71_9, sig_71_10, sig_73_3, sig_74_3, sig_73_4, sig_75_4, sig_76_4, sig_76_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_76_6, sig_76_7, sig_76_8, sig_77_5, sig_78_5, sig_77_6, sig_77_7, sig_77_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_77_9, sig_77_10, sig_78_6, sig_78_7, sig_78_8, sig_78_9, sig_78_10, sig_83_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_84_3, sig_83_4, sig_83_5, sig_83_6, sig_85_7, sig_86_7, sig_87_8, sig_88_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_89_9, sig_90_9, sig_89_10, sig_92_8, sig_91_8, sig_93_4, sig_94_4, sig_93_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_93_6, sig_93_7, sig_93_8, sig_94_5, sig_94_6, sig_94_7, sig_94_8, sig_94_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_9, sig_96_9, sig_97_6, sig_98_6, sig_97_7, sig_99_7, sig_100_7, sig_102_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_101_8, sig_102_9, sig_102_10, sig_102_11, sig_102_12, sig_102_13, sig_103_4, sig_104_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_103_5, sig_105_5, sig_106_5, sig_106_6, sig_106_7, sig_106_8, sig_107_6, sig_108_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_108_7, sig_108_8, sig_108_9, sig_109_4, sig_110_4, sig_109_5, sig_111_5, sig_112_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_112_6, sig_112_7, sig_112_8, sig_112_9, sig_112_10, sig_112_11, sig_112_12, sig_112_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_112_14, sig_112_15, sig_112_16, sig_113_6, sig_114_6, sig_113_7, sig_113_8, sig_113_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_114_7, sig_114_8, sig_114_9, sig_116_3, sig_115_3, sig_116_4, sig_116_5, sig_116_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_116_7, sig_116_8, sig_116_9, sig_116_10, sig_116_11, sig_119_10, sig_120_10, sig_119_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_119_12, sig_119_13, sig_119_14, sig_119_15, sig_121_11, sig_122_11, sig_122_12, sig_122_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_122_14, sig_122_15, sig_122_16, sig_122_17, sig_122_18, sig_122_19, sig_122_20, sig_131_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_132_10, sig_133_11, sig_134_11, sig_134_12, sig_134_13, sig_134_14, sig_134_15, sig_134_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_134_17, sig_134_18, sig_134_19, sig_134_20, sig_134_21, sig_134_22, sig_138_10, sig_137_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_137_11, sig_139_11, sig_140_11, sig_140_12, sig_140_13, sig_140_14, sig_140_15, sig_144_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_143_12, sig_144_13, sig_144_14, sig_144_15, sig_144_16, sig_145_13, sig_146_13, sig_146_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_146_15, sig_146_16, sig_147_14, sig_148_14, sig_150_9, sig_149_9, sig_149_10, sig_149_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_149_12, sig_155_10, sig_156_10, sig_157_9, sig_158_9, sig_157_10, sig_159_11, sig_160_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_160_12, sig_160_13, sig_160_14, sig_160_15, sig_160_16, sig_160_17, sig_160_18, sig_160_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_160_20, sig_160_21, sig_166_15, sig_165_15, sig_167_16, sig_168_16, sig_174_11, sig_173_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_173_12, sig_173_13, sig_173_14, sig_179_17, sig_180_17, sig_180_18, sig_180_19, sig_180_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_182_16, sig_181_16, sig_183_15, sig_184_15, sig_184_16, sig_184_17, sig_185_12, sig_186_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_185_13, sig_185_14, sig_185_15, sig_186_13, sig_187_13, sig_188_13, sig_189_16, sig_190_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_193_14, sig_194_14, sig_193_15, sig_193_16, sig_193_17, sig_193_18, sig_195_18, sig_196_18 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_197_17, sig_198_17, sig_197_18, sig_197_19, sig_200_19, sig_199_19, sig_202_20, sig_201_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_203_17, sig_204_17, sig_204_18, sig_204_19, sig_205_20, sig_206_20, sig_209_21, sig_210_21 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_211_21, sig_212_21, sig_213_22, sig_214_22, sig_215_22, sig_216_22, sig_215_23, sig_217_23 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_218_23, sig_217_24, sig_219_24, sig_220_24, sig_221_25, sig_222_25 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_1_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_2,
    Q => sig_1_3
  );

  reg_2_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Q => sig_2_1
  );

  reg_3_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Q => sig_3_1
  );

  reg_3_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_1,
    Q => sig_3_2
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

  reg_13_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Q => sig_13_1
  );

  reg_13_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Q => sig_13_2
  );

  reg_13_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_2,
    Q => sig_13_3
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
    X => sig_4_0,
    Y => sig_6_0,
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

  reg_25_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_4,
    Q => sig_25_5
  );

  cmpswp_32_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Y => sig_2_1,
    MIN => sig_32_2,
    MAX => sig_31_2
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

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_5_0,
    MIN => sig_33_1,
    MAX => sig_34_1
  );

  reg_34_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_1,
    Q => sig_34_2
  );

  reg_34_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_2,
    Q => sig_34_3
  );

  reg_34_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_3,
    Q => sig_34_4
  );

  reg_34_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_4,
    Q => sig_34_5
  );

  reg_34_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_5,
    Q => sig_34_6
  );

  reg_34_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_6,
    Q => sig_34_7
  );

  reg_34_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_7,
    Q => sig_34_8
  );

  reg_34_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_8,
    Q => sig_34_9
  );

  reg_34_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_9,
    Q => sig_34_10
  );

  reg_34_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_10,
    Q => sig_34_11
  );

  reg_34_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_11,
    Q => sig_34_12
  );

  cmpswp_35_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_22_0,
    MIN => sig_35_1,
    MAX => sig_36_1
  );

  cmpswp_37_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_1,
    Y => sig_33_1,
    MIN => sig_37_2,
    MAX => sig_38_2
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

  cmpswp_44_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_2,
    Y => sig_39_2,
    MIN => sig_44_3,
    MAX => sig_43_3
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

  reg_43_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_6,
    Q => sig_43_7
  );

  cmpswp_45_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_3,
    Y => sig_13_3,
    MIN => sig_45_4,
    MAX => sig_46_4
  );

  reg_45_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_4,
    Q => sig_45_5
  );

  reg_45_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_5,
    Q => sig_45_6
  );

  reg_45_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Q => sig_45_7
  );

  reg_45_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_7,
    Q => sig_45_8
  );

  reg_45_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_8,
    Q => sig_45_9
  );

  reg_45_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_9,
    Q => sig_45_10
  );

  reg_45_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_10,
    Q => sig_45_11
  );

  reg_45_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_11,
    Q => sig_45_12
  );

  reg_45_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_12,
    Q => sig_45_13
  );

  reg_45_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_13,
    Q => sig_45_14
  );

  cmpswp_47_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Y => sig_11_4,
    MIN => sig_47_5,
    MAX => sig_48_5
  );

  cmpswp_50_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_5,
    Y => sig_25_5,
    MIN => sig_50_6,
    MAX => sig_49_6
  );

  reg_50_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_6,
    Q => sig_50_7
  );

  reg_50_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_7,
    Q => sig_50_8
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

  cmpswp_56_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_2,
    Y => sig_51_2,
    MIN => sig_56_3,
    MAX => sig_55_3
  );

  reg_56_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_3,
    Q => sig_56_4
  );

  reg_56_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Q => sig_56_5
  );

  reg_56_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_5,
    Q => sig_56_6
  );

  reg_56_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_6,
    Q => sig_56_7
  );

  cmpswp_58_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_19_0,
    MIN => sig_58_1,
    MAX => sig_57_1
  );

  reg_58_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_1,
    Q => sig_58_2
  );

  reg_58_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_2,
    Q => sig_58_3
  );

  reg_58_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_3,
    Q => sig_58_4
  );

  reg_58_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_4,
    Q => sig_58_5
  );

  reg_58_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_5,
    Q => sig_58_6
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
    Y => sig_36_1,
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
    Y => sig_12_0,
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

  cmpswp_71_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_2,
    Y => sig_37_2,
    MIN => sig_71_3,
    MAX => sig_72_3
  );

  reg_71_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_3,
    Q => sig_71_4
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

  reg_71_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_7,
    Q => sig_71_8
  );

  reg_71_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_8,
    Q => sig_71_9
  );

  reg_71_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_9,
    Q => sig_71_10
  );

  cmpswp_73_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Y => sig_38_2,
    MIN => sig_73_3,
    MAX => sig_74_3
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
    X => sig_1_3,
    Y => sig_74_3,
    MIN => sig_75_4,
    MAX => sig_76_4
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

  reg_76_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_6,
    Q => sig_76_7
  );

  reg_76_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_7,
    Q => sig_76_8
  );

  cmpswp_77_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_4,
    Y => sig_73_4,
    MIN => sig_77_5,
    MAX => sig_78_5
  );

  reg_77_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_5,
    Q => sig_77_6
  );

  reg_77_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_6,
    Q => sig_77_7
  );

  reg_77_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_7,
    Q => sig_77_8
  );

  reg_77_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_8,
    Q => sig_77_9
  );

  reg_77_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_9,
    Q => sig_77_10
  );

  reg_78_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_5,
    Q => sig_78_6
  );

  reg_78_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_6,
    Q => sig_78_7
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

  cmpswp_83_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_2,
    Y => sig_42_2,
    MIN => sig_83_3,
    MAX => sig_84_3
  );

  reg_83_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_3,
    Q => sig_83_4
  );

  reg_83_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_4,
    Q => sig_83_5
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
    X => sig_49_6,
    Y => sig_58_6,
    MIN => sig_85_7,
    MAX => sig_86_7
  );

  cmpswp_87_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_7,
    Y => sig_86_7,
    MIN => sig_87_8,
    MAX => sig_88_8
  );

  cmpswp_89_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_8,
    Y => sig_87_8,
    MIN => sig_89_9,
    MAX => sig_90_9
  );

  reg_89_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_9,
    Q => sig_89_10
  );

  cmpswp_92_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_7,
    Y => sig_56_7,
    MIN => sig_92_8,
    MAX => sig_91_8
  );

  cmpswp_93_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_3,
    Y => sig_55_3,
    MIN => sig_93_4,
    MAX => sig_94_4
  );

  reg_93_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_4,
    Q => sig_93_5
  );

  reg_93_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_5,
    Q => sig_93_6
  );

  reg_93_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_6,
    Q => sig_93_7
  );

  reg_93_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_7,
    Q => sig_93_8
  );

  reg_94_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_4,
    Q => sig_94_5
  );

  reg_94_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_5,
    Q => sig_94_6
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

  reg_94_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_8,
    Q => sig_94_9
  );

  cmpswp_95_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_8,
    Y => sig_91_8,
    MIN => sig_95_9,
    MAX => sig_96_9
  );

  cmpswp_97_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_5,
    Y => sig_31_5,
    MIN => sig_97_6,
    MAX => sig_98_6
  );

  reg_97_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_6,
    Q => sig_97_7
  );

  cmpswp_99_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_6,
    Y => sig_83_6,
    MIN => sig_99_7,
    MAX => sig_100_7
  );

  cmpswp_102_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_7,
    Y => sig_97_7,
    MIN => sig_102_8,
    MAX => sig_101_8
  );

  reg_102_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_8,
    Q => sig_102_9
  );

  reg_102_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_9,
    Q => sig_102_10
  );

  reg_102_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_10,
    Q => sig_102_11
  );

  reg_102_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_11,
    Q => sig_102_12
  );

  reg_102_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_12,
    Q => sig_102_13
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

  cmpswp_107_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_5,
    Y => sig_103_5,
    MIN => sig_107_6,
    MAX => sig_108_6
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

  reg_112_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_5,
    Q => sig_112_6
  );

  reg_112_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_6,
    Q => sig_112_7
  );

  reg_112_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_7,
    Q => sig_112_8
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

  reg_112_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_10,
    Q => sig_112_11
  );

  reg_112_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_11,
    Q => sig_112_12
  );

  reg_112_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_12,
    Q => sig_112_13
  );

  reg_112_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_13,
    Q => sig_112_14
  );

  reg_112_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_14,
    Q => sig_112_15
  );

  reg_112_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_15,
    Q => sig_112_16
  );

  cmpswp_113_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_5,
    Y => sig_109_5,
    MIN => sig_113_6,
    MAX => sig_114_6
  );

  reg_113_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_6,
    Q => sig_113_7
  );

  reg_113_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_7,
    Q => sig_113_8
  );

  reg_113_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_8,
    Q => sig_113_9
  );

  reg_114_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_6,
    Q => sig_114_7
  );

  reg_114_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_7,
    Q => sig_114_8
  );

  reg_114_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_8,
    Q => sig_114_9
  );

  cmpswp_116_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_2,
    Y => sig_66_2,
    MIN => sig_116_3,
    MAX => sig_115_3
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

  reg_116_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_8,
    Q => sig_116_9
  );

  reg_116_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_9,
    Q => sig_116_10
  );

  reg_116_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_10,
    Q => sig_116_11
  );

  cmpswp_119_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_9,
    Y => sig_113_9,
    MIN => sig_119_10,
    MAX => sig_120_10
  );

  reg_119_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_10,
    Q => sig_119_11
  );

  reg_119_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_11,
    Q => sig_119_12
  );

  reg_119_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_12,
    Q => sig_119_13
  );

  reg_119_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_13,
    Q => sig_119_14
  );

  reg_119_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_14,
    Q => sig_119_15
  );

  cmpswp_121_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_10,
    Y => sig_120_10,
    MIN => sig_121_11,
    MAX => sig_122_11
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

  cmpswp_131_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_9,
    Y => sig_108_9,
    MIN => sig_131_10,
    MAX => sig_132_10
  );

  cmpswp_133_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_10,
    Y => sig_132_10,
    MIN => sig_133_11,
    MAX => sig_134_11
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

  reg_134_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_21,
    Q => sig_134_22
  );

  cmpswp_138_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_9,
    Y => sig_114_9,
    MIN => sig_138_10,
    MAX => sig_137_10
  );

  reg_137_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_137_10,
    Q => sig_137_11
  );

  cmpswp_139_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_10,
    Y => sig_138_10,
    MIN => sig_139_11,
    MAX => sig_140_11
  );

  reg_140_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_11,
    Q => sig_140_12
  );

  reg_140_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_12,
    Q => sig_140_13
  );

  reg_140_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_13,
    Q => sig_140_14
  );

  reg_140_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_14,
    Q => sig_140_15
  );

  cmpswp_144_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_11,
    Y => sig_116_11,
    MIN => sig_144_12,
    MAX => sig_143_12
  );

  reg_144_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_12,
    Q => sig_144_13
  );

  reg_144_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_13,
    Q => sig_144_14
  );

  reg_144_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_14,
    Q => sig_144_15
  );

  reg_144_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_15,
    Q => sig_144_16
  );

  cmpswp_145_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_12,
    Y => sig_143_12,
    MIN => sig_145_13,
    MAX => sig_146_13
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

  cmpswp_147_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_13,
    Y => sig_102_13,
    MIN => sig_147_14,
    MAX => sig_148_14
  );

  cmpswp_150_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_8,
    Y => sig_106_8,
    MIN => sig_150_9,
    MAX => sig_149_9
  );

  reg_149_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_9,
    Q => sig_149_10
  );

  reg_149_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_10,
    Q => sig_149_11
  );

  reg_149_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_11,
    Q => sig_149_12
  );

  cmpswp_155_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_9,
    Y => sig_150_9,
    MIN => sig_155_10,
    MAX => sig_156_10
  );

  cmpswp_157_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_8,
    Y => sig_101_8,
    MIN => sig_157_9,
    MAX => sig_158_9
  );

  reg_157_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_9,
    Q => sig_157_10
  );

  cmpswp_159_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_157_10,
    Y => sig_155_10,
    MIN => sig_159_11,
    MAX => sig_160_11
  );

  reg_160_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_11,
    Q => sig_160_12
  );

  reg_160_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_12,
    Q => sig_160_13
  );

  reg_160_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_13,
    Q => sig_160_14
  );

  reg_160_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_14,
    Q => sig_160_15
  );

  reg_160_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_15,
    Q => sig_160_16
  );

  reg_160_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_16,
    Q => sig_160_17
  );

  reg_160_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_17,
    Q => sig_160_18
  );

  reg_160_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_18,
    Q => sig_160_19
  );

  reg_160_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_19,
    Q => sig_160_20
  );

  reg_160_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_20,
    Q => sig_160_21
  );

  cmpswp_166_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_14,
    Y => sig_45_14,
    MIN => sig_166_15,
    MAX => sig_165_15
  );

  cmpswp_167_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_15,
    Y => sig_166_15,
    MIN => sig_167_16,
    MAX => sig_168_16
  );

  cmpswp_174_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_156_10,
    Y => sig_89_10,
    MIN => sig_174_11,
    MAX => sig_173_11
  );

  reg_173_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_173_11,
    Q => sig_173_12
  );

  reg_173_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_173_12,
    Q => sig_173_13
  );

  reg_173_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_173_13,
    Q => sig_173_14
  );

  cmpswp_179_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_16,
    Y => sig_168_16,
    MIN => sig_179_17,
    MAX => sig_180_17
  );

  reg_180_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_180_17,
    Q => sig_180_18
  );

  reg_180_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_180_18,
    Q => sig_180_19
  );

  reg_180_19: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_180_19,
    Q => sig_180_20
  );

  cmpswp_182_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_165_15,
    Y => sig_119_15,
    MIN => sig_182_16,
    MAX => sig_181_16
  );

  cmpswp_183_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_147_14,
    Y => sig_173_14,
    MIN => sig_183_15,
    MAX => sig_184_15
  );

  reg_184_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_15,
    Q => sig_184_16
  );

  reg_184_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_16,
    Q => sig_184_17
  );

  cmpswp_185_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_159_11,
    Y => sig_137_11,
    MIN => sig_185_12,
    MAX => sig_186_12
  );

  reg_185_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_185_12,
    Q => sig_185_13
  );

  reg_185_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_185_13,
    Q => sig_185_14
  );

  reg_185_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_185_14,
    Q => sig_185_15
  );

  reg_186_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_12,
    Q => sig_186_13
  );

  cmpswp_187_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_12,
    Y => sig_149_12,
    MIN => sig_187_13,
    MAX => sig_188_13
  );

  cmpswp_189_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_183_15,
    Y => sig_185_15,
    MIN => sig_189_16,
    MAX => sig_190_16
  );

  cmpswp_193_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_13,
    Y => sig_188_13,
    MIN => sig_193_14,
    MAX => sig_194_14
  );

  reg_193_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_193_14,
    Q => sig_193_15
  );

  reg_193_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_193_15,
    Q => sig_193_16
  );

  reg_193_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_193_16,
    Q => sig_193_17
  );

  reg_193_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_193_17,
    Q => sig_193_18
  );

  cmpswp_195_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_179_17,
    Y => sig_184_17,
    MIN => sig_195_18,
    MAX => sig_196_18
  );

  cmpswp_197_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_190_16,
    Y => sig_112_16,
    MIN => sig_197_17,
    MAX => sig_198_17
  );

  reg_197_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_17,
    Q => sig_197_18
  );

  reg_197_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_18,
    Q => sig_197_19
  );

  cmpswp_200_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_195_18,
    Y => sig_193_18,
    MIN => sig_200_19,
    MAX => sig_199_19
  );

  cmpswp_202_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_19,
    Y => sig_199_19,
    MIN => sig_202_20,
    MAX => sig_201_20
  );

  cmpswp_203_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_181_16,
    Y => sig_144_16,
    MIN => sig_203_17,
    MAX => sig_204_17
  );

  reg_204_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_17,
    Q => sig_204_18
  );

  reg_204_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_18,
    Q => sig_204_19
  );

  cmpswp_205_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_200_19,
    Y => sig_204_19,
    MIN => sig_205_20,
    MAX => sig_206_20
  );

  cmpswp_209_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_180_20,
    Y => sig_202_20,
    MIN => sig_209_21,
    MAX => sig_210_21
  );

  cmpswp_211_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_20,
    Y => sig_122_20,
    MIN => sig_211_21,
    MAX => sig_212_21
  );

  cmpswp_213_22: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_209_21,
    Y => sig_211_21,
    MIN => sig_213_22,
    MAX => sig_214_22
  );

  cmpswp_215_22: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_21,
    Y => sig_212_21,
    MIN => sig_215_22,
    MAX => sig_216_22
  );

  reg_215_22: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_215_22,
    Q => sig_215_23
  );

  cmpswp_217_23: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_214_22,
    Y => sig_134_22,
    MIN => sig_217_23,
    MAX => sig_218_23
  );

  reg_217_23: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_217_23,
    Q => sig_217_24
  );

  cmpswp_219_24: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_215_23,
    Y => sig_218_23,
    MIN => sig_219_24,
    MAX => sig_220_24
  );

  cmpswp_221_25: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_219_24,
    Y => sig_217_24,
    MIN => sig_221_25,
    MAX => sig_222_25
  );

  sig_out_med <= sig_222_25;
end generated;
