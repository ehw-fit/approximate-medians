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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_4_1, sig_4_2, sig_5_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_6_1, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_0, sig_13_1, sig_14_0, sig_15_1, sig_16_1, sig_16_2, sig_17_2, sig_18_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_1, sig_20_1, sig_20_2, sig_20_3, sig_22_1, sig_21_1, sig_22_2, sig_21_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_3, sig_25_1, sig_26_1, sig_28_1, sig_27_1, sig_28_2, sig_28_3, sig_30_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_3, sig_31_2, sig_32_2, sig_32_3, sig_32_4, sig_32_5, sig_34_4, sig_33_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_5, sig_34_6, sig_33_5, sig_37_1, sig_38_1, sig_38_2, sig_38_3, sig_38_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_3, sig_40_3, sig_40_4, sig_40_5, sig_40_6, sig_40_7, sig_40_8, sig_42_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_2, sig_42_3, sig_41_3, sig_41_4, sig_41_5, sig_43_2, sig_44_2, sig_45_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_3, sig_46_4, sig_46_5, sig_46_6, sig_46_7, sig_46_8, sig_47_4, sig_48_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_49_4, sig_50_4, sig_49_5, sig_49_6, sig_50_5, sig_50_6, sig_50_7, sig_51_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_52_5, sig_54_6, sig_53_6, sig_54_7, sig_55_6, sig_56_6, sig_59_7, sig_60_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_61_8, sig_62_8, sig_63_3, sig_64_3, sig_63_4, sig_64_4, sig_64_5, sig_64_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_5, sig_65_5, sig_70_6, sig_69_6, sig_70_7, sig_72_7, sig_71_7, sig_74_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_73_8, sig_74_9, sig_74_10, sig_75_7, sig_76_7, sig_75_8, sig_80_4, sig_79_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_79_5, sig_79_6, sig_79_7, sig_79_8, sig_83_8, sig_84_8, sig_83_9, sig_85_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_8, sig_88_9, sig_87_9, sig_89_9, sig_90_9, sig_92_9, sig_91_9, sig_91_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_10, sig_96_10, sig_97_10, sig_98_10, sig_98_11, sig_98_12, sig_100_11, sig_99_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_100_12, sig_100_13, sig_104_11, sig_103_11, sig_105_12, sig_106_12, sig_107_13, sig_108_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_110_9, sig_109_9, sig_109_10, sig_109_11, sig_109_12, sig_109_13, sig_112_14, sig_111_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_114_14, sig_113_14, sig_116_15, sig_115_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_6_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Q => sig_6_1
  );

  reg_13_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Q => sig_13_1
  );

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_12_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  reg_16_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Q => sig_16_2
  );

  cmpswp_17_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Y => sig_13_1,
    MIN => sig_17_2,
    MAX => sig_18_2
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Y => sig_0_0,
    MIN => sig_19_1,
    MAX => sig_20_1
  );

  reg_20_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Q => sig_20_2
  );

  reg_20_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Q => sig_20_3
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_11_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  reg_22_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Q => sig_22_2
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

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_10_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_5_0,
    MIN => sig_28_1,
    MAX => sig_27_1
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

  cmpswp_30_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_2,
    Y => sig_4_2,
    MIN => sig_30_3,
    MAX => sig_29_3
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Y => sig_27_1,
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

  cmpswp_34_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_3,
    Y => sig_30_3,
    MIN => sig_34_4,
    MAX => sig_33_4
  );

  reg_34_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_4,
    Q => sig_34_5
  );

  reg_34_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_5,
    Q => sig_34_6
  );

  reg_33_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_4,
    Q => sig_33_5
  );

  cmpswp_37_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_2_0,
    MIN => sig_37_1,
    MAX => sig_38_1
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

  reg_38_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_3,
    Q => sig_38_4
  );

  cmpswp_39_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Y => sig_31_2,
    MIN => sig_39_3,
    MAX => sig_40_3
  );

  reg_40_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_3,
    Q => sig_40_4
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

  cmpswp_42_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_1,
    Y => sig_25_1,
    MIN => sig_42_2,
    MAX => sig_41_2
  );

  reg_42_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_2,
    Q => sig_42_3
  );

  reg_41_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_2,
    Q => sig_41_3
  );

  reg_41_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Q => sig_41_4
  );

  reg_41_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_4,
    Q => sig_41_5
  );

  cmpswp_43_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_1,
    Y => sig_19_1,
    MIN => sig_43_2,
    MAX => sig_44_2
  );

  cmpswp_45_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_2,
    Y => sig_16_2,
    MIN => sig_45_3,
    MAX => sig_46_3
  );

  reg_46_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_3,
    Q => sig_46_4
  );

  reg_46_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Q => sig_46_5
  );

  reg_46_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_5,
    Q => sig_46_6
  );

  reg_46_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_6,
    Q => sig_46_7
  );

  reg_46_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_7,
    Q => sig_46_8
  );

  cmpswp_47_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_3,
    Y => sig_45_3,
    MIN => sig_47_4,
    MAX => sig_48_4
  );

  cmpswp_49_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_3,
    Y => sig_20_3,
    MIN => sig_49_4,
    MAX => sig_50_4
  );

  reg_49_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_4,
    Q => sig_49_5
  );

  reg_49_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_5,
    Q => sig_49_6
  );

  reg_50_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_4,
    Q => sig_50_5
  );

  reg_50_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_5,
    Q => sig_50_6
  );

  reg_50_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_6,
    Q => sig_50_7
  );

  cmpswp_51_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_4,
    Y => sig_38_4,
    MIN => sig_51_5,
    MAX => sig_52_5
  );

  cmpswp_54_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_5,
    Y => sig_52_5,
    MIN => sig_54_6,
    MAX => sig_53_6
  );

  reg_54_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_6,
    Q => sig_54_7
  );

  cmpswp_55_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_5,
    Y => sig_33_5,
    MIN => sig_55_6,
    MAX => sig_56_6
  );

  cmpswp_59_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_6,
    Y => sig_49_6,
    MIN => sig_59_7,
    MAX => sig_60_7
  );

  cmpswp_61_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_7,
    Y => sig_54_7,
    MIN => sig_61_8,
    MAX => sig_62_8
  );

  cmpswp_63_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_2,
    Y => sig_43_2,
    MIN => sig_63_3,
    MAX => sig_64_3
  );

  reg_63_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_3,
    Q => sig_63_4
  );

  reg_64_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_3,
    Q => sig_64_4
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

  cmpswp_66_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_4,
    Y => sig_47_4,
    MIN => sig_66_5,
    MAX => sig_65_5
  );

  cmpswp_70_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_5,
    Y => sig_41_5,
    MIN => sig_70_6,
    MAX => sig_69_6
  );

  reg_70_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_6,
    Q => sig_70_7
  );

  cmpswp_72_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_6,
    Y => sig_55_6,
    MIN => sig_72_7,
    MAX => sig_71_7
  );

  cmpswp_74_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_7,
    Y => sig_60_7,
    MIN => sig_74_8,
    MAX => sig_73_8
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

  cmpswp_75_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_6,
    Y => sig_69_6,
    MIN => sig_75_7,
    MAX => sig_76_7
  );

  reg_75_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_7,
    Q => sig_75_8
  );

  cmpswp_80_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_3,
    Y => sig_42_3,
    MIN => sig_80_4,
    MAX => sig_79_4
  );

  reg_79_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_4,
    Q => sig_79_5
  );

  reg_79_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_5,
    Q => sig_79_6
  );

  reg_79_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_6,
    Q => sig_79_7
  );

  reg_79_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_7,
    Q => sig_79_8
  );

  cmpswp_83_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_7,
    Y => sig_76_7,
    MIN => sig_83_8,
    MAX => sig_84_8
  );

  reg_83_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_8,
    Q => sig_83_9
  );

  cmpswp_85_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_7,
    Y => sig_70_7,
    MIN => sig_85_8,
    MAX => sig_86_8
  );

  cmpswp_88_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_8,
    Y => sig_62_8,
    MIN => sig_88_9,
    MAX => sig_87_9
  );

  cmpswp_89_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_8,
    Y => sig_84_8,
    MIN => sig_89_9,
    MAX => sig_90_9
  );

  cmpswp_92_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_8,
    Y => sig_61_8,
    MIN => sig_92_9,
    MAX => sig_91_9
  );

  reg_91_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_9,
    Q => sig_91_10
  );

  cmpswp_95_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_9,
    Y => sig_89_9,
    MIN => sig_95_10,
    MAX => sig_96_10
  );

  cmpswp_97_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_9,
    Y => sig_92_9,
    MIN => sig_97_10,
    MAX => sig_98_10
  );

  reg_98_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_10,
    Q => sig_98_11
  );

  reg_98_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_11,
    Q => sig_98_12
  );

  cmpswp_100_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_10,
    Y => sig_91_10,
    MIN => sig_100_11,
    MAX => sig_99_11
  );

  reg_100_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_11,
    Q => sig_100_12
  );

  reg_100_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_12,
    Q => sig_100_13
  );

  cmpswp_104_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_10,
    Y => sig_74_10,
    MIN => sig_104_11,
    MAX => sig_103_11
  );

  cmpswp_105_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_11,
    Y => sig_99_11,
    MIN => sig_105_12,
    MAX => sig_106_12
  );

  cmpswp_107_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_12,
    Y => sig_98_12,
    MIN => sig_107_13,
    MAX => sig_108_13
  );

  cmpswp_110_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_79_8,
    Y => sig_86_8,
    MIN => sig_110_9,
    MAX => sig_109_9
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

  reg_109_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_12,
    Q => sig_109_13
  );

  cmpswp_112_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_13,
    Y => sig_100_13,
    MIN => sig_112_14,
    MAX => sig_111_14
  );

  cmpswp_114_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_13,
    Y => sig_109_13,
    MIN => sig_114_14,
    MAX => sig_113_14
  );

  cmpswp_116_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_14,
    Y => sig_111_14,
    MIN => sig_116_15,
    MAX => sig_115_15
  );

  sig_out_med <= sig_115_15;
end generated;
