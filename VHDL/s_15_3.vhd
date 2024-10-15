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
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_3_1, sig_4_0, sig_4_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_4_2, sig_5_0, sig_6_0, sig_7_0, sig_8_0, sig_9_0, sig_9_1, sig_10_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_0, sig_12_0, sig_13_0, sig_14_0, sig_14_1, sig_16_1, sig_15_1, sig_17_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_1, sig_19_1, sig_20_1, sig_19_2, sig_19_3, sig_20_2, sig_25_2, sig_26_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_26_3, sig_28_2, sig_27_2, sig_27_3, sig_27_4, sig_27_5, sig_27_6, sig_30_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_3, sig_30_4, sig_31_2, sig_32_2, sig_32_3, sig_32_4, sig_32_5, sig_33_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_3, sig_34_4, sig_34_5, sig_35_1, sig_36_1, sig_35_2, sig_35_3, sig_35_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_38_2, sig_37_2, sig_39_3, sig_40_3, sig_41_1, sig_42_1, sig_42_2, sig_42_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_42_4, sig_42_5, sig_42_6, sig_42_7, sig_43_2, sig_44_2, sig_43_3, sig_43_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_4, sig_45_4, sig_48_5, sig_47_5, sig_48_6, sig_48_7, sig_48_8, sig_48_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_10, sig_48_11, sig_48_12, sig_50_3, sig_49_3, sig_51_4, sig_52_4, sig_52_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_52_6, sig_52_7, sig_54_5, sig_53_5, sig_54_6, sig_54_7, sig_56_6, sig_55_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_55_7, sig_57_4, sig_58_4, sig_57_5, sig_57_6, sig_57_7, sig_57_8, sig_57_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_10, sig_57_11, sig_57_12, sig_63_4, sig_64_4, sig_63_5, sig_64_5, sig_64_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_65_6, sig_66_6, sig_66_7, sig_66_8, sig_67_7, sig_68_7, sig_70_8, sig_69_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_72_7, sig_71_7, sig_75_8, sig_76_8, sig_77_8, sig_78_8, sig_79_9, sig_80_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_81_9, sig_82_9, sig_84_10, sig_83_10, sig_85_8, sig_86_8, sig_86_9, sig_86_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_88_9, sig_87_9, sig_87_10, sig_89_10, sig_90_10, sig_92_5, sig_91_5, sig_95_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_96_11, sig_97_6, sig_98_6, sig_98_7, sig_98_8, sig_98_9, sig_98_10, sig_98_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_99_12, sig_100_12, sig_100_13, sig_102_11, sig_101_11, sig_103_12, sig_104_12, sig_105_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_106_13, sig_107_14, sig_108_14, sig_110_13, sig_109_13, sig_110_14, sig_109_14, sig_111_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_112_15, sig_113_15, sig_114_15, sig_116_16, sig_115_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_9_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Q => sig_9_1
  );

  reg_14_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Q => sig_14_1
  );

  cmpswp_16_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_12_0,
    MIN => sig_16_1,
    MAX => sig_15_1
  );

  cmpswp_17_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_7_0,
    MIN => sig_17_1,
    MAX => sig_18_1
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_8_0,
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

  reg_20_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Q => sig_20_2
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_14_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  reg_26_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Q => sig_26_3
  );

  cmpswp_28_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_16_1,
    MIN => sig_28_2,
    MAX => sig_27_2
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

  reg_27_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_5,
    Q => sig_27_6
  );

  cmpswp_30_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Y => sig_20_2,
    MIN => sig_30_3,
    MAX => sig_29_3
  );

  reg_30_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Q => sig_30_4
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Y => sig_9_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  reg_32_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Q => sig_32_3
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

  cmpswp_33_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Y => sig_4_2,
    MIN => sig_33_3,
    MAX => sig_34_3
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

  cmpswp_35_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_10_0,
    MIN => sig_35_1,
    MAX => sig_36_1
  );

  reg_35_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_1,
    Q => sig_35_2
  );

  reg_35_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_2,
    Q => sig_35_3
  );

  reg_35_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_3,
    Q => sig_35_4
  );

  cmpswp_38_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_1,
    Y => sig_2_1,
    MIN => sig_38_2,
    MAX => sig_37_2
  );

  cmpswp_39_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_2,
    Y => sig_31_2,
    MIN => sig_39_3,
    MAX => sig_40_3
  );

  cmpswp_41_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_0_0,
    MIN => sig_41_1,
    MAX => sig_42_1
  );

  reg_42_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_1,
    Q => sig_42_2
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

  reg_42_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_6,
    Q => sig_42_7
  );

  cmpswp_43_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Y => sig_3_1,
    MIN => sig_43_2,
    MAX => sig_44_2
  );

  reg_43_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_2,
    Q => sig_43_3
  );

  reg_43_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Q => sig_43_4
  );

  cmpswp_46_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_3,
    Y => sig_39_3,
    MIN => sig_46_4,
    MAX => sig_45_4
  );

  cmpswp_48_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_4,
    Y => sig_45_4,
    MIN => sig_48_5,
    MAX => sig_47_5
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

  reg_48_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_7,
    Q => sig_48_8
  );

  reg_48_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_8,
    Q => sig_48_9
  );

  reg_48_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_9,
    Q => sig_48_10
  );

  reg_48_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_10,
    Q => sig_48_11
  );

  reg_48_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_11,
    Q => sig_48_12
  );

  cmpswp_50_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_2,
    Y => sig_44_2,
    MIN => sig_50_3,
    MAX => sig_49_3
  );

  cmpswp_51_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Y => sig_40_3,
    MIN => sig_51_4,
    MAX => sig_52_4
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

  cmpswp_54_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Y => sig_51_4,
    MIN => sig_54_5,
    MAX => sig_53_5
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

  cmpswp_56_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_5,
    Y => sig_47_5,
    MIN => sig_56_6,
    MAX => sig_55_6
  );

  reg_55_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_6,
    Q => sig_55_7
  );

  cmpswp_57_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_3,
    Y => sig_29_3,
    MIN => sig_57_4,
    MAX => sig_58_4
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

  reg_57_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_9,
    Q => sig_57_10
  );

  reg_57_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_10,
    Q => sig_57_11
  );

  reg_57_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_11,
    Q => sig_57_12
  );

  cmpswp_63_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Y => sig_19_3,
    MIN => sig_63_4,
    MAX => sig_64_4
  );

  reg_63_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_4,
    Q => sig_63_5
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

  cmpswp_65_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_5,
    Y => sig_53_5,
    MIN => sig_65_6,
    MAX => sig_66_6
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

  cmpswp_67_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_6,
    Y => sig_56_6,
    MIN => sig_67_7,
    MAX => sig_68_7
  );

  cmpswp_70_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_7,
    Y => sig_67_7,
    MIN => sig_70_8,
    MAX => sig_69_8
  );

  cmpswp_72_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_6,
    Y => sig_64_6,
    MIN => sig_72_7,
    MAX => sig_71_7
  );

  cmpswp_75_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_7,
    Y => sig_52_7,
    MIN => sig_75_8,
    MAX => sig_76_8
  );

  cmpswp_77_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_7,
    Y => sig_42_7,
    MIN => sig_77_8,
    MAX => sig_78_8
  );

  cmpswp_79_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_8,
    Y => sig_66_8,
    MIN => sig_79_9,
    MAX => sig_80_9
  );

  cmpswp_81_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_8,
    Y => sig_78_8,
    MIN => sig_81_9,
    MAX => sig_82_9
  );

  cmpswp_84_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_9,
    Y => sig_81_9,
    MIN => sig_84_10,
    MAX => sig_83_10
  );

  cmpswp_85_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_7,
    Y => sig_72_7,
    MIN => sig_85_8,
    MAX => sig_86_8
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

  cmpswp_88_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_8,
    Y => sig_69_8,
    MIN => sig_88_9,
    MAX => sig_87_9
  );

  reg_87_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_9,
    Q => sig_87_10
  );

  cmpswp_89_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_9,
    Y => sig_79_9,
    MIN => sig_89_10,
    MAX => sig_90_10
  );

  cmpswp_92_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Y => sig_30_4,
    MIN => sig_92_5,
    MAX => sig_91_5
  );

  cmpswp_95_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_10,
    Y => sig_87_10,
    MIN => sig_95_11,
    MAX => sig_96_11
  );

  cmpswp_97_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_5,
    Y => sig_63_5,
    MIN => sig_97_6,
    MAX => sig_98_6
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

  reg_98_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_9,
    Q => sig_98_10
  );

  reg_98_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_10,
    Q => sig_98_11
  );

  cmpswp_99_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_11,
    Y => sig_95_11,
    MIN => sig_99_12,
    MAX => sig_100_12
  );

  reg_100_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_12,
    Q => sig_100_13
  );

  cmpswp_102_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_10,
    Y => sig_84_10,
    MIN => sig_102_11,
    MAX => sig_101_11
  );

  cmpswp_103_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_11,
    Y => sig_102_11,
    MIN => sig_103_12,
    MAX => sig_104_12
  );

  cmpswp_105_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_12,
    Y => sig_104_12,
    MIN => sig_105_13,
    MAX => sig_106_13
  );

  cmpswp_107_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_13,
    Y => sig_100_13,
    MIN => sig_107_14,
    MAX => sig_108_14
  );

  cmpswp_110_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_12,
    Y => sig_48_12,
    MIN => sig_110_13,
    MAX => sig_109_13
  );

  reg_110_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_13,
    Q => sig_110_14
  );

  reg_109_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_13,
    Q => sig_109_14
  );

  cmpswp_111_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_14,
    Y => sig_109_14,
    MIN => sig_111_15,
    MAX => sig_112_15
  );

  cmpswp_113_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_14,
    Y => sig_110_14,
    MIN => sig_113_15,
    MAX => sig_114_15
  );

  cmpswp_116_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_15,
    Y => sig_111_15,
    MIN => sig_116_16,
    MAX => sig_115_16
  );

  sig_out_med <= sig_115_16;
end generated;
