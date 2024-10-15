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
  signal sig_0_0, sig_0_1, sig_1_0, sig_1_1, sig_2_0, sig_3_0, sig_4_0, sig_4_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_4_2, sig_4_3, sig_5_0, sig_6_0, sig_6_1, sig_7_0, sig_8_0, sig_9_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_10_0, sig_11_0, sig_11_1, sig_12_0, sig_13_0, sig_13_1, sig_13_2, sig_14_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_1, sig_15_0, sig_16_0, sig_17_0, sig_18_0, sig_19_1, sig_20_1, sig_19_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_3, sig_19_4, sig_19_5, sig_19_6, sig_19_7, sig_19_8, sig_20_2, sig_22_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_1, sig_23_2, sig_24_2, sig_27_1, sig_28_1, sig_27_2, sig_29_2, sig_30_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_3, sig_31_3, sig_32_3, sig_32_4, sig_32_5, sig_33_2, sig_34_2, sig_33_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_3, sig_36_3, sig_36_4, sig_38_4, sig_37_4, sig_39_1, sig_40_1, sig_39_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_2, sig_42_2, sig_42_3, sig_43_3, sig_44_3, sig_43_4, sig_44_4, sig_44_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_1, sig_45_1, sig_45_2, sig_45_3, sig_45_4, sig_45_5, sig_45_6, sig_47_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_2, sig_48_3, sig_48_4, sig_50_3, sig_49_3, sig_51_1, sig_52_1, sig_51_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_3, sig_51_4, sig_51_5, sig_51_6, sig_51_7, sig_51_8, sig_52_2, sig_52_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_52_4, sig_53_4, sig_54_4, sig_56_3, sig_55_3, sig_55_4, sig_55_5, sig_55_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_61_5, sig_62_5, sig_61_6, sig_61_7, sig_61_8, sig_61_9, sig_63_5, sig_64_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_67_6, sig_68_6, sig_69_5, sig_70_5, sig_71_4, sig_72_4, sig_71_5, sig_72_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_72_6, sig_72_7, sig_74_6, sig_73_6, sig_74_7, sig_75_4, sig_76_4, sig_75_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_75_6, sig_75_7, sig_75_8, sig_75_9, sig_75_10, sig_75_11, sig_76_5, sig_77_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_5, sig_77_6, sig_78_6, sig_81_7, sig_82_7, sig_82_8, sig_82_9, sig_82_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_11, sig_82_12, sig_82_13, sig_82_14, sig_82_15, sig_82_16, sig_82_17, sig_83_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_84_6, sig_84_7, sig_84_8, sig_84_9, sig_85_6, sig_86_6, sig_85_7, sig_85_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_7, sig_86_8, sig_86_9, sig_86_10, sig_86_11, sig_86_12, sig_86_13, sig_86_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_15, sig_86_16, sig_86_17, sig_86_18, sig_86_19, sig_86_20, sig_87_7, sig_88_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_89_7, sig_90_7, sig_92_8, sig_91_8, sig_92_9, sig_96_8, sig_95_8, sig_98_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_8, sig_100_9, sig_99_9, sig_103_9, sig_104_9, sig_103_10, sig_104_10, sig_104_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_104_12, sig_104_13, sig_104_14, sig_104_15, sig_105_10, sig_106_10, sig_108_11, sig_107_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_112_9, sig_111_9, sig_113_9, sig_114_9, sig_113_10, sig_113_11, sig_113_12, sig_115_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_116_10, sig_117_7, sig_118_7, sig_117_8, sig_117_9, sig_117_10, sig_118_8, sig_118_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_118_10, sig_118_11, sig_118_12, sig_118_13, sig_118_14, sig_119_10, sig_120_10, sig_120_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_120_12, sig_120_13, sig_121_12, sig_122_12, sig_123_11, sig_124_11, sig_124_12, sig_124_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_125_13, sig_126_13, sig_127_14, sig_128_14, sig_129_15, sig_130_15, sig_131_14, sig_132_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_131_15, sig_131_16, sig_132_15, sig_132_16, sig_132_17, sig_133_16, sig_134_16, sig_136_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_135_17, sig_135_18, sig_138_11, sig_137_11, sig_138_12, sig_138_13, sig_138_14, sig_138_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_138_16, sig_139_17, sig_140_17, sig_141_18, sig_142_18, sig_143_19, sig_144_19, sig_145_18 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_146_18, sig_145_19, sig_146_19, sig_147_20, sig_148_20, sig_149_20, sig_150_20, sig_149_21 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_151_21, sig_152_21, sig_151_22, sig_153_22, sig_154_22, sig_155_23, sig_156_23 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_1_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Q => sig_1_1
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

  reg_6_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Q => sig_6_1
  );

  reg_11_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Q => sig_11_1
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

  reg_14_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Q => sig_14_1
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_7_0,
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

  reg_19_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_3,
    Q => sig_19_4
  );

  reg_19_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_4,
    Q => sig_19_5
  );

  reg_19_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_5,
    Q => sig_19_6
  );

  reg_19_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_6,
    Q => sig_19_7
  );

  reg_19_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_7,
    Q => sig_19_8
  );

  reg_20_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Q => sig_20_2
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_5_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  cmpswp_23_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_1,
    Y => sig_22_1,
    MIN => sig_23_2,
    MAX => sig_24_2
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_3_0,
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
    X => sig_0_1,
    Y => sig_21_1,
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
    X => sig_27_2,
    Y => sig_29_2,
    MIN => sig_31_3,
    MAX => sig_32_3
  );

  reg_32_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Q => sig_32_4
  );

  reg_32_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_4,
    Q => sig_32_5
  );

  cmpswp_33_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_1,
    Y => sig_28_1,
    MIN => sig_33_2,
    MAX => sig_34_2
  );

  reg_33_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_2,
    Q => sig_33_3
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_2,
    Y => sig_34_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  reg_36_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Q => sig_36_4
  );

  cmpswp_38_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_3,
    Y => sig_33_3,
    MIN => sig_38_4,
    MAX => sig_37_4
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_8_0,
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

  reg_42_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_2,
    Q => sig_42_3
  );

  cmpswp_43_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_2,
    Y => sig_41_2,
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

  reg_44_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_4,
    Q => sig_44_5
  );

  cmpswp_46_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_16_0,
    MIN => sig_46_1,
    MAX => sig_45_1
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

  reg_45_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_3,
    Q => sig_45_4
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

  cmpswp_50_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_2,
    Y => sig_23_2,
    MIN => sig_50_3,
    MAX => sig_49_3
  );

  cmpswp_51_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Y => sig_15_0,
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

  reg_51_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_3,
    Q => sig_51_4
  );

  reg_51_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_4,
    Q => sig_51_5
  );

  reg_51_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_5,
    Q => sig_51_6
  );

  reg_51_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_6,
    Q => sig_51_7
  );

  reg_51_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_7,
    Q => sig_51_8
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

  cmpswp_53_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_3,
    Y => sig_42_3,
    MIN => sig_53_4,
    MAX => sig_54_4
  );

  cmpswp_56_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_24_2,
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

  cmpswp_61_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_4,
    Y => sig_43_4,
    MIN => sig_61_5,
    MAX => sig_62_5
  );

  reg_61_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_5,
    Q => sig_61_6
  );

  reg_61_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_6,
    Q => sig_61_7
  );

  reg_61_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_7,
    Q => sig_61_8
  );

  reg_61_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_8,
    Q => sig_61_9
  );

  cmpswp_63_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_4,
    Y => sig_48_4,
    MIN => sig_63_5,
    MAX => sig_64_5
  );

  cmpswp_67_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_5,
    Y => sig_63_5,
    MIN => sig_67_6,
    MAX => sig_68_6
  );

  cmpswp_69_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_4,
    Y => sig_54_4,
    MIN => sig_69_5,
    MAX => sig_70_5
  );

  cmpswp_71_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Y => sig_56_3,
    MIN => sig_71_4,
    MAX => sig_72_4
  );

  reg_71_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_4,
    Q => sig_71_5
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

  reg_72_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_6,
    Q => sig_72_7
  );

  cmpswp_74_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_5,
    Y => sig_69_5,
    MIN => sig_74_6,
    MAX => sig_73_6
  );

  reg_74_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_6,
    Q => sig_74_7
  );

  cmpswp_75_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Y => sig_4_3,
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

  reg_75_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_6,
    Q => sig_75_7
  );

  reg_75_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_7,
    Q => sig_75_8
  );

  reg_75_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_8,
    Q => sig_75_9
  );

  reg_75_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_9,
    Q => sig_75_10
  );

  reg_75_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_10,
    Q => sig_75_11
  );

  reg_76_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_4,
    Q => sig_76_5
  );

  cmpswp_77_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_4,
    Y => sig_52_4,
    MIN => sig_77_5,
    MAX => sig_78_5
  );

  reg_77_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_5,
    Q => sig_77_6
  );

  reg_78_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_5,
    Q => sig_78_6
  );

  cmpswp_81_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_6,
    Y => sig_77_6,
    MIN => sig_81_7,
    MAX => sig_82_7
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

  cmpswp_83_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_5,
    Y => sig_44_5,
    MIN => sig_83_6,
    MAX => sig_84_6
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

  cmpswp_85_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_5,
    Y => sig_76_5,
    MIN => sig_85_6,
    MAX => sig_86_6
  );

  reg_85_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_6,
    Q => sig_85_7
  );

  reg_85_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_7,
    Q => sig_85_8
  );

  reg_86_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_6,
    Q => sig_86_7
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

  cmpswp_87_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_6,
    Y => sig_78_6,
    MIN => sig_87_7,
    MAX => sig_88_7
  );

  cmpswp_89_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Y => sig_73_6,
    MIN => sig_89_7,
    MAX => sig_90_7
  );

  cmpswp_92_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_7,
    Y => sig_87_7,
    MIN => sig_92_8,
    MAX => sig_91_8
  );

  reg_92_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_8,
    Q => sig_92_9
  );

  cmpswp_96_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_7,
    Y => sig_88_7,
    MIN => sig_96_8,
    MAX => sig_95_8
  );

  cmpswp_98_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_7,
    Y => sig_74_7,
    MIN => sig_98_8,
    MAX => sig_97_8
  );

  cmpswp_100_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_8,
    Y => sig_97_8,
    MIN => sig_100_9,
    MAX => sig_99_9
  );

  cmpswp_103_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_8,
    Y => sig_51_8,
    MIN => sig_103_9,
    MAX => sig_104_9
  );

  reg_103_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_9,
    Q => sig_103_10
  );

  reg_104_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_9,
    Q => sig_104_10
  );

  reg_104_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_10,
    Q => sig_104_11
  );

  reg_104_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_11,
    Q => sig_104_12
  );

  reg_104_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_12,
    Q => sig_104_13
  );

  reg_104_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_13,
    Q => sig_104_14
  );

  reg_104_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_14,
    Q => sig_104_15
  );

  cmpswp_105_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_9,
    Y => sig_61_9,
    MIN => sig_105_10,
    MAX => sig_106_10
  );

  cmpswp_108_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_10,
    Y => sig_103_10,
    MIN => sig_108_11,
    MAX => sig_107_11
  );

  cmpswp_112_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_8,
    Y => sig_85_8,
    MIN => sig_112_9,
    MAX => sig_111_9
  );

  cmpswp_113_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_8,
    Y => sig_19_8,
    MIN => sig_113_9,
    MAX => sig_114_9
  );

  reg_113_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_9,
    Q => sig_113_10
  );

  reg_113_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_10,
    Q => sig_113_11
  );

  reg_113_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_11,
    Q => sig_113_12
  );

  cmpswp_115_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_9,
    Y => sig_114_9,
    MIN => sig_115_10,
    MAX => sig_116_10
  );

  cmpswp_117_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_6,
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

  reg_118_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_13,
    Q => sig_118_14
  );

  cmpswp_119_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_9,
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

  reg_120_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_12,
    Q => sig_120_13
  );

  cmpswp_121_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_11,
    Y => sig_75_11,
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
    X => sig_113_12,
    Y => sig_122_12,
    MIN => sig_125_13,
    MAX => sig_126_13
  );

  cmpswp_127_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_125_13,
    Y => sig_120_13,
    MIN => sig_127_14,
    MAX => sig_128_14
  );

  cmpswp_129_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_14,
    Y => sig_128_14,
    MIN => sig_129_15,
    MAX => sig_130_15
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

  reg_131_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_15,
    Q => sig_131_16
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

  cmpswp_133_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_15,
    Y => sig_104_15,
    MIN => sig_133_16,
    MAX => sig_134_16
  );

  cmpswp_136_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_16,
    Y => sig_133_16,
    MIN => sig_136_17,
    MAX => sig_135_17
  );

  reg_135_17: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_135_17,
    Q => sig_135_18
  );

  cmpswp_138_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_10,
    Y => sig_115_10,
    MIN => sig_138_11,
    MAX => sig_137_11
  );

  reg_138_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_138_11,
    Q => sig_138_12
  );

  reg_138_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_138_12,
    Q => sig_138_13
  );

  reg_138_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_138_13,
    Q => sig_138_14
  );

  reg_138_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_138_14,
    Q => sig_138_15
  );

  reg_138_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_138_15,
    Q => sig_138_16
  );

  cmpswp_139_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_16,
    Y => sig_138_16,
    MIN => sig_139_17,
    MAX => sig_140_17
  );

  cmpswp_141_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_17,
    Y => sig_140_17,
    MIN => sig_141_18,
    MAX => sig_142_18
  );

  cmpswp_143_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_141_18,
    Y => sig_135_18,
    MIN => sig_143_19,
    MAX => sig_144_19
  );

  cmpswp_145_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_17,
    Y => sig_82_17,
    MIN => sig_145_18,
    MAX => sig_146_18
  );

  reg_145_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_145_18,
    Q => sig_145_19
  );

  reg_146_18: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_18,
    Q => sig_146_19
  );

  cmpswp_147_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_19,
    Y => sig_145_19,
    MIN => sig_147_20,
    MAX => sig_148_20
  );

  cmpswp_149_20: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_19,
    Y => sig_146_19,
    MIN => sig_149_20,
    MAX => sig_150_20
  );

  reg_149_20: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_20,
    Q => sig_149_21
  );

  cmpswp_151_21: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_20,
    Y => sig_86_20,
    MIN => sig_151_21,
    MAX => sig_152_21
  );

  reg_151_21: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_151_21,
    Q => sig_151_22
  );

  cmpswp_153_22: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_149_21,
    Y => sig_152_21,
    MIN => sig_153_22,
    MAX => sig_154_22
  );

  cmpswp_155_23: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_22,
    Y => sig_151_22,
    MIN => sig_155_23,
    MAX => sig_156_23
  );

  sig_out_med <= sig_156_23;
end generated;
