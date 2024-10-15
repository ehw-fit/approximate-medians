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
  signal sig_0_0, sig_0_1, sig_0_2, sig_0_3, sig_1_0, sig_2_0, sig_3_0, sig_4_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_5_0, sig_6_0, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_11_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_0, sig_12_1, sig_13_0, sig_14_0, sig_14_1, sig_14_2, sig_14_3, sig_15_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_16_0, sig_17_0, sig_17_1, sig_17_2, sig_17_3, sig_17_4, sig_18_0, sig_20_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_1, sig_22_1, sig_21_1, sig_22_2, sig_22_3, sig_22_4, sig_21_2, sig_21_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_4, sig_21_5, sig_21_6, sig_21_7, sig_23_1, sig_24_1, sig_24_2, sig_24_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_24_4, sig_24_5, sig_24_6, sig_26_1, sig_25_1, sig_28_1, sig_27_1, sig_27_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_1, sig_30_1, sig_31_2, sig_32_2, sig_31_3, sig_31_4, sig_31_5, sig_31_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_31_7, sig_31_8, sig_31_9, sig_31_10, sig_31_11, sig_31_12, sig_31_13, sig_32_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_2, sig_34_2, sig_38_3, sig_37_3, sig_40_4, sig_39_4, sig_40_5, sig_40_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_7, sig_40_8, sig_41_2, sig_42_2, sig_45_1, sig_46_1, sig_45_2, sig_45_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_2, sig_47_3, sig_48_3, sig_48_4, sig_48_5, sig_48_6, sig_48_7, sig_49_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_50_4, sig_51_5, sig_52_5, sig_53_2, sig_54_2, sig_56_4, sig_55_4, sig_56_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_58_3, sig_57_3, sig_58_4, sig_62_2, sig_61_2, sig_62_3, sig_62_4, sig_62_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_62_6, sig_61_3, sig_61_4, sig_65_5, sig_66_5, sig_65_6, sig_65_7, sig_65_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_68_6, sig_67_6, sig_69_3, sig_70_3, sig_69_4, sig_69_5, sig_69_6, sig_69_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_69_8, sig_72_6, sig_71_6, sig_74_4, sig_73_4, sig_74_5, sig_74_6, sig_73_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_73_6, sig_75_7, sig_76_7, sig_77_5, sig_78_5, sig_77_6, sig_77_7, sig_78_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_7, sig_80_7, sig_79_7, sig_82_8, sig_81_8, sig_83_8, sig_84_8, sig_83_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_87_7, sig_88_7, sig_89_7, sig_90_7, sig_90_8, sig_91_8, sig_92_8, sig_91_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_93_5, sig_94_5, sig_93_6, sig_93_7, sig_93_8, sig_94_6, sig_94_7, sig_94_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_9, sig_98_9, sig_100_9, sig_99_9, sig_102_9, sig_101_9, sig_102_10, sig_102_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_106_8, sig_105_8, sig_107_10, sig_108_10, sig_109_8, sig_110_8, sig_109_9, sig_114_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_113_9, sig_114_10, sig_114_11, sig_114_12, sig_114_13, sig_114_14, sig_114_15, sig_114_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_116_9, sig_115_9, sig_115_10, sig_115_11, sig_115_12, sig_115_13, sig_115_14, sig_118_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_117_9, sig_118_10, sig_117_10, sig_119_10, sig_120_10, sig_121_11, sig_122_11, sig_123_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_124_11, sig_123_12, sig_124_12, sig_130_12, sig_129_12, sig_131_13, sig_132_13, sig_132_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_132_15, sig_134_10, sig_133_10, sig_134_11, sig_134_12, sig_134_13, sig_135_14, sig_136_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_137_13, sig_138_13, sig_140_14, sig_139_14, sig_143_15, sig_144_15, sig_146_15, sig_145_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_148_16, sig_147_16, sig_149_16, sig_150_16, sig_149_17, sig_150_17, sig_150_18, sig_152_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_151_17, sig_153_18, sig_154_18, sig_155_19, sig_156_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_0_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Q => sig_0_1
  );

  reg_0_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_1,
    Q => sig_0_2
  );

  reg_0_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_2,
    Q => sig_0_3
  );

  reg_11_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Q => sig_11_1
  );

  reg_12_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Q => sig_12_1
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

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_1_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_4_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  reg_22_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Q => sig_22_2
  );

  reg_22_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Q => sig_22_3
  );

  reg_22_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_3,
    Q => sig_22_4
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

  reg_21_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_6,
    Q => sig_21_7
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_15_0,
    MIN => sig_23_1,
    MAX => sig_24_1
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

  reg_24_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_3,
    Q => sig_24_4
  );

  reg_24_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_4,
    Q => sig_24_5
  );

  reg_24_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_5,
    Q => sig_24_6
  );

  cmpswp_26_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_7_0,
    MIN => sig_26_1,
    MAX => sig_25_1
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_6_0,
    MIN => sig_28_1,
    MAX => sig_27_1
  );

  reg_27_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_1,
    Q => sig_27_2
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_8_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Y => sig_29_1,
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

  reg_31_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_9,
    Q => sig_31_10
  );

  reg_31_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_10,
    Q => sig_31_11
  );

  reg_31_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_11,
    Q => sig_31_12
  );

  reg_31_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_12,
    Q => sig_31_13
  );

  reg_32_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Q => sig_32_3
  );

  cmpswp_33_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_26_1,
    MIN => sig_33_2,
    MAX => sig_34_2
  );

  cmpswp_38_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_2,
    Y => sig_27_2,
    MIN => sig_38_3,
    MAX => sig_37_3
  );

  cmpswp_40_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_3,
    Y => sig_0_3,
    MIN => sig_40_4,
    MAX => sig_39_4
  );

  reg_40_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_4,
    Q => sig_40_5
  );

  reg_40_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_5,
    Q => sig_40_6
  );

  reg_40_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_6,
    Q => sig_40_7
  );

  reg_40_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_7,
    Q => sig_40_8
  );

  cmpswp_41_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_1,
    Y => sig_11_1,
    MIN => sig_41_2,
    MAX => sig_42_2
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
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

  reg_45_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_2,
    Q => sig_45_3
  );

  reg_46_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_1,
    Q => sig_46_2
  );

  cmpswp_47_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_2,
    Y => sig_46_2,
    MIN => sig_47_3,
    MAX => sig_48_3
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

  reg_48_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_5,
    Q => sig_48_6
  );

  reg_48_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_6,
    Q => sig_48_7
  );

  cmpswp_49_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Y => sig_45_3,
    MIN => sig_49_4,
    MAX => sig_50_4
  );

  cmpswp_51_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_4,
    Y => sig_39_4,
    MIN => sig_51_5,
    MAX => sig_52_5
  );

  cmpswp_53_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Y => sig_23_1,
    MIN => sig_53_2,
    MAX => sig_54_2
  );

  cmpswp_56_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_3,
    Y => sig_14_3,
    MIN => sig_56_4,
    MAX => sig_55_4
  );

  reg_56_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Q => sig_56_5
  );

  cmpswp_58_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_2,
    Y => sig_54_2,
    MIN => sig_58_3,
    MAX => sig_57_3
  );

  reg_58_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_3,
    Q => sig_58_4
  );

  cmpswp_62_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Y => sig_25_1,
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

  reg_61_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_2,
    Q => sig_61_3
  );

  reg_61_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_3,
    Q => sig_61_4
  );

  cmpswp_65_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_4,
    Y => sig_61_4,
    MIN => sig_65_5,
    MAX => sig_66_5
  );

  reg_65_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_5,
    Q => sig_65_6
  );

  reg_65_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_6,
    Q => sig_65_7
  );

  reg_65_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_7,
    Q => sig_65_8
  );

  cmpswp_68_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_5,
    Y => sig_52_5,
    MIN => sig_68_6,
    MAX => sig_67_6
  );

  cmpswp_69_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_2,
    Y => sig_33_2,
    MIN => sig_69_3,
    MAX => sig_70_3
  );

  reg_69_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_3,
    Q => sig_69_4
  );

  reg_69_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_4,
    Q => sig_69_5
  );

  reg_69_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_5,
    Q => sig_69_6
  );

  reg_69_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Q => sig_69_7
  );

  reg_69_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_7,
    Q => sig_69_8
  );

  cmpswp_72_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_5,
    Y => sig_56_5,
    MIN => sig_72_6,
    MAX => sig_71_6
  );

  cmpswp_74_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_70_3,
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

  reg_73_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_5,
    Q => sig_73_6
  );

  cmpswp_75_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_6,
    Y => sig_72_6,
    MIN => sig_75_7,
    MAX => sig_76_7
  );

  cmpswp_77_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_4,
    Y => sig_58_4,
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

  cmpswp_80_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_6,
    Y => sig_71_6,
    MIN => sig_80_7,
    MAX => sig_79_7
  );

  cmpswp_82_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_7,
    Y => sig_77_7,
    MIN => sig_82_8,
    MAX => sig_81_8
  );

  cmpswp_83_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_7,
    Y => sig_48_7,
    MIN => sig_83_8,
    MAX => sig_84_8
  );

  reg_83_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_8,
    Q => sig_83_9
  );

  cmpswp_87_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_6,
    Y => sig_24_6,
    MIN => sig_87_7,
    MAX => sig_88_7
  );

  cmpswp_89_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_6,
    Y => sig_68_6,
    MIN => sig_89_7,
    MAX => sig_90_7
  );

  reg_90_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_7,
    Q => sig_90_8
  );

  cmpswp_91_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_7,
    Y => sig_87_7,
    MIN => sig_91_8,
    MAX => sig_92_8
  );

  reg_91_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_8,
    Q => sig_91_9
  );

  cmpswp_93_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_4,
    Y => sig_17_4,
    MIN => sig_93_5,
    MAX => sig_94_5
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

  cmpswp_97_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_8,
    Y => sig_92_8,
    MIN => sig_97_9,
    MAX => sig_98_9
  );

  cmpswp_100_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_8,
    Y => sig_65_8,
    MIN => sig_100_9,
    MAX => sig_99_9
  );

  cmpswp_102_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_8,
    Y => sig_84_8,
    MIN => sig_102_9,
    MAX => sig_101_9
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

  cmpswp_106_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_7,
    Y => sig_89_7,
    MIN => sig_106_8,
    MAX => sig_105_8
  );

  cmpswp_107_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_9,
    Y => sig_99_9,
    MIN => sig_107_10,
    MAX => sig_108_10
  );

  cmpswp_109_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_7,
    Y => sig_88_7,
    MIN => sig_109_8,
    MAX => sig_110_8
  );

  reg_109_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_8,
    Q => sig_109_9
  );

  cmpswp_114_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_8,
    Y => sig_105_8,
    MIN => sig_114_9,
    MAX => sig_113_9
  );

  reg_114_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_9,
    Q => sig_114_10
  );

  reg_114_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_10,
    Q => sig_114_11
  );

  reg_114_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_11,
    Q => sig_114_12
  );

  reg_114_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_12,
    Q => sig_114_13
  );

  reg_114_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_13,
    Q => sig_114_14
  );

  reg_114_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_14,
    Q => sig_114_15
  );

  reg_114_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_15,
    Q => sig_114_16
  );

  cmpswp_116_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_8,
    Y => sig_69_8,
    MIN => sig_116_9,
    MAX => sig_115_9
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

  reg_115_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_12,
    Q => sig_115_13
  );

  reg_115_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_13,
    Q => sig_115_14
  );

  cmpswp_118_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_8,
    Y => sig_106_8,
    MIN => sig_118_9,
    MAX => sig_117_9
  );

  reg_118_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_9,
    Q => sig_118_10
  );

  reg_117_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_9,
    Q => sig_117_10
  );

  cmpswp_119_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_9,
    Y => sig_97_9,
    MIN => sig_119_10,
    MAX => sig_120_10
  );

  cmpswp_121_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_10,
    Y => sig_118_10,
    MIN => sig_121_11,
    MAX => sig_122_11
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

  cmpswp_130_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_11,
    Y => sig_102_11,
    MIN => sig_130_12,
    MAX => sig_129_12
  );

  cmpswp_131_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_12,
    Y => sig_129_12,
    MIN => sig_131_13,
    MAX => sig_132_13
  );

  reg_132_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_13,
    Q => sig_132_14
  );

  reg_132_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_14,
    Q => sig_132_15
  );

  cmpswp_134_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_9,
    Y => sig_91_9,
    MIN => sig_134_10,
    MAX => sig_133_10
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

  cmpswp_135_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_13,
    Y => sig_31_13,
    MIN => sig_135_14,
    MAX => sig_136_14
  );

  cmpswp_137_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_12,
    Y => sig_130_12,
    MIN => sig_137_13,
    MAX => sig_138_13
  );

  cmpswp_140_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_13,
    Y => sig_138_13,
    MIN => sig_140_14,
    MAX => sig_139_14
  );

  cmpswp_143_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_14,
    Y => sig_136_14,
    MIN => sig_143_15,
    MAX => sig_144_15
  );

  cmpswp_146_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_14,
    Y => sig_115_14,
    MIN => sig_146_15,
    MAX => sig_145_15
  );

  cmpswp_148_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_15,
    Y => sig_145_15,
    MIN => sig_148_16,
    MAX => sig_147_16
  );

  cmpswp_149_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_15,
    Y => sig_146_15,
    MIN => sig_149_16,
    MAX => sig_150_16
  );

  reg_149_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_16,
    Q => sig_149_17
  );

  reg_150_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_16,
    Q => sig_150_17
  );

  reg_150_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_17,
    Q => sig_150_18
  );

  cmpswp_152_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_16,
    Y => sig_114_16,
    MIN => sig_152_17,
    MAX => sig_151_17
  );

  cmpswp_153_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_17,
    Y => sig_152_17,
    MIN => sig_153_18,
    MAX => sig_154_18
  );

  cmpswp_155_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_154_18,
    Y => sig_150_18,
    MIN => sig_155_19,
    MAX => sig_156_19
  );

  sig_out_med <= sig_155_19;
end generated;
