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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_3_1, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_9_0, sig_9_1, sig_9_2, sig_10_0, sig_10_1, sig_11_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_1, sig_12_0, sig_13_0, sig_14_0, sig_14_1, sig_14_2, sig_14_3, sig_14_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_5, sig_14_6, sig_15_0, sig_16_0, sig_17_0, sig_18_0, sig_20_1, sig_19_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_2, sig_19_3, sig_22_1, sig_21_1, sig_23_2, sig_24_2, sig_26_1, sig_25_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_2, sig_25_3, sig_25_4, sig_27_1, sig_28_1, sig_28_2, sig_28_3, sig_28_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_28_5, sig_28_6, sig_28_7, sig_31_2, sig_32_2, sig_31_3, sig_32_3, sig_33_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_1, sig_35_2, sig_36_2, sig_37_2, sig_38_2, sig_38_3, sig_38_4, sig_38_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_3, sig_42_3, sig_43_4, sig_44_4, sig_46_1, sig_45_1, sig_46_2, sig_46_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_4, sig_45_2, sig_45_3, sig_45_4, sig_45_5, sig_45_6, sig_45_7, sig_45_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_3, sig_48_3, sig_48_4, sig_49_4, sig_50_4, sig_51_1, sig_52_1, sig_51_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_3, sig_51_4, sig_51_5, sig_51_6, sig_51_7, sig_52_2, sig_52_3, sig_52_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_52_5, sig_52_6, sig_52_7, sig_54_2, sig_53_2, sig_55_5, sig_56_5, sig_56_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_56_7, sig_56_8, sig_58_4, sig_57_4, sig_58_5, sig_57_5, sig_57_6, sig_57_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_8, sig_57_9, sig_59_6, sig_60_6, sig_60_7, sig_60_8, sig_61_5, sig_62_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_64_6, sig_63_6, sig_65_5, sig_66_5, sig_65_6, sig_66_6, sig_66_7, sig_66_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_9, sig_67_7, sig_68_7, sig_67_8, sig_67_9, sig_69_7, sig_70_7, sig_72_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_71_8, sig_73_8, sig_74_8, sig_73_9, sig_73_10, sig_77_9, sig_78_9, sig_79_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_80_8, sig_79_9, sig_79_10, sig_81_10, sig_82_10, sig_82_11, sig_82_12, sig_82_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_14, sig_83_3, sig_84_3, sig_83_4, sig_83_5, sig_83_6, sig_83_7, sig_83_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_83_9, sig_83_10, sig_88_10, sig_87_10, sig_89_9, sig_90_9, sig_96_9, sig_95_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_10, sig_95_11, sig_98_3, sig_97_3, sig_98_4, sig_98_5, sig_98_6, sig_98_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_98_8, sig_98_9, sig_102_11, sig_101_11, sig_105_10, sig_106_10, sig_107_11, sig_108_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_108_12, sig_108_13, sig_113_11, sig_114_11, sig_115_12, sig_116_12, sig_124_10, sig_123_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_124_11, sig_123_11, sig_123_12, sig_123_13, sig_128_12, sig_127_12, sig_128_13, sig_128_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_128_15, sig_128_16, sig_132_12, sig_131_12, sig_133_4, sig_134_4, sig_133_5, sig_133_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_133_7, sig_133_8, sig_133_9, sig_133_10, sig_133_11, sig_133_12, sig_136_13, sig_135_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_138_13, sig_137_13, sig_139_14, sig_140_14, sig_143_14, sig_144_14, sig_143_15, sig_144_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_145_15, sig_146_15, sig_148_16, sig_147_16, sig_149_16, sig_150_16, sig_149_17, sig_151_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_152_17, sig_151_18, sig_154_18, sig_153_18, sig_155_19, sig_156_19 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_3_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Q => sig_3_1
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

  reg_10_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Q => sig_10_1
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

  reg_14_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_3,
    Q => sig_14_4
  );

  reg_14_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_4,
    Q => sig_14_5
  );

  reg_14_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_5,
    Q => sig_14_6
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_0,
    Y => sig_13_0,
    MIN => sig_20_1,
    MAX => sig_19_1
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

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_18_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  cmpswp_23_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_1,
    Y => sig_22_1,
    MIN => sig_23_2,
    MAX => sig_24_2
  );

  cmpswp_26_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_1_0,
    MIN => sig_26_1,
    MAX => sig_25_1
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

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Y => sig_0_0,
    MIN => sig_27_1,
    MAX => sig_28_1
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

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
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

  reg_32_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Q => sig_32_3
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_12_0,
    MIN => sig_33_1,
    MAX => sig_34_1
  );

  cmpswp_35_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_1,
    Y => sig_34_1,
    MIN => sig_35_2,
    MAX => sig_36_2
  );

  cmpswp_37_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_1,
    Y => sig_33_1,
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

  reg_38_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_4,
    Q => sig_38_5
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_2,
    Y => sig_23_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  cmpswp_43_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_41_3,
    MIN => sig_43_4,
    MAX => sig_44_4
  );

  cmpswp_46_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_4_0,
    MIN => sig_46_1,
    MAX => sig_45_1
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

  reg_46_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_3,
    Q => sig_46_4
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

  cmpswp_47_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_2,
    Y => sig_24_2,
    MIN => sig_47_3,
    MAX => sig_48_3
  );

  reg_48_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_3,
    Q => sig_48_4
  );

  cmpswp_49_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Y => sig_31_3,
    MIN => sig_49_4,
    MAX => sig_50_4
  );

  cmpswp_51_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_8_0,
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

  reg_52_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_4,
    Q => sig_52_5
  );

  reg_52_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_5,
    Q => sig_52_6
  );

  reg_52_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_6,
    Q => sig_52_7
  );

  cmpswp_54_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Y => sig_21_1,
    MIN => sig_54_2,
    MAX => sig_53_2
  );

  cmpswp_55_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Y => sig_50_4,
    MIN => sig_55_5,
    MAX => sig_56_5
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

  reg_56_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_7,
    Q => sig_56_8
  );

  cmpswp_58_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_3,
    Y => sig_47_3,
    MIN => sig_58_4,
    MAX => sig_57_4
  );

  reg_58_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_4,
    Q => sig_58_5
  );

  reg_57_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_4,
    Q => sig_57_5
  );

  reg_57_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_5,
    Q => sig_57_6
  );

  reg_57_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_6,
    Q => sig_57_7
  );

  reg_57_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_7,
    Q => sig_57_8
  );

  reg_57_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_8,
    Q => sig_57_9
  );

  cmpswp_59_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_5,
    Y => sig_55_5,
    MIN => sig_59_6,
    MAX => sig_60_6
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

  cmpswp_61_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_4,
    Y => sig_49_4,
    MIN => sig_61_5,
    MAX => sig_62_5
  );

  cmpswp_64_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_5,
    Y => sig_38_5,
    MIN => sig_64_6,
    MAX => sig_63_6
  );

  cmpswp_65_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_4,
    Y => sig_48_4,
    MIN => sig_65_5,
    MAX => sig_66_5
  );

  reg_65_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_5,
    Q => sig_65_6
  );

  reg_66_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_5,
    Q => sig_66_6
  );

  reg_66_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_6,
    Q => sig_66_7
  );

  reg_66_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_7,
    Q => sig_66_8
  );

  reg_66_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_8,
    Q => sig_66_9
  );

  cmpswp_67_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_6,
    Y => sig_63_6,
    MIN => sig_67_7,
    MAX => sig_68_7
  );

  reg_67_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_7,
    Q => sig_67_8
  );

  reg_67_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_8,
    Q => sig_67_9
  );

  cmpswp_69_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_6,
    Y => sig_64_6,
    MIN => sig_69_7,
    MAX => sig_70_7
  );

  cmpswp_72_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_7,
    Y => sig_68_7,
    MIN => sig_72_8,
    MAX => sig_71_8
  );

  cmpswp_73_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_7,
    Y => sig_70_7,
    MIN => sig_73_8,
    MAX => sig_74_8
  );

  reg_73_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_8,
    Q => sig_73_9
  );

  reg_73_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_9,
    Q => sig_73_10
  );

  cmpswp_77_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_8,
    Y => sig_72_8,
    MIN => sig_77_9,
    MAX => sig_78_9
  );

  cmpswp_79_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_7,
    Y => sig_69_7,
    MIN => sig_79_8,
    MAX => sig_80_8
  );

  reg_79_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_8,
    Q => sig_79_9
  );

  reg_79_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_9,
    Q => sig_79_10
  );

  cmpswp_81_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_9,
    Y => sig_77_9,
    MIN => sig_81_10,
    MAX => sig_82_10
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

  cmpswp_83_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_2,
    Y => sig_53_2,
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

  reg_83_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_8,
    Q => sig_83_9
  );

  reg_83_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_9,
    Q => sig_83_10
  );

  cmpswp_88_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_9,
    Y => sig_78_9,
    MIN => sig_88_10,
    MAX => sig_87_10
  );

  cmpswp_89_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_8,
    Y => sig_45_8,
    MIN => sig_89_9,
    MAX => sig_90_9
  );

  cmpswp_96_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_8,
    Y => sig_60_8,
    MIN => sig_96_9,
    MAX => sig_95_9
  );

  reg_95_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_9,
    Q => sig_95_10
  );

  reg_95_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_10,
    Q => sig_95_11
  );

  cmpswp_98_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_2,
    Y => sig_36_2,
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

  cmpswp_102_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_10,
    Y => sig_88_10,
    MIN => sig_102_11,
    MAX => sig_101_11
  );

  cmpswp_105_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_9,
    Y => sig_96_9,
    MIN => sig_105_10,
    MAX => sig_106_10
  );

  cmpswp_107_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_10,
    Y => sig_106_10,
    MIN => sig_107_11,
    MAX => sig_108_11
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

  cmpswp_113_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_10,
    Y => sig_79_10,
    MIN => sig_113_11,
    MAX => sig_114_11
  );

  cmpswp_115_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_11,
    Y => sig_114_11,
    MIN => sig_115_12,
    MAX => sig_116_12
  );

  cmpswp_124_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_9,
    Y => sig_57_9,
    MIN => sig_124_10,
    MAX => sig_123_10
  );

  reg_124_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_10,
    Q => sig_124_11
  );

  reg_123_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_10,
    Q => sig_123_11
  );

  reg_123_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_11,
    Q => sig_123_12
  );

  reg_123_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_12,
    Q => sig_123_13
  );

  cmpswp_128_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_11,
    Y => sig_101_11,
    MIN => sig_128_12,
    MAX => sig_127_12
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

  reg_128_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_128_15,
    Q => sig_128_16
  );

  cmpswp_132_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_11,
    Y => sig_102_11,
    MIN => sig_132_12,
    MAX => sig_131_12
  );

  cmpswp_133_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_3,
    Y => sig_84_3,
    MIN => sig_133_4,
    MAX => sig_134_4
  );

  reg_133_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_4,
    Q => sig_133_5
  );

  reg_133_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_5,
    Q => sig_133_6
  );

  reg_133_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_6,
    Q => sig_133_7
  );

  reg_133_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_7,
    Q => sig_133_8
  );

  reg_133_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_8,
    Q => sig_133_9
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

  cmpswp_136_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_131_12,
    Y => sig_133_12,
    MIN => sig_136_13,
    MAX => sig_135_13
  );

  cmpswp_138_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_132_12,
    Y => sig_116_12,
    MIN => sig_138_13,
    MAX => sig_137_13
  );

  cmpswp_139_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_123_13,
    Y => sig_137_13,
    MIN => sig_139_14,
    MAX => sig_140_14
  );

  cmpswp_143_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_13,
    Y => sig_136_13,
    MIN => sig_143_14,
    MAX => sig_144_14
  );

  reg_143_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_14,
    Q => sig_143_15
  );

  reg_144_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_14,
    Q => sig_144_15
  );

  cmpswp_145_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_14,
    Y => sig_82_14,
    MIN => sig_145_15,
    MAX => sig_146_15
  );

  cmpswp_148_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_15,
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

  cmpswp_151_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_147_16,
    Y => sig_128_16,
    MIN => sig_151_17,
    MAX => sig_152_17
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
    X => sig_149_17,
    Y => sig_152_17,
    MIN => sig_154_18,
    MAX => sig_153_18
  );

  cmpswp_155_19: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_154_18,
    Y => sig_151_18,
    MIN => sig_155_19,
    MAX => sig_156_19
  );

  sig_out_med <= sig_156_19;
end generated;
