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
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_2_2, sig_3_0, sig_4_0, sig_5_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_7_0, sig_7_1, sig_7_2, sig_8_0, sig_9_0, sig_10_0, sig_11_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_0, sig_12_1, sig_12_2, sig_13_0, sig_14_0, sig_15_0, sig_16_0, sig_17_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_17_1, sig_17_2, sig_18_0, sig_19_0, sig_20_0, sig_21_0, sig_22_0, sig_22_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_2, sig_23_0, sig_24_0, sig_25_1, sig_26_1, sig_27_1, sig_28_1, sig_29_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_2, sig_30_3, sig_31_2, sig_32_2, sig_33_3, sig_34_3, sig_33_4, sig_35_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_36_4, sig_37_5, sig_38_5, sig_39_1, sig_40_1, sig_41_1, sig_42_1, sig_43_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_2, sig_44_3, sig_45_2, sig_46_2, sig_47_3, sig_48_3, sig_47_4, sig_49_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_50_4, sig_51_5, sig_52_5, sig_53_1, sig_54_1, sig_55_1, sig_56_1, sig_57_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_58_2, sig_58_3, sig_59_2, sig_60_2, sig_61_3, sig_62_3, sig_61_4, sig_63_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_64_4, sig_65_5, sig_66_5, sig_66_6, sig_66_7, sig_67_1, sig_68_1, sig_69_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_70_1, sig_71_2, sig_72_2, sig_72_3, sig_73_2, sig_74_2, sig_75_3, sig_76_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_75_4, sig_77_4, sig_78_4, sig_79_5, sig_80_5, sig_81_1, sig_82_1, sig_83_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_84_1, sig_85_2, sig_86_2, sig_86_3, sig_87_2, sig_88_2, sig_89_3, sig_90_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_89_4, sig_91_4, sig_92_4, sig_93_5, sig_94_5, sig_95_6, sig_96_6, sig_97_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_98_6, sig_99_7, sig_100_7, sig_100_8, sig_101_7, sig_102_7, sig_103_8, sig_104_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_103_9, sig_105_9, sig_106_9, sig_107_10, sig_108_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_2_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_1,
    Q => sig_2_2
  );

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

  reg_12_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Q => sig_12_1
  );

  reg_12_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Q => sig_12_2
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

  reg_22_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_0,
    Q => sig_22_1
  );

  reg_22_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Q => sig_22_2
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_1_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_4_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  cmpswp_29_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Y => sig_27_1,
    MIN => sig_29_2,
    MAX => sig_30_2
  );

  reg_30_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Q => sig_30_3
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Y => sig_28_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  cmpswp_33_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_2,
    Y => sig_2_2,
    MIN => sig_33_3,
    MAX => sig_34_3
  );

  reg_33_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_3,
    Q => sig_33_4
  );

  cmpswp_35_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_3,
    Y => sig_30_3,
    MIN => sig_35_4,
    MAX => sig_36_4
  );

  cmpswp_37_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_4,
    Y => sig_35_4,
    MIN => sig_37_5,
    MAX => sig_38_5
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_6_0,
    MIN => sig_39_1,
    MAX => sig_40_1
  );

  cmpswp_41_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_9_0,
    MIN => sig_41_1,
    MAX => sig_42_1
  );

  cmpswp_43_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Y => sig_41_1,
    MIN => sig_43_2,
    MAX => sig_44_2
  );

  reg_44_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_2,
    Q => sig_44_3
  );

  cmpswp_45_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_1,
    Y => sig_42_1,
    MIN => sig_45_2,
    MAX => sig_46_2
  );

  cmpswp_47_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_2,
    Y => sig_7_2,
    MIN => sig_47_3,
    MAX => sig_48_3
  );

  reg_47_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Q => sig_47_4
  );

  cmpswp_49_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_3,
    Y => sig_44_3,
    MIN => sig_49_4,
    MAX => sig_50_4
  );

  cmpswp_51_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_4,
    Y => sig_49_4,
    MIN => sig_51_5,
    MAX => sig_52_5
  );

  cmpswp_53_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_11_0,
    MIN => sig_53_1,
    MAX => sig_54_1
  );

  cmpswp_55_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_14_0,
    MIN => sig_55_1,
    MAX => sig_56_1
  );

  cmpswp_57_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_1,
    Y => sig_55_1,
    MIN => sig_57_2,
    MAX => sig_58_2
  );

  reg_58_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_2,
    Q => sig_58_3
  );

  cmpswp_59_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_1,
    Y => sig_56_1,
    MIN => sig_59_2,
    MAX => sig_60_2
  );

  cmpswp_61_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_2,
    Y => sig_12_2,
    MIN => sig_61_3,
    MAX => sig_62_3
  );

  reg_61_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_3,
    Q => sig_61_4
  );

  cmpswp_63_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_3,
    Y => sig_58_3,
    MIN => sig_63_4,
    MAX => sig_64_4
  );

  cmpswp_65_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_4,
    Y => sig_63_4,
    MIN => sig_65_5,
    MAX => sig_66_5
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

  cmpswp_67_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_16_0,
    MIN => sig_67_1,
    MAX => sig_68_1
  );

  cmpswp_69_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_19_0,
    MIN => sig_69_1,
    MAX => sig_70_1
  );

  cmpswp_71_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_1,
    Y => sig_69_1,
    MIN => sig_71_2,
    MAX => sig_72_2
  );

  reg_72_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_2,
    Q => sig_72_3
  );

  cmpswp_73_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_1,
    Y => sig_70_1,
    MIN => sig_73_2,
    MAX => sig_74_2
  );

  cmpswp_75_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_2,
    Y => sig_17_2,
    MIN => sig_75_3,
    MAX => sig_76_3
  );

  reg_75_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_3,
    Q => sig_75_4
  );

  cmpswp_77_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_3,
    Y => sig_72_3,
    MIN => sig_77_4,
    MAX => sig_78_4
  );

  cmpswp_79_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_4,
    Y => sig_77_4,
    MIN => sig_79_5,
    MAX => sig_80_5
  );

  cmpswp_81_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_0,
    Y => sig_21_0,
    MIN => sig_81_1,
    MAX => sig_82_1
  );

  cmpswp_83_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_0,
    Y => sig_24_0,
    MIN => sig_83_1,
    MAX => sig_84_1
  );

  cmpswp_85_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_1,
    Y => sig_83_1,
    MIN => sig_85_2,
    MAX => sig_86_2
  );

  reg_86_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_2,
    Q => sig_86_3
  );

  cmpswp_87_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_1,
    Y => sig_84_1,
    MIN => sig_87_2,
    MAX => sig_88_2
  );

  cmpswp_89_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_2,
    Y => sig_22_2,
    MIN => sig_89_3,
    MAX => sig_90_3
  );

  reg_89_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_3,
    Q => sig_89_4
  );

  cmpswp_91_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_3,
    Y => sig_86_3,
    MIN => sig_91_4,
    MAX => sig_92_4
  );

  cmpswp_93_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_4,
    Y => sig_91_4,
    MIN => sig_93_5,
    MAX => sig_94_5
  );

  cmpswp_95_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_5,
    Y => sig_52_5,
    MIN => sig_95_6,
    MAX => sig_96_6
  );

  cmpswp_97_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_5,
    Y => sig_94_5,
    MIN => sig_97_6,
    MAX => sig_98_6
  );

  cmpswp_99_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_6,
    Y => sig_97_6,
    MIN => sig_99_7,
    MAX => sig_100_7
  );

  reg_100_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_7,
    Q => sig_100_8
  );

  cmpswp_101_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_6,
    Y => sig_98_6,
    MIN => sig_101_7,
    MAX => sig_102_7
  );

  cmpswp_103_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_7,
    Y => sig_66_7,
    MIN => sig_103_8,
    MAX => sig_104_8
  );

  reg_103_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_8,
    Q => sig_103_9
  );

  cmpswp_105_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_8,
    Y => sig_100_8,
    MIN => sig_105_9,
    MAX => sig_106_9
  );

  cmpswp_107_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_9,
    Y => sig_105_9,
    MIN => sig_107_10,
    MAX => sig_108_10
  );

  sig_out_med <= sig_108_10;
end generated;
