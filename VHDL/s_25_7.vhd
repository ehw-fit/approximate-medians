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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_4_1, sig_4_2, sig_5_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_7_0, sig_8_0, sig_8_1, sig_9_0, sig_9_1, sig_9_2, sig_10_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_0, sig_12_0, sig_13_0, sig_14_0, sig_14_1, sig_14_2, sig_14_3, sig_15_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_16_0, sig_16_1, sig_16_2, sig_17_0, sig_17_1, sig_18_0, sig_18_1, sig_19_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_1, sig_19_2, sig_19_3, sig_19_4, sig_20_0, sig_21_0, sig_22_0, sig_22_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_0, sig_24_0, sig_25_1, sig_26_1, sig_26_2, sig_28_1, sig_27_1, sig_27_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_27_3, sig_27_4, sig_30_2, sig_29_2, sig_31_1, sig_32_1, sig_31_2, sig_33_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_1, sig_34_2, sig_35_3, sig_36_3, sig_40_1, sig_39_1, sig_39_2, sig_42_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_2, sig_44_3, sig_43_3, sig_45_1, sig_46_1, sig_46_2, sig_46_3, sig_48_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_2, sig_49_3, sig_50_3, sig_52_2, sig_51_2, sig_52_3, sig_55_3, sig_56_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_56_4, sig_57_1, sig_58_1, sig_59_2, sig_60_2, sig_60_3, sig_62_2, sig_61_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_62_3, sig_62_4, sig_62_5, sig_62_6, sig_63_4, sig_64_4, sig_66_3, sig_65_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_65_4, sig_67_4, sig_68_4, sig_67_5, sig_67_6, sig_69_1, sig_70_1, sig_69_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_69_3, sig_70_2, sig_70_3, sig_71_3, sig_72_3, sig_74_4, sig_73_4, sig_74_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_74_6, sig_73_5, sig_77_4, sig_78_4, sig_77_5, sig_79_3, sig_80_3, sig_80_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_80_5, sig_80_6, sig_80_7, sig_82_3, sig_81_3, sig_84_4, sig_83_4, sig_84_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_84_6, sig_84_7, sig_84_8, sig_84_9, sig_84_10, sig_84_11, sig_84_12, sig_85_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_4, sig_90_5, sig_89_5, sig_91_6, sig_92_6, sig_91_7, sig_91_8, sig_91_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_91_10, sig_97_5, sig_98_5, sig_99_7, sig_100_7, sig_101_6, sig_102_6, sig_103_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_104_8, sig_105_4, sig_106_4, sig_107_4, sig_108_4, sig_108_5, sig_112_5, sig_111_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_112_6, sig_129_5, sig_130_5, sig_138_6, sig_137_6, sig_150_5, sig_149_5, sig_150_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_150_7, sig_150_8, sig_152_7, sig_151_7, sig_154_6, sig_153_6, sig_153_7, sig_167_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_168_7, sig_168_8, sig_170_8, sig_169_8, sig_185_9, sig_186_9, sig_187_7, sig_188_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_188_8, sig_188_9, sig_193_10, sig_194_10, sig_194_11, sig_194_12, sig_194_13, sig_194_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_197_9, sig_198_9, sig_197_10, sig_197_11, sig_199_11, sig_200_11, sig_201_12, sig_202_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_202_13, sig_203_8, sig_204_8, sig_204_9, sig_204_10, sig_204_11, sig_205_12, sig_206_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_205_13, sig_205_14, sig_205_15, sig_205_16, sig_207_13, sig_208_13, sig_208_14, sig_208_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_208_16, sig_208_17, sig_209_14, sig_210_14, sig_210_15, sig_212_15, sig_211_15, sig_215_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_216_16, sig_220_17, sig_219_17, sig_221_18, sig_222_18 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_8_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Q => sig_8_1
  );

  reg_9_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Q => sig_9_1
  );

  reg_9_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_1,
    Q => sig_9_2
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

  reg_14_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_2,
    Q => sig_14_3
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

  reg_17_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Q => sig_17_1
  );

  reg_18_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Q => sig_18_1
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

  reg_19_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Q => sig_19_3
  );

  reg_19_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_3,
    Q => sig_19_4
  );

  reg_22_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_0,
    Q => sig_22_1
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_2_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  reg_26_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Q => sig_26_2
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_20_0,
    MIN => sig_28_1,
    MAX => sig_27_1
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

  reg_27_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_3,
    Q => sig_27_4
  );

  cmpswp_30_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Y => sig_28_1,
    MIN => sig_30_2,
    MAX => sig_29_2
  );

  cmpswp_31_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_12_0,
    MIN => sig_31_1,
    MAX => sig_32_1
  );

  reg_31_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_1,
    Q => sig_31_2
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_10_0,
    MIN => sig_33_1,
    MAX => sig_34_1
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
    Y => sig_30_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  cmpswp_40_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_6_0,
    MIN => sig_40_1,
    MAX => sig_39_1
  );

  reg_39_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Q => sig_39_2
  );

  cmpswp_42_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_1,
    Y => sig_40_1,
    MIN => sig_42_2,
    MAX => sig_41_2
  );

  cmpswp_44_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_2,
    Y => sig_26_2,
    MIN => sig_44_3,
    MAX => sig_43_3
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_13_0,
    MIN => sig_45_1,
    MAX => sig_46_1
  );

  reg_46_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_1,
    Q => sig_46_2
  );

  reg_46_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_2,
    Q => sig_46_3
  );

  cmpswp_48_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Y => sig_33_1,
    MIN => sig_48_2,
    MAX => sig_47_2
  );

  cmpswp_49_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_2,
    Y => sig_29_2,
    MIN => sig_49_3,
    MAX => sig_50_3
  );

  cmpswp_52_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_45_1,
    MIN => sig_52_2,
    MAX => sig_51_2
  );

  reg_52_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_2,
    Q => sig_52_3
  );

  cmpswp_55_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_2,
    Y => sig_51_2,
    MIN => sig_55_3,
    MAX => sig_56_3
  );

  reg_56_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_3,
    Q => sig_56_4
  );

  cmpswp_57_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_21_0,
    MIN => sig_57_1,
    MAX => sig_58_1
  );

  cmpswp_59_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_58_1,
    MIN => sig_59_2,
    MAX => sig_60_2
  );

  reg_60_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_2,
    Q => sig_60_3
  );

  cmpswp_62_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_1,
    Y => sig_32_1,
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

  cmpswp_63_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Y => sig_14_3,
    MIN => sig_63_4,
    MAX => sig_64_4
  );

  cmpswp_66_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_2,
    Y => sig_39_2,
    MIN => sig_66_3,
    MAX => sig_65_3
  );

  reg_65_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_3,
    Q => sig_65_4
  );

  cmpswp_67_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Y => sig_66_3,
    MIN => sig_67_4,
    MAX => sig_68_4
  );

  reg_67_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_4,
    Q => sig_67_5
  );

  reg_67_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_5,
    Q => sig_67_6
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
    X => sig_34_2,
    Y => sig_61_2,
    MIN => sig_71_3,
    MAX => sig_72_3
  );

  cmpswp_74_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_3,
    Y => sig_55_3,
    MIN => sig_74_4,
    MAX => sig_73_4
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

  reg_73_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_4,
    Q => sig_73_5
  );

  cmpswp_77_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_3,
    Y => sig_50_3,
    MIN => sig_77_4,
    MAX => sig_78_4
  );

  reg_77_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_4,
    Q => sig_77_5
  );

  cmpswp_79_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_2,
    Y => sig_42_2,
    MIN => sig_79_3,
    MAX => sig_80_3
  );

  reg_80_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_3,
    Q => sig_80_4
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

  cmpswp_82_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_2,
    Y => sig_47_2,
    MIN => sig_82_3,
    MAX => sig_81_3
  );

  cmpswp_84_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_3,
    Y => sig_46_3,
    MIN => sig_84_4,
    MAX => sig_83_4
  );

  reg_84_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_4,
    Q => sig_84_5
  );

  reg_84_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_5,
    Q => sig_84_6
  );

  reg_84_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_6,
    Q => sig_84_7
  );

  reg_84_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_7,
    Q => sig_84_8
  );

  reg_84_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_8,
    Q => sig_84_9
  );

  reg_84_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_9,
    Q => sig_84_10
  );

  reg_84_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_10,
    Q => sig_84_11
  );

  reg_84_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_11,
    Q => sig_84_12
  );

  cmpswp_85_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_3,
    Y => sig_71_3,
    MIN => sig_85_4,
    MAX => sig_86_4
  );

  cmpswp_90_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_4,
    Y => sig_85_4,
    MIN => sig_90_5,
    MAX => sig_89_5
  );

  cmpswp_91_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_5,
    Y => sig_77_5,
    MIN => sig_91_6,
    MAX => sig_92_6
  );

  reg_91_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_6,
    Q => sig_91_7
  );

  reg_91_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_7,
    Q => sig_91_8
  );

  reg_91_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_8,
    Q => sig_91_9
  );

  reg_91_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_9,
    Q => sig_91_10
  );

  cmpswp_97_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_4,
    Y => sig_64_4,
    MIN => sig_97_5,
    MAX => sig_98_5
  );

  cmpswp_99_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_6,
    Y => sig_92_6,
    MIN => sig_99_7,
    MAX => sig_100_7
  );

  cmpswp_101_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_5,
    Y => sig_97_5,
    MIN => sig_101_6,
    MAX => sig_102_6
  );

  cmpswp_103_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_7,
    Y => sig_100_7,
    MIN => sig_103_8,
    MAX => sig_104_8
  );

  cmpswp_105_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_3,
    Y => sig_69_3,
    MIN => sig_105_4,
    MAX => sig_106_4
  );

  cmpswp_107_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_3,
    Y => sig_49_3,
    MIN => sig_107_4,
    MAX => sig_108_4
  );

  reg_108_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_4,
    Q => sig_108_5
  );

  cmpswp_112_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_4,
    Y => sig_56_4,
    MIN => sig_112_5,
    MAX => sig_111_5
  );

  reg_112_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_5,
    Q => sig_112_6
  );

  cmpswp_129_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_4,
    Y => sig_86_4,
    MIN => sig_129_5,
    MAX => sig_130_5
  );

  cmpswp_138_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_5,
    Y => sig_98_5,
    MIN => sig_138_6,
    MAX => sig_137_6
  );

  cmpswp_150_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_4,
    Y => sig_106_4,
    MIN => sig_150_5,
    MAX => sig_149_5
  );

  reg_150_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_5,
    Q => sig_150_6
  );

  reg_150_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_6,
    Q => sig_150_7
  );

  reg_150_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_7,
    Q => sig_150_8
  );

  cmpswp_152_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_6,
    Y => sig_138_6,
    MIN => sig_152_7,
    MAX => sig_151_7
  );

  cmpswp_154_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_5,
    Y => sig_149_5,
    MIN => sig_154_6,
    MAX => sig_153_6
  );

  reg_153_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_6,
    Q => sig_153_7
  );

  cmpswp_167_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_6,
    Y => sig_112_6,
    MIN => sig_167_7,
    MAX => sig_168_7
  );

  reg_168_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_168_7,
    Q => sig_168_8
  );

  cmpswp_170_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_7,
    Y => sig_151_7,
    MIN => sig_170_8,
    MAX => sig_169_8
  );

  cmpswp_185_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_170_8,
    Y => sig_150_8,
    MIN => sig_185_9,
    MAX => sig_186_9
  );

  cmpswp_187_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_154_6,
    Y => sig_67_6,
    MIN => sig_187_7,
    MAX => sig_188_7
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

  cmpswp_193_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_186_9,
    Y => sig_188_9,
    MIN => sig_193_10,
    MAX => sig_194_10
  );

  reg_194_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_10,
    Q => sig_194_11
  );

  reg_194_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_11,
    Q => sig_194_12
  );

  reg_194_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_12,
    Q => sig_194_13
  );

  reg_194_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_194_13,
    Q => sig_194_14
  );

  cmpswp_197_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_8,
    Y => sig_168_8,
    MIN => sig_197_9,
    MAX => sig_198_9
  );

  reg_197_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_9,
    Q => sig_197_10
  );

  reg_197_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_10,
    Q => sig_197_11
  );

  cmpswp_199_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_10,
    Y => sig_193_10,
    MIN => sig_199_11,
    MAX => sig_200_11
  );

  cmpswp_201_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_197_11,
    Y => sig_199_11,
    MIN => sig_201_12,
    MAX => sig_202_12
  );

  reg_202_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_202_12,
    Q => sig_202_13
  );

  cmpswp_203_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_167_7,
    Y => sig_99_7,
    MIN => sig_203_8,
    MAX => sig_204_8
  );

  reg_204_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_8,
    Q => sig_204_9
  );

  reg_204_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_9,
    Q => sig_204_10
  );

  reg_204_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_204_10,
    Q => sig_204_11
  );

  cmpswp_205_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_200_11,
    Y => sig_204_11,
    MIN => sig_205_12,
    MAX => sig_206_12
  );

  reg_205_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_12,
    Q => sig_205_13
  );

  reg_205_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_13,
    Q => sig_205_14
  );

  reg_205_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_14,
    Q => sig_205_15
  );

  reg_205_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_15,
    Q => sig_205_16
  );

  cmpswp_207_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_12,
    Y => sig_206_12,
    MIN => sig_207_13,
    MAX => sig_208_13
  );

  reg_208_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_208_13,
    Q => sig_208_14
  );

  reg_208_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_208_14,
    Q => sig_208_15
  );

  reg_208_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_208_15,
    Q => sig_208_16
  );

  reg_208_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_208_16,
    Q => sig_208_17
  );

  cmpswp_209_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_207_13,
    Y => sig_202_13,
    MIN => sig_209_14,
    MAX => sig_210_14
  );

  reg_210_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_210_14,
    Q => sig_210_15
  );

  cmpswp_212_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_209_14,
    Y => sig_194_14,
    MIN => sig_212_15,
    MAX => sig_211_15
  );

  cmpswp_215_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_210_15,
    Y => sig_211_15,
    MIN => sig_215_16,
    MAX => sig_216_16
  );

  cmpswp_220_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_215_16,
    Y => sig_205_16,
    MIN => sig_220_17,
    MAX => sig_219_17
  );

  cmpswp_221_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_219_17,
    Y => sig_208_17,
    MIN => sig_221_18,
    MAX => sig_222_18
  );

  sig_out_med <= sig_221_18;
end generated;
