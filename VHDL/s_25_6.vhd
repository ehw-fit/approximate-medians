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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0, sig_7_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_1, sig_7_2, sig_7_3, sig_7_4, sig_8_0, sig_9_0, sig_10_0, sig_11_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_1, sig_12_0, sig_13_0, sig_14_0, sig_14_1, sig_15_0, sig_16_0, sig_17_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_0, sig_19_0, sig_20_0, sig_21_0, sig_22_0, sig_22_1, sig_23_0, sig_24_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_24_1, sig_24_2, sig_24_3, sig_25_1, sig_26_1, sig_25_2, sig_27_1, sig_28_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_27_2, sig_27_3, sig_28_2, sig_28_3, sig_28_4, sig_28_5, sig_28_6, sig_28_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_1, sig_30_1, sig_34_1, sig_33_1, sig_33_2, sig_33_3, sig_33_4, sig_33_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_1, sig_36_1, sig_36_2, sig_38_1, sig_37_1, sig_39_1, sig_40_1, sig_40_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_3, sig_40_4, sig_41_1, sig_42_1, sig_44_2, sig_43_2, sig_44_3, sig_44_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_5, sig_46_2, sig_45_2, sig_46_3, sig_46_4, sig_45_3, sig_47_1, sig_48_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_2, sig_47_3, sig_48_2, sig_50_2, sig_49_2, sig_51_1, sig_52_1, sig_51_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_53_2, sig_54_2, sig_55_3, sig_56_3, sig_57_2, sig_58_2, sig_58_3, sig_58_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_3, sig_59_3, sig_59_4, sig_59_5, sig_62_2, sig_61_2, sig_62_3, sig_62_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_62_5, sig_62_6, sig_63_2, sig_64_2, sig_63_3, sig_65_3, sig_66_3, sig_66_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_67_4, sig_68_4, sig_69_4, sig_70_4, sig_72_5, sig_71_5, sig_72_6, sig_72_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_72_8, sig_72_9, sig_73_6, sig_74_6, sig_73_7, sig_75_3, sig_76_3, sig_76_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_76_5, sig_76_6, sig_78_5, sig_77_5, sig_80_3, sig_79_3, sig_81_4, sig_82_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_5, sig_82_6, sig_82_7, sig_82_8, sig_82_9, sig_82_10, sig_82_11, sig_82_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_13, sig_84_4, sig_83_4, sig_83_5, sig_83_6, sig_83_7, sig_83_8, sig_85_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_4, sig_87_5, sig_88_5, sig_88_6, sig_88_7, sig_88_8, sig_89_5, sig_90_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_89_6, sig_93_6, sig_94_6, sig_97_6, sig_98_6, sig_100_3, sig_99_3, sig_100_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_100_5, sig_107_5, sig_108_5, sig_110_6, sig_109_6, sig_111_4, sig_112_4, sig_111_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_111_6, sig_111_7, sig_114_7, sig_113_7, sig_116_5, sig_115_5, sig_122_6, sig_121_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_122_7, sig_122_8, sig_122_9, sig_122_10, sig_133_8, sig_134_8, sig_134_9, sig_134_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_134_11, sig_136_8, sig_135_8, sig_149_9, sig_150_9, sig_149_10, sig_149_11, sig_152_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_151_10, sig_156_7, sig_155_7, sig_159_8, sig_160_8, sig_160_9, sig_160_10, sig_168_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_167_11, sig_174_12, sig_173_12, sig_176_9, sig_175_9, sig_176_10, sig_176_11, sig_176_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_176_13, sig_176_14, sig_188_7, sig_187_7, sig_188_8, sig_188_9, sig_188_10, sig_188_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_188_12, sig_187_8, sig_187_9, sig_187_10, sig_187_11, sig_187_12, sig_191_13, sig_192_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_197_14, sig_198_14, sig_199_12, sig_200_12, sig_199_13, sig_199_14, sig_201_15, sig_202_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_204_13, sig_203_13, sig_204_14, sig_204_15, sig_204_16, sig_207_15, sig_208_15, sig_209_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_210_16, sig_212_11, sig_211_11, sig_212_12, sig_212_13, sig_212_14, sig_212_15, sig_212_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_212_17, sig_211_12, sig_211_13, sig_211_14, sig_211_15, sig_211_16, sig_214_17, sig_213_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_215_17, sig_216_17, sig_215_18, sig_217_18, sig_218_18, sig_217_19, sig_219_19, sig_220_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_221_20, sig_222_20 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_7_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Q => sig_7_1
  );

  reg_7_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_1,
    Q => sig_7_2
  );

  reg_7_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_2,
    Q => sig_7_3
  );

  reg_7_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_3,
    Q => sig_7_4
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

  reg_22_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_0,
    Q => sig_22_1
  );

  reg_24_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_0,
    Q => sig_24_1
  );

  reg_24_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Q => sig_24_2
  );

  reg_24_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_2,
    Q => sig_24_3
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_0,
    Y => sig_13_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  reg_25_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Q => sig_25_2
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

  reg_27_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_2,
    Q => sig_27_3
  );

  reg_28_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Q => sig_28_2
  );

  reg_28_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Q => sig_28_3
  );

  reg_28_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_3,
    Q => sig_28_4
  );

  reg_28_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_4,
    Q => sig_28_5
  );

  reg_28_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_5,
    Q => sig_28_6
  );

  reg_28_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_6,
    Q => sig_28_7
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_18_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  cmpswp_34_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_21_0,
    MIN => sig_34_1,
    MAX => sig_33_1
  );

  reg_33_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_1,
    Q => sig_33_2
  );

  reg_33_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_2,
    Q => sig_33_3
  );

  reg_33_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_3,
    Q => sig_33_4
  );

  reg_33_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_4,
    Q => sig_33_5
  );

  cmpswp_35_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_12_0,
    MIN => sig_35_1,
    MAX => sig_36_1
  );

  reg_36_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_1,
    Q => sig_36_2
  );

  cmpswp_38_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_23_0,
    MIN => sig_38_1,
    MAX => sig_37_1
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

  reg_40_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_3,
    Q => sig_40_4
  );

  cmpswp_41_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_8_0,
    MIN => sig_41_1,
    MAX => sig_42_1
  );

  cmpswp_44_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Y => sig_39_1,
    MIN => sig_44_2,
    MAX => sig_43_2
  );

  reg_44_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_2,
    Q => sig_44_3
  );

  reg_44_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_3,
    Q => sig_44_4
  );

  reg_44_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_4,
    Q => sig_44_5
  );

  cmpswp_46_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Y => sig_35_1,
    MIN => sig_46_2,
    MAX => sig_45_2
  );

  reg_46_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_2,
    Q => sig_46_3
  );

  reg_46_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_3,
    Q => sig_46_4
  );

  reg_45_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_2,
    Q => sig_45_3
  );

  cmpswp_47_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_0,
    Y => sig_17_0,
    MIN => sig_47_1,
    MAX => sig_48_1
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

  reg_48_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_1,
    Q => sig_48_2
  );

  cmpswp_50_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_1,
    Y => sig_30_1,
    MIN => sig_50_2,
    MAX => sig_49_2
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
    X => sig_52_1,
    Y => sig_14_1,
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

  cmpswp_57_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_1,
    Y => sig_38_1,
    MIN => sig_57_2,
    MAX => sig_58_2
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

  cmpswp_60_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_2,
    Y => sig_48_2,
    MIN => sig_60_3,
    MAX => sig_59_3
  );

  reg_59_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_3,
    Q => sig_59_4
  );

  reg_59_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_4,
    Q => sig_59_5
  );

  cmpswp_62_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Y => sig_11_1,
    MIN => sig_62_2,
    MAX => sig_61_2
  );

  reg_62_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_2,
    Q => sig_62_3
  );

  reg_62_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_3,
    Q => sig_62_4
  );

  reg_62_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_4,
    Q => sig_62_5
  );

  reg_62_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_5,
    Q => sig_62_6
  );

  cmpswp_63_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_1,
    Y => sig_22_1,
    MIN => sig_63_2,
    MAX => sig_64_2
  );

  reg_63_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_2,
    Q => sig_63_3
  );

  cmpswp_65_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_2,
    Y => sig_64_2,
    MIN => sig_65_3,
    MAX => sig_66_3
  );

  reg_66_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_3,
    Q => sig_66_4
  );

  cmpswp_67_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_3,
    Y => sig_63_3,
    MIN => sig_67_4,
    MAX => sig_68_4
  );

  cmpswp_69_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_3,
    Y => sig_24_3,
    MIN => sig_69_4,
    MAX => sig_70_4
  );

  cmpswp_72_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_4,
    Y => sig_70_4,
    MIN => sig_72_5,
    MAX => sig_71_5
  );

  reg_72_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_5,
    Q => sig_72_6
  );

  reg_72_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_6,
    Q => sig_72_7
  );

  reg_72_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_7,
    Q => sig_72_8
  );

  reg_72_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_8,
    Q => sig_72_9
  );

  cmpswp_73_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_5,
    Y => sig_71_5,
    MIN => sig_73_6,
    MAX => sig_74_6
  );

  reg_73_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_6,
    Q => sig_73_7
  );

  cmpswp_75_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Y => sig_43_2,
    MIN => sig_75_3,
    MAX => sig_76_3
  );

  reg_76_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_3,
    Q => sig_76_4
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

  cmpswp_78_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_4,
    Y => sig_69_4,
    MIN => sig_78_5,
    MAX => sig_77_5
  );

  cmpswp_80_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_2,
    Y => sig_36_2,
    MIN => sig_80_3,
    MAX => sig_79_3
  );

  cmpswp_81_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_3,
    Y => sig_80_3,
    MIN => sig_81_4,
    MAX => sig_82_4
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

  cmpswp_84_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Y => sig_79_3,
    MIN => sig_84_4,
    MAX => sig_83_4
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

  reg_83_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_6,
    Q => sig_83_7
  );

  reg_83_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_7,
    Q => sig_83_8
  );

  cmpswp_85_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_3,
    Y => sig_75_3,
    MIN => sig_85_4,
    MAX => sig_86_4
  );

  cmpswp_87_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Y => sig_86_4,
    MIN => sig_87_5,
    MAX => sig_88_5
  );

  reg_88_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_5,
    Q => sig_88_6
  );

  reg_88_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_6,
    Q => sig_88_7
  );

  reg_88_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_7,
    Q => sig_88_8
  );

  cmpswp_89_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_4,
    Y => sig_7_4,
    MIN => sig_89_5,
    MAX => sig_90_5
  );

  reg_89_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_5,
    Q => sig_89_6
  );

  cmpswp_93_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_5,
    Y => sig_78_5,
    MIN => sig_93_6,
    MAX => sig_94_6
  );

  cmpswp_97_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_5,
    Y => sig_33_5,
    MIN => sig_97_6,
    MAX => sig_98_6
  );

  cmpswp_100_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_2,
    Y => sig_54_2,
    MIN => sig_100_3,
    MAX => sig_99_3
  );

  reg_100_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_3,
    Q => sig_100_4
  );

  reg_100_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_4,
    Q => sig_100_5
  );

  cmpswp_107_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_4,
    Y => sig_67_4,
    MIN => sig_107_5,
    MAX => sig_108_5
  );

  cmpswp_110_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_5,
    Y => sig_108_5,
    MIN => sig_110_6,
    MAX => sig_109_6
  );

  cmpswp_111_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_3,
    Y => sig_45_3,
    MIN => sig_111_4,
    MAX => sig_112_4
  );

  reg_111_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_4,
    Q => sig_111_5
  );

  reg_111_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_5,
    Q => sig_111_6
  );

  reg_111_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_6,
    Q => sig_111_7
  );

  cmpswp_114_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_6,
    Y => sig_97_6,
    MIN => sig_114_7,
    MAX => sig_113_7
  );

  cmpswp_116_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_4,
    Y => sig_66_4,
    MIN => sig_116_5,
    MAX => sig_115_5
  );

  cmpswp_122_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_5,
    Y => sig_116_5,
    MIN => sig_122_6,
    MAX => sig_121_6
  );

  reg_122_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_6,
    Q => sig_122_7
  );

  reg_122_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_7,
    Q => sig_122_8
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

  cmpswp_133_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_7,
    Y => sig_114_7,
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

  cmpswp_136_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_7,
    Y => sig_113_7,
    MIN => sig_136_8,
    MAX => sig_135_8
  );

  cmpswp_149_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_8,
    Y => sig_136_8,
    MIN => sig_149_9,
    MAX => sig_150_9
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

  cmpswp_152_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_9,
    Y => sig_150_9,
    MIN => sig_152_10,
    MAX => sig_151_10
  );

  cmpswp_156_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_6,
    Y => sig_89_6,
    MIN => sig_156_7,
    MAX => sig_155_7
  );

  cmpswp_159_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_7,
    Y => sig_155_7,
    MIN => sig_159_8,
    MAX => sig_160_8
  );

  reg_160_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_8,
    Q => sig_160_9
  );

  reg_160_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_9,
    Q => sig_160_10
  );

  cmpswp_168_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_160_10,
    Y => sig_152_10,
    MIN => sig_168_11,
    MAX => sig_167_11
  );

  cmpswp_174_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_11,
    Y => sig_168_11,
    MIN => sig_174_12,
    MAX => sig_173_12
  );

  cmpswp_176_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_8,
    Y => sig_135_8,
    MIN => sig_176_9,
    MAX => sig_175_9
  );

  reg_176_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_176_9,
    Q => sig_176_10
  );

  reg_176_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_176_10,
    Q => sig_176_11
  );

  reg_176_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_176_11,
    Q => sig_176_12
  );

  reg_176_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_176_12,
    Q => sig_176_13
  );

  reg_176_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_176_13,
    Q => sig_176_14
  );

  cmpswp_188_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_6,
    Y => sig_76_6,
    MIN => sig_188_7,
    MAX => sig_187_7
  );

  reg_188_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_188_7,
    Q => sig_188_8
  );

  reg_188_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_188_8,
    Q => sig_188_9
  );

  reg_188_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_188_9,
    Q => sig_188_10
  );

  reg_188_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_188_10,
    Q => sig_188_11
  );

  reg_188_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_188_11,
    Q => sig_188_12
  );

  reg_187_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_187_7,
    Q => sig_187_8
  );

  reg_187_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_187_8,
    Q => sig_187_9
  );

  reg_187_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_187_9,
    Q => sig_187_10
  );

  reg_187_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_187_10,
    Q => sig_187_11
  );

  reg_187_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_187_11,
    Q => sig_187_12
  );

  cmpswp_191_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_173_12,
    Y => sig_188_12,
    MIN => sig_191_13,
    MAX => sig_192_13
  );

  cmpswp_197_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_13,
    Y => sig_192_13,
    MIN => sig_197_14,
    MAX => sig_198_14
  );

  cmpswp_199_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_167_11,
    Y => sig_134_11,
    MIN => sig_199_12,
    MAX => sig_200_12
  );

  reg_199_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_12,
    Q => sig_199_13
  );

  reg_199_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_13,
    Q => sig_199_14
  );

  cmpswp_201_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_14,
    Y => sig_199_14,
    MIN => sig_201_15,
    MAX => sig_202_15
  );

  cmpswp_204_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_200_12,
    Y => sig_187_12,
    MIN => sig_204_13,
    MAX => sig_203_13
  );

  reg_204_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_13,
    Q => sig_204_14
  );

  reg_204_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_14,
    Q => sig_204_15
  );

  reg_204_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_15,
    Q => sig_204_16
  );

  cmpswp_207_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_176_14,
    Y => sig_198_14,
    MIN => sig_207_15,
    MAX => sig_208_15
  );

  cmpswp_209_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_207_15,
    Y => sig_202_15,
    MIN => sig_209_16,
    MAX => sig_210_16
  );

  cmpswp_212_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_151_10,
    Y => sig_122_10,
    MIN => sig_212_11,
    MAX => sig_211_11
  );

  reg_212_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_212_11,
    Q => sig_212_12
  );

  reg_212_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_212_12,
    Q => sig_212_13
  );

  reg_212_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_212_13,
    Q => sig_212_14
  );

  reg_212_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_212_14,
    Q => sig_212_15
  );

  reg_212_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_212_15,
    Q => sig_212_16
  );

  reg_212_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_212_16,
    Q => sig_212_17
  );

  reg_211_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_11,
    Q => sig_211_12
  );

  reg_211_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_12,
    Q => sig_211_13
  );

  reg_211_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_13,
    Q => sig_211_14
  );

  reg_211_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_14,
    Q => sig_211_15
  );

  reg_211_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_15,
    Q => sig_211_16
  );

  cmpswp_214_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_209_16,
    Y => sig_211_16,
    MIN => sig_214_17,
    MAX => sig_213_17
  );

  cmpswp_215_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_210_16,
    Y => sig_204_16,
    MIN => sig_215_17,
    MAX => sig_216_17
  );

  reg_215_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_215_17,
    Q => sig_215_18
  );

  cmpswp_217_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_214_17,
    Y => sig_212_17,
    MIN => sig_217_18,
    MAX => sig_218_18
  );

  reg_217_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_217_18,
    Q => sig_217_19
  );

  cmpswp_219_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_215_18,
    Y => sig_218_18,
    MIN => sig_219_19,
    MAX => sig_220_19
  );

  cmpswp_221_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_219_19,
    Y => sig_217_19,
    MIN => sig_221_20,
    MAX => sig_222_20
  );

  sig_out_med <= sig_222_20;
end generated;
