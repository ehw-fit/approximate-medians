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
  signal sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0, sig_14_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_1, sig_16_1, sig_18_1, sig_17_1, sig_20_1, sig_19_1, sig_21_2, sig_22_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_3, sig_22_4, sig_22_5, sig_22_6, sig_23_1, sig_24_1, sig_24_2, sig_26_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_1, sig_25_2, sig_25_3, sig_30_1, sig_29_1, sig_29_2, sig_29_3, sig_29_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_5, sig_31_2, sig_32_2, sig_34_2, sig_33_2, sig_38_1, sig_37_1, sig_38_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_38_3, sig_37_2, sig_40_2, sig_39_2, sig_40_3, sig_41_3, sig_42_3, sig_42_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_2, sig_43_2, sig_44_3, sig_44_4, sig_44_5, sig_43_3, sig_45_3, sig_46_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_3, sig_47_3, sig_48_4, sig_54_4, sig_53_4, sig_56_4, sig_55_4, sig_57_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_58_5, sig_62_3, sig_61_3, sig_61_4, sig_64_4, sig_63_4, sig_64_5, sig_64_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_64_7, sig_64_8, sig_69_5, sig_70_5, sig_69_6, sig_69_7, sig_71_5, sig_72_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_71_6, sig_71_7, sig_76_4, sig_75_4, sig_77_6, sig_78_6, sig_79_6, sig_80_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_5, sig_81_5, sig_81_6, sig_83_7, sig_84_7, sig_88_8, sig_87_8, sig_87_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_90_9, sig_89_9, sig_91_10, sig_92_10, sig_95_7, sig_96_7, sig_95_8, sig_95_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_5, sig_98_5, sig_99_10, sig_100_10, sig_100_11, sig_102_8, sig_101_8, sig_102_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_102_10, sig_104_6, sig_103_6, sig_106_11, sig_105_11, sig_108_12, sig_107_12, sig_110_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_109_7, sig_110_8, sig_110_9, sig_110_10, sig_110_11, sig_110_12, sig_109_8, sig_109_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_109_10, sig_109_11, sig_109_12, sig_112_13, sig_111_13, sig_114_13, sig_113_13, sig_116_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_115_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_11_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  cmpswp_18_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_9_0,
    MIN => sig_18_1,
    MAX => sig_17_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_14_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  cmpswp_21_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_1_1,
    MIN => sig_21_2,
    MAX => sig_22_2
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

  reg_22_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_4,
    Q => sig_22_5
  );

  reg_22_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_5,
    Q => sig_22_6
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_12_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  reg_24_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Q => sig_24_2
  );

  cmpswp_26_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_8_0,
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

  cmpswp_30_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_4_0,
    MIN => sig_30_1,
    MAX => sig_29_1
  );

  reg_29_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Q => sig_29_2
  );

  reg_29_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
    Q => sig_29_3
  );

  reg_29_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_3,
    Q => sig_29_4
  );

  reg_29_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_4,
    Q => sig_29_5
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Y => sig_30_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  cmpswp_34_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_15_1,
    MIN => sig_34_2,
    MAX => sig_33_2
  );

  cmpswp_38_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_2_0,
    MIN => sig_38_1,
    MAX => sig_37_1
  );

  reg_38_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_1,
    Q => sig_38_2
  );

  reg_38_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_2,
    Q => sig_38_3
  );

  reg_37_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_1,
    Q => sig_37_2
  );

  cmpswp_40_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Y => sig_19_1,
    MIN => sig_40_2,
    MAX => sig_39_2
  );

  reg_40_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_2,
    Q => sig_40_3
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_2,
    Y => sig_33_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  reg_42_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Q => sig_42_4
  );

  cmpswp_44_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_23_1,
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

  reg_43_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_2,
    Q => sig_43_3
  );

  cmpswp_45_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_2,
    Y => sig_31_2,
    MIN => sig_45_3,
    MAX => sig_46_3
  );

  cmpswp_48_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_2,
    Y => sig_32_2,
    MIN => sig_48_3,
    MAX => sig_47_3
  );

  reg_48_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_3,
    Q => sig_48_4
  );

  cmpswp_54_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Y => sig_40_3,
    MIN => sig_54_4,
    MAX => sig_53_4
  );

  cmpswp_56_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_3,
    Y => sig_41_3,
    MIN => sig_56_4,
    MAX => sig_55_4
  );

  cmpswp_57_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_4,
    Y => sig_55_4,
    MIN => sig_57_5,
    MAX => sig_58_5
  );

  cmpswp_62_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_2,
    Y => sig_24_2,
    MIN => sig_62_3,
    MAX => sig_61_3
  );

  reg_61_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_3,
    Q => sig_61_4
  );

  cmpswp_64_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_3,
    Y => sig_25_3,
    MIN => sig_64_4,
    MAX => sig_63_4
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

  reg_64_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_6,
    Q => sig_64_7
  );

  reg_64_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_7,
    Q => sig_64_8
  );

  cmpswp_69_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_4,
    Y => sig_63_4,
    MIN => sig_69_5,
    MAX => sig_70_5
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

  cmpswp_71_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_4,
    Y => sig_42_4,
    MIN => sig_71_5,
    MAX => sig_72_5
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

  cmpswp_76_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Y => sig_46_3,
    MIN => sig_76_4,
    MAX => sig_75_4
  );

  cmpswp_77_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_5,
    Y => sig_57_5,
    MIN => sig_77_6,
    MAX => sig_78_6
  );

  cmpswp_79_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_5,
    Y => sig_58_5,
    MIN => sig_79_6,
    MAX => sig_80_6
  );

  cmpswp_82_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Y => sig_75_4,
    MIN => sig_82_5,
    MAX => sig_81_5
  );

  reg_81_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_5,
    Q => sig_81_6
  );

  cmpswp_83_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_6,
    Y => sig_80_6,
    MIN => sig_83_7,
    MAX => sig_84_7
  );

  cmpswp_88_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_7,
    Y => sig_83_7,
    MIN => sig_88_8,
    MAX => sig_87_8
  );

  reg_87_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_8,
    Q => sig_87_9
  );

  cmpswp_90_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_8,
    Y => sig_64_8,
    MIN => sig_90_9,
    MAX => sig_89_9
  );

  cmpswp_91_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_9,
    Y => sig_89_9,
    MIN => sig_91_10,
    MAX => sig_92_10
  );

  cmpswp_95_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_6,
    Y => sig_81_6,
    MIN => sig_95_7,
    MAX => sig_96_7
  );

  reg_95_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_7,
    Q => sig_95_8
  );

  reg_95_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_8,
    Q => sig_95_9
  );

  cmpswp_97_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_4,
    Y => sig_48_4,
    MIN => sig_97_5,
    MAX => sig_98_5
  );

  cmpswp_99_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_9,
    Y => sig_90_9,
    MIN => sig_99_10,
    MAX => sig_100_10
  );

  reg_100_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_10,
    Q => sig_100_11
  );

  cmpswp_102_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_7,
    Y => sig_96_7,
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

  cmpswp_104_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_5,
    Y => sig_82_5,
    MIN => sig_104_6,
    MAX => sig_103_6
  );

  cmpswp_106_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_10,
    Y => sig_91_10,
    MIN => sig_106_11,
    MAX => sig_105_11
  );

  cmpswp_108_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_11,
    Y => sig_100_11,
    MIN => sig_108_12,
    MAX => sig_107_12
  );

  cmpswp_110_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_6,
    Y => sig_78_6,
    MIN => sig_110_7,
    MAX => sig_109_7
  );

  reg_110_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_7,
    Q => sig_110_8
  );

  reg_110_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_8,
    Q => sig_110_9
  );

  reg_110_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_9,
    Q => sig_110_10
  );

  reg_110_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_10,
    Q => sig_110_11
  );

  reg_110_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_11,
    Q => sig_110_12
  );

  reg_109_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_7,
    Q => sig_109_8
  );

  reg_109_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_8,
    Q => sig_109_9
  );

  reg_109_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_9,
    Q => sig_109_10
  );

  reg_109_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_10,
    Q => sig_109_11
  );

  reg_109_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_11,
    Q => sig_109_12
  );

  cmpswp_112_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_12,
    Y => sig_109_12,
    MIN => sig_112_13,
    MAX => sig_111_13
  );

  cmpswp_114_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_12,
    Y => sig_110_12,
    MIN => sig_114_13,
    MAX => sig_113_13
  );

  cmpswp_116_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_13,
    Y => sig_113_13,
    MIN => sig_116_14,
    MAX => sig_115_14
  );

  sig_out_med <= sig_115_14;
end generated;
