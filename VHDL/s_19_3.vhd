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
  signal sig_0_0, sig_1_0, sig_1_1, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0, sig_14_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_0, sig_16_0, sig_17_0, sig_18_0, sig_19_1, sig_20_1, sig_19_2, sig_21_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_1, sig_22_2, sig_23_1, sig_24_1, sig_25_2, sig_26_2, sig_25_3, sig_25_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_27_2, sig_28_2, sig_27_3, sig_27_4, sig_27_5, sig_28_3, sig_29_1, sig_30_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_31_1, sig_32_1, sig_33_1, sig_34_1, sig_33_2, sig_35_2, sig_36_2, sig_37_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_38_3, sig_38_4, sig_38_5, sig_38_6, sig_38_7, sig_38_8, sig_39_1, sig_40_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_2, sig_40_2, sig_42_2, sig_41_2, sig_42_3, sig_42_4, sig_42_5, sig_42_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_43_3, sig_44_3, sig_45_1, sig_46_1, sig_45_2, sig_47_2, sig_48_2, sig_48_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_4, sig_49_3, sig_50_3, sig_51_1, sig_52_1, sig_52_2, sig_52_3, sig_52_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_54_3, sig_53_3, sig_54_4, sig_54_5, sig_54_6, sig_54_7, sig_53_4, sig_53_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_53_6, sig_53_7, sig_55_4, sig_56_4, sig_55_5, sig_55_6, sig_55_7, sig_55_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_56_5, sig_57_4, sig_58_4, sig_59_5, sig_60_5, sig_60_6, sig_60_7, sig_60_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_62_6, sig_61_6, sig_63_4, sig_64_4, sig_64_5, sig_64_6, sig_67_5, sig_68_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_69_3, sig_70_3, sig_69_4, sig_69_5, sig_70_4, sig_70_5, sig_70_6, sig_70_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_70_8, sig_70_9, sig_70_10, sig_70_11, sig_70_12, sig_70_13, sig_73_6, sig_74_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_74_7, sig_74_8, sig_74_9, sig_74_10, sig_74_11, sig_75_5, sig_76_5, sig_76_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_2, sig_81_2, sig_82_3, sig_82_4, sig_82_5, sig_82_6, sig_83_7, sig_84_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_83_8, sig_83_9, sig_85_7, sig_86_7, sig_87_6, sig_88_6, sig_89_8, sig_90_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_90_9, sig_90_10, sig_91_7, sig_92_7, sig_92_8, sig_92_9, sig_92_10, sig_92_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_92_12, sig_92_13, sig_92_14, sig_94_8, sig_93_8, sig_95_9, sig_96_9, sig_98_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_3, sig_98_4, sig_98_5, sig_98_6, sig_98_7, sig_97_4, sig_97_5, sig_97_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_7, sig_99_8, sig_100_8, sig_100_9, sig_101_8, sig_102_8, sig_104_9, sig_103_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_106_7, sig_105_7, sig_106_8, sig_106_9, sig_106_10, sig_105_8, sig_108_10, sig_107_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_107_11, sig_107_12, sig_109_9, sig_110_9, sig_111_10, sig_112_10, sig_112_11, sig_112_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_112_13, sig_112_14, sig_112_15, sig_116_9, sig_115_9, sig_119_10, sig_120_10, sig_122_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_121_11, sig_122_12, sig_122_13, sig_122_14, sig_122_15, sig_122_16, sig_124_11, sig_123_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_126_11, sig_125_11, sig_127_12, sig_128_12, sig_129_10, sig_130_10, sig_129_11, sig_129_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_132_12, sig_131_12, sig_132_13, sig_133_13, sig_134_13, sig_136_14, sig_135_14, sig_139_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_140_14, sig_141_13, sig_142_13, sig_141_14, sig_143_15, sig_144_15, sig_146_15, sig_145_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_147_16, sig_148_16, sig_150_16, sig_149_16, sig_150_17, sig_152_17, sig_151_17, sig_151_18 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_154_18, sig_153_18, sig_156_19, sig_155_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_1_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Q => sig_1_1
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_10_0,
    MIN => sig_19_1,
    MAX => sig_20_1
  );

  reg_19_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Q => sig_19_2
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_3_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  reg_22_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Q => sig_22_2
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_8_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Y => sig_21_1,
    MIN => sig_25_2,
    MAX => sig_26_2
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

  cmpswp_27_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Y => sig_20_1,
    MIN => sig_27_2,
    MAX => sig_28_2
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

  reg_27_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_4,
    Q => sig_27_5
  );

  reg_28_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Q => sig_28_3
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_17_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  cmpswp_31_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_14_0,
    MIN => sig_31_1,
    MAX => sig_32_1
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_6_0,
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
    X => sig_32_1,
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

  reg_38_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_3,
    Q => sig_38_4
  );

  reg_38_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_4,
    Q => sig_38_5
  );

  reg_38_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_5,
    Q => sig_38_6
  );

  reg_38_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_6,
    Q => sig_38_7
  );

  reg_38_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_7,
    Q => sig_38_8
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_5_0,
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

  cmpswp_42_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_1,
    Y => sig_29_1,
    MIN => sig_42_2,
    MAX => sig_41_2
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

  reg_42_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_5,
    Q => sig_42_6
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
    X => sig_0_0,
    Y => sig_2_0,
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
    X => sig_31_1,
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
    X => sig_16_0,
    Y => sig_18_0,
    MIN => sig_51_1,
    MAX => sig_52_1
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

  reg_52_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_3,
    Q => sig_52_4
  );

  cmpswp_54_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Y => sig_26_2,
    MIN => sig_54_3,
    MAX => sig_53_3
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

  reg_53_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_3,
    Q => sig_53_4
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

  cmpswp_55_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_3,
    Y => sig_49_3,
    MIN => sig_55_4,
    MAX => sig_56_4
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

  reg_55_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_6,
    Q => sig_55_7
  );

  reg_55_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_7,
    Q => sig_55_8
  );

  reg_56_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Q => sig_56_5
  );

  cmpswp_57_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_3,
    Y => sig_43_3,
    MIN => sig_57_4,
    MAX => sig_58_4
  );

  cmpswp_59_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_4,
    Y => sig_58_4,
    MIN => sig_59_5,
    MAX => sig_60_5
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

  cmpswp_62_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_5,
    Y => sig_27_5,
    MIN => sig_62_6,
    MAX => sig_61_6
  );

  cmpswp_63_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Y => sig_44_3,
    MIN => sig_63_4,
    MAX => sig_64_4
  );

  reg_64_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_4,
    Q => sig_64_5
  );

  reg_64_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_5,
    Q => sig_64_6
  );

  cmpswp_67_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_4,
    Y => sig_48_4,
    MIN => sig_67_5,
    MAX => sig_68_5
  );

  cmpswp_69_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_2,
    Y => sig_36_2,
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

  reg_70_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_3,
    Q => sig_70_4
  );

  reg_70_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_4,
    Q => sig_70_5
  );

  reg_70_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_5,
    Q => sig_70_6
  );

  reg_70_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_6,
    Q => sig_70_7
  );

  reg_70_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_7,
    Q => sig_70_8
  );

  reg_70_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_8,
    Q => sig_70_9
  );

  reg_70_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_9,
    Q => sig_70_10
  );

  reg_70_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_10,
    Q => sig_70_11
  );

  reg_70_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_11,
    Q => sig_70_12
  );

  reg_70_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_12,
    Q => sig_70_13
  );

  cmpswp_73_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_5,
    Y => sig_69_5,
    MIN => sig_73_6,
    MAX => sig_74_6
  );

  reg_74_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_6,
    Q => sig_74_7
  );

  reg_74_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_7,
    Q => sig_74_8
  );

  reg_74_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_8,
    Q => sig_74_9
  );

  reg_74_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_9,
    Q => sig_74_10
  );

  reg_74_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_10,
    Q => sig_74_11
  );

  cmpswp_75_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_4,
    Y => sig_63_4,
    MIN => sig_75_5,
    MAX => sig_76_5
  );

  reg_76_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_5,
    Q => sig_76_6
  );

  cmpswp_82_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_1,
    Y => sig_30_1,
    MIN => sig_82_2,
    MAX => sig_81_2
  );

  reg_82_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_2,
    Q => sig_82_3
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

  cmpswp_83_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_6,
    Y => sig_42_6,
    MIN => sig_83_7,
    MAX => sig_84_7
  );

  reg_83_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_7,
    Q => sig_83_8
  );

  reg_83_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_8,
    Q => sig_83_9
  );

  cmpswp_85_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_6,
    Y => sig_76_6,
    MIN => sig_85_7,
    MAX => sig_86_7
  );

  cmpswp_87_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_5,
    Y => sig_67_5,
    MIN => sig_87_6,
    MAX => sig_88_6
  );

  cmpswp_89_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_7,
    Y => sig_84_7,
    MIN => sig_89_8,
    MAX => sig_90_8
  );

  reg_90_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_8,
    Q => sig_90_9
  );

  reg_90_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_9,
    Q => sig_90_10
  );

  cmpswp_91_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_6,
    Y => sig_88_6,
    MIN => sig_91_7,
    MAX => sig_92_7
  );

  reg_92_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_7,
    Q => sig_92_8
  );

  reg_92_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_8,
    Q => sig_92_9
  );

  reg_92_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_9,
    Q => sig_92_10
  );

  reg_92_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_10,
    Q => sig_92_11
  );

  reg_92_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_11,
    Q => sig_92_12
  );

  reg_92_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_12,
    Q => sig_92_13
  );

  reg_92_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_13,
    Q => sig_92_14
  );

  cmpswp_94_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_7,
    Y => sig_54_7,
    MIN => sig_94_8,
    MAX => sig_93_8
  );

  cmpswp_95_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_8,
    Y => sig_60_8,
    MIN => sig_95_9,
    MAX => sig_96_9
  );

  cmpswp_98_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Y => sig_81_2,
    MIN => sig_98_3,
    MAX => sig_97_3
  );

  reg_98_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_3,
    Q => sig_98_4
  );

  reg_98_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_4,
    Q => sig_98_5
  );

  reg_98_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_5,
    Q => sig_98_6
  );

  reg_98_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_6,
    Q => sig_98_7
  );

  reg_97_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_3,
    Q => sig_97_4
  );

  reg_97_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_4,
    Q => sig_97_5
  );

  reg_97_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_5,
    Q => sig_97_6
  );

  reg_97_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_6,
    Q => sig_97_7
  );

  cmpswp_99_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_7,
    Y => sig_98_7,
    MIN => sig_99_8,
    MAX => sig_100_8
  );

  reg_100_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_8,
    Q => sig_100_9
  );

  cmpswp_101_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_7,
    Y => sig_85_7,
    MIN => sig_101_8,
    MAX => sig_102_8
  );

  cmpswp_104_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_8,
    Y => sig_55_8,
    MIN => sig_104_9,
    MAX => sig_103_9
  );

  cmpswp_106_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_6,
    Y => sig_64_6,
    MIN => sig_106_7,
    MAX => sig_105_7
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

  reg_105_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_7,
    Q => sig_105_8
  );

  cmpswp_108_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_9,
    Y => sig_95_9,
    MIN => sig_108_10,
    MAX => sig_107_10
  );

  reg_107_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_10,
    Q => sig_107_11
  );

  reg_107_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_11,
    Q => sig_107_12
  );

  cmpswp_109_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_8,
    Y => sig_38_8,
    MIN => sig_109_9,
    MAX => sig_110_9
  );

  cmpswp_111_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_9,
    Y => sig_103_9,
    MIN => sig_111_10,
    MAX => sig_112_10
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

  cmpswp_116_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_8,
    Y => sig_102_8,
    MIN => sig_116_9,
    MAX => sig_115_9
  );

  cmpswp_119_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_9,
    Y => sig_100_9,
    MIN => sig_119_10,
    MAX => sig_120_10
  );

  cmpswp_122_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_10,
    Y => sig_106_10,
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

  cmpswp_124_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_10,
    Y => sig_108_10,
    MIN => sig_124_11,
    MAX => sig_123_11
  );

  cmpswp_126_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_10,
    Y => sig_111_10,
    MIN => sig_126_11,
    MAX => sig_125_11
  );

  cmpswp_127_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_11,
    Y => sig_121_11,
    MIN => sig_127_12,
    MAX => sig_128_12
  );

  cmpswp_129_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_116_9,
    Y => sig_96_9,
    MIN => sig_129_10,
    MAX => sig_130_10
  );

  reg_129_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_10,
    Q => sig_129_11
  );

  reg_129_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_11,
    Q => sig_129_12
  );

  cmpswp_132_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_11,
    Y => sig_125_11,
    MIN => sig_132_12,
    MAX => sig_131_12
  );

  reg_132_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_12,
    Q => sig_132_13
  );

  cmpswp_133_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_12,
    Y => sig_127_12,
    MIN => sig_133_13,
    MAX => sig_134_13
  );

  cmpswp_136_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_13,
    Y => sig_133_13,
    MIN => sig_136_14,
    MAX => sig_135_14
  );

  cmpswp_139_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_13,
    Y => sig_70_13,
    MIN => sig_139_14,
    MAX => sig_140_14
  );

  cmpswp_141_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_12,
    Y => sig_128_12,
    MIN => sig_141_13,
    MAX => sig_142_13
  );

  reg_141_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_141_13,
    Q => sig_141_14
  );

  cmpswp_143_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_141_14,
    Y => sig_136_14,
    MIN => sig_143_15,
    MAX => sig_144_15
  );

  cmpswp_146_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_14,
    Y => sig_92_14,
    MIN => sig_146_15,
    MAX => sig_145_15
  );

  cmpswp_147_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_15,
    Y => sig_143_15,
    MIN => sig_147_16,
    MAX => sig_148_16
  );

  cmpswp_150_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_15,
    Y => sig_146_15,
    MIN => sig_150_16,
    MAX => sig_149_16
  );

  reg_150_16: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_16,
    Q => sig_150_17
  );

  cmpswp_152_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_16,
    Y => sig_122_16,
    MIN => sig_152_17,
    MAX => sig_151_17
  );

  reg_151_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_151_17,
    Q => sig_151_18
  );

  cmpswp_154_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_17,
    Y => sig_152_17,
    MIN => sig_154_18,
    MAX => sig_153_18
  );

  cmpswp_156_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_18,
    Y => sig_151_18,
    MIN => sig_156_19,
    MAX => sig_155_19
  );

  sig_out_med <= sig_156_19;
end generated;
