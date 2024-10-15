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

entity median_15 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 14,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_15 is
  signal sig_0_0, sig_1_0, sig_1_1, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_8_1, sig_9_0, sig_9_1, sig_10_0, sig_11_0, sig_12_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_1, sig_13_0, sig_14_0, sig_14_1, sig_15_1, sig_16_1, sig_15_2, sig_17_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_2, sig_18_3, sig_18_4, sig_19_3, sig_20_3, sig_19_4, sig_19_5, sig_20_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_20_5, sig_21_1, sig_22_1, sig_21_2, sig_24_2, sig_23_2, sig_25_3, sig_26_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_26_4, sig_27_1, sig_28_1, sig_27_2, sig_29_2, sig_30_2, sig_31_3, sig_32_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_1, sig_34_1, sig_33_2, sig_35_2, sig_36_2, sig_37_3, sig_38_3, sig_37_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_1, sig_40_1, sig_39_2, sig_41_2, sig_42_2, sig_42_3, sig_42_4, sig_43_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_3, sig_43_4, sig_43_5, sig_44_4, sig_44_5, sig_44_6, sig_45_4, sig_46_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_5, sig_45_6, sig_47_5, sig_48_5, sig_49_6, sig_50_6, sig_51_4, sig_52_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_5, sig_53_5, sig_54_5, sig_55_6, sig_56_6, sig_57_3, sig_58_3, sig_59_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_3, sig_61_4, sig_62_4, sig_62_5, sig_65_7, sig_66_7, sig_66_8, sig_66_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_10, sig_66_11, sig_67_5, sig_68_5, sig_67_6, sig_69_6, sig_70_6, sig_70_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_71_6, sig_72_6, sig_74_4, sig_73_4, sig_76_6, sig_75_6, sig_77_5, sig_78_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_77_6, sig_80_7, sig_79_7, sig_82_7, sig_81_7, sig_81_8, sig_83_7, sig_84_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_85_8, sig_86_8, sig_87_7, sig_88_7, sig_87_8, sig_88_8, sig_89_8, sig_90_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_91_9, sig_92_9, sig_93_7, sig_94_7, sig_93_8, sig_93_9, sig_95_9, sig_96_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_10, sig_96_10, sig_96_11, sig_97_10, sig_98_10, sig_99_11, sig_100_11, sig_100_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_102_9, sig_101_9, sig_101_10, sig_103_11, sig_104_11, sig_106_12, sig_105_12, sig_107_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_108_13, sig_110_12, sig_109_12, sig_110_13, sig_109_13, sig_111_14, sig_112_14, sig_114_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_113_14, sig_115_15, sig_116_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  end generate;
  reg_1_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Q => sig_1_1
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

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_0_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  reg_15_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Q => sig_15_2
  );

  cmpswp_17_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Y => sig_9_1,
    MIN => sig_17_2,
    MAX => sig_18_2
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

  cmpswp_19_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_2,
    Y => sig_15_2,
    MIN => sig_19_3,
    MAX => sig_20_3
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

  reg_20_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_3,
    Q => sig_20_4
  );

  reg_20_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_4,
    Q => sig_20_5
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_2_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  reg_21_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Q => sig_21_2
  );

  cmpswp_24_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Y => sig_22_1,
    MIN => sig_24_2,
    MAX => sig_23_2
  );

  cmpswp_25_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_2,
    Y => sig_24_2,
    MIN => sig_25_3,
    MAX => sig_26_3
  );

  reg_26_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Q => sig_26_4
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
    X => sig_1_1,
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
    X => sig_7_0,
    Y => sig_11_0,
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
    X => sig_8_1,
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

  reg_37_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_3,
    Q => sig_37_4
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_4_0,
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
    X => sig_14_1,
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

  reg_42_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Q => sig_42_4
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

  reg_43_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Q => sig_43_5
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

  reg_44_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_5,
    Q => sig_44_6
  );

  cmpswp_45_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Y => sig_25_3,
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

  cmpswp_47_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_4,
    Y => sig_46_4,
    MIN => sig_47_5,
    MAX => sig_48_5
  );

  cmpswp_49_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_5,
    Y => sig_19_5,
    MIN => sig_49_6,
    MAX => sig_50_6
  );

  cmpswp_51_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_38_3,
    MIN => sig_51_4,
    MAX => sig_52_4
  );

  reg_51_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_4,
    Q => sig_51_5
  );

  cmpswp_53_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_4,
    Y => sig_52_4,
    MIN => sig_53_5,
    MAX => sig_54_5
  );

  cmpswp_55_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_5,
    Y => sig_51_5,
    MIN => sig_55_6,
    MAX => sig_56_6
  );

  cmpswp_57_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Y => sig_36_2,
    MIN => sig_57_3,
    MAX => sig_58_3
  );

  cmpswp_59_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_23_2,
    MIN => sig_59_3,
    MAX => sig_60_3
  );

  cmpswp_61_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_3,
    Y => sig_60_3,
    MIN => sig_61_4,
    MAX => sig_62_4
  );

  reg_62_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_4,
    Q => sig_62_5
  );

  cmpswp_65_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_6,
    Y => sig_44_6,
    MIN => sig_65_7,
    MAX => sig_66_7
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

  reg_66_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_9,
    Q => sig_66_10
  );

  reg_66_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_10,
    Q => sig_66_11
  );

  cmpswp_67_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_4,
    Y => sig_42_4,
    MIN => sig_67_5,
    MAX => sig_68_5
  );

  reg_67_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_5,
    Q => sig_67_6
  );

  cmpswp_69_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_5,
    Y => sig_48_5,
    MIN => sig_69_6,
    MAX => sig_70_6
  );

  reg_70_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_6,
    Q => sig_70_7
  );

  cmpswp_71_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_5,
    Y => sig_54_5,
    MIN => sig_71_6,
    MAX => sig_72_6
  );

  cmpswp_74_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_3,
    Y => sig_58_3,
    MIN => sig_74_4,
    MAX => sig_73_4
  );

  cmpswp_76_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_5,
    Y => sig_68_5,
    MIN => sig_76_6,
    MAX => sig_75_6
  );

  cmpswp_77_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_4,
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

  cmpswp_80_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_6,
    Y => sig_76_6,
    MIN => sig_80_7,
    MAX => sig_79_7
  );

  cmpswp_82_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Y => sig_50_6,
    MIN => sig_82_7,
    MAX => sig_81_7
  );

  reg_81_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_7,
    Q => sig_81_8
  );

  cmpswp_83_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Y => sig_69_6,
    MIN => sig_83_7,
    MAX => sig_84_7
  );

  cmpswp_85_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_7,
    Y => sig_83_7,
    MIN => sig_85_8,
    MAX => sig_86_8
  );

  cmpswp_87_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_6,
    Y => sig_56_6,
    MIN => sig_87_7,
    MAX => sig_88_7
  );

  reg_87_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_7,
    Q => sig_87_8
  );

  reg_88_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_7,
    Q => sig_88_8
  );

  cmpswp_89_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_7,
    Y => sig_70_7,
    MIN => sig_89_8,
    MAX => sig_90_8
  );

  cmpswp_91_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_8,
    Y => sig_90_8,
    MIN => sig_91_9,
    MAX => sig_92_9
  );

  cmpswp_93_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_6,
    Y => sig_72_6,
    MIN => sig_93_7,
    MAX => sig_94_7
  );

  reg_93_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_7,
    Q => sig_93_8
  );

  reg_93_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_8,
    Q => sig_93_9
  );

  cmpswp_95_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_8,
    Y => sig_89_8,
    MIN => sig_95_9,
    MAX => sig_96_9
  );

  reg_95_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_9,
    Q => sig_95_10
  );

  reg_96_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_9,
    Q => sig_96_10
  );

  reg_96_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_10,
    Q => sig_96_11
  );

  cmpswp_97_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_9,
    Y => sig_91_9,
    MIN => sig_97_10,
    MAX => sig_98_10
  );

  cmpswp_99_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_10,
    Y => sig_97_10,
    MIN => sig_99_11,
    MAX => sig_100_11
  );

  reg_100_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_11,
    Q => sig_100_12
  );

  cmpswp_102_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_8,
    Y => sig_86_8,
    MIN => sig_102_9,
    MAX => sig_101_9
  );

  reg_101_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_9,
    Q => sig_101_10
  );

  cmpswp_103_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_10,
    Y => sig_101_10,
    MIN => sig_103_11,
    MAX => sig_104_11
  );

  cmpswp_106_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_11,
    Y => sig_104_11,
    MIN => sig_106_12,
    MAX => sig_105_12
  );

  cmpswp_107_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_12,
    Y => sig_100_12,
    MIN => sig_107_13,
    MAX => sig_108_13
  );

  cmpswp_110_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_11,
    Y => sig_66_11,
    MIN => sig_110_12,
    MAX => sig_109_12
  );

  reg_110_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_12,
    Q => sig_110_13
  );

  reg_109_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_12,
    Q => sig_109_13
  );

  cmpswp_111_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_13,
    Y => sig_109_13,
    MIN => sig_111_14,
    MAX => sig_112_14
  );

  cmpswp_114_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_13,
    Y => sig_110_13,
    MIN => sig_114_14,
    MAX => sig_113_14
  );

  cmpswp_115_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_14,
    Y => sig_112_14,
    MIN => sig_115_15,
    MAX => sig_116_15
  );

  sig_out_med <= sig_115_15;
end generated;
