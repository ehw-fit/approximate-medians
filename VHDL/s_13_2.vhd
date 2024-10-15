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

entity median_13 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 12,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_13 is
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_5_0, sig_5_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_12_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_1, sig_14_1, sig_14_2, sig_15_1, sig_16_1, sig_16_2, sig_17_1, sig_18_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_2, sig_20_2, sig_22_1, sig_21_1, sig_21_2, sig_21_3, sig_23_3, sig_24_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_24_4, sig_25_2, sig_26_2, sig_26_3, sig_28_1, sig_27_1, sig_28_2, sig_27_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_27_3, sig_29_2, sig_30_2, sig_30_3, sig_31_2, sig_32_2, sig_31_3, sig_34_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_4, sig_35_3, sig_36_3, sig_37_4, sig_38_4, sig_38_5, sig_38_6, sig_40_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_3, sig_41_3, sig_42_3, sig_43_4, sig_44_4, sig_47_4, sig_48_4, sig_50_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_49_5, sig_50_6, sig_50_7, sig_50_8, sig_50_9, sig_50_10, sig_50_11, sig_50_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_54_4, sig_53_4, sig_53_5, sig_53_6, sig_56_5, sig_55_5, sig_56_6, sig_60_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_59_4, sig_60_5, sig_61_5, sig_62_5, sig_66_5, sig_65_5, sig_66_6, sig_66_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_8, sig_66_9, sig_70_6, sig_69_6, sig_71_7, sig_72_7, sig_73_7, sig_74_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_75_6, sig_76_6, sig_75_7, sig_78_7, sig_77_7, sig_79_8, sig_80_8, sig_82_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_81_8, sig_84_9, sig_83_9, sig_86_8, sig_85_8, sig_86_9, sig_88_10, sig_87_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_87_11, sig_89_10, sig_90_10, sig_92_11, sig_91_11, sig_96_12, sig_95_12, sig_97_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_98_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  end generate;
  reg_2_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Q => sig_2_1
  );

  reg_5_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Q => sig_5_1
  );

  reg_12_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Q => sig_12_1
  );

  cmpswp_13_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_10_0,
    MIN => sig_13_1,
    MAX => sig_14_1
  );

  reg_14_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Q => sig_14_2
  );

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_0_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  reg_16_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Q => sig_16_2
  );

  cmpswp_17_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_7_0,
    MIN => sig_17_1,
    MAX => sig_18_1
  );

  cmpswp_19_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_1,
    Y => sig_17_1,
    MIN => sig_19_2,
    MAX => sig_20_2
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_11_0,
    MIN => sig_22_1,
    MAX => sig_21_1
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

  cmpswp_23_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_2,
    Y => sig_20_2,
    MIN => sig_23_3,
    MAX => sig_24_3
  );

  reg_24_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_3,
    Q => sig_24_4
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Y => sig_12_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  reg_26_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Q => sig_26_3
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_1_0,
    MIN => sig_28_1,
    MAX => sig_27_1
  );

  reg_28_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Q => sig_28_2
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

  cmpswp_29_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Y => sig_18_1,
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
    X => sig_5_1,
    Y => sig_15_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  reg_31_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_2,
    Q => sig_31_3
  );

  cmpswp_34_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_3,
    Y => sig_21_3,
    MIN => sig_34_4,
    MAX => sig_33_4
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Y => sig_25_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  cmpswp_37_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Y => sig_27_3,
    MIN => sig_37_4,
    MAX => sig_38_4
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

  cmpswp_40_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
    Y => sig_28_2,
    MIN => sig_40_3,
    MAX => sig_39_3
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_2,
    Y => sig_32_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  cmpswp_43_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Y => sig_41_3,
    MIN => sig_43_4,
    MAX => sig_44_4
  );

  cmpswp_47_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_3,
    Y => sig_31_3,
    MIN => sig_47_4,
    MAX => sig_48_4
  );

  cmpswp_50_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_4,
    Y => sig_37_4,
    MIN => sig_50_5,
    MAX => sig_49_5
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

  reg_50_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_7,
    Q => sig_50_8
  );

  reg_50_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_8,
    Q => sig_50_9
  );

  reg_50_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_9,
    Q => sig_50_10
  );

  reg_50_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_10,
    Q => sig_50_11
  );

  reg_50_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_11,
    Q => sig_50_12
  );

  cmpswp_54_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_3,
    Y => sig_35_3,
    MIN => sig_54_4,
    MAX => sig_53_4
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

  cmpswp_56_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Y => sig_34_4,
    MIN => sig_56_5,
    MAX => sig_55_5
  );

  reg_56_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_5,
    Q => sig_56_6
  );

  cmpswp_60_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Y => sig_42_3,
    MIN => sig_60_4,
    MAX => sig_59_4
  );

  reg_60_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_4,
    Q => sig_60_5
  );

  cmpswp_61_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_4,
    Y => sig_44_4,
    MIN => sig_61_5,
    MAX => sig_62_5
  );

  cmpswp_66_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_4,
    Y => sig_33_4,
    MIN => sig_66_5,
    MAX => sig_65_5
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

  cmpswp_70_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_5,
    Y => sig_61_5,
    MIN => sig_70_6,
    MAX => sig_69_6
  );

  cmpswp_71_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Y => sig_38_6,
    MIN => sig_71_7,
    MAX => sig_72_7
  );

  cmpswp_73_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_6,
    Y => sig_70_6,
    MIN => sig_73_7,
    MAX => sig_74_7
  );

  cmpswp_75_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_5,
    Y => sig_60_5,
    MIN => sig_75_6,
    MAX => sig_76_6
  );

  reg_75_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_6,
    Q => sig_75_7
  );

  cmpswp_78_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_6,
    Y => sig_56_6,
    MIN => sig_78_7,
    MAX => sig_77_7
  );

  cmpswp_79_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_7,
    Y => sig_75_7,
    MIN => sig_79_8,
    MAX => sig_80_8
  );

  cmpswp_82_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_7,
    Y => sig_71_7,
    MIN => sig_82_8,
    MAX => sig_81_8
  );

  cmpswp_84_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_8,
    Y => sig_80_8,
    MIN => sig_84_9,
    MAX => sig_83_9
  );

  cmpswp_86_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_7,
    Y => sig_77_7,
    MIN => sig_86_8,
    MAX => sig_85_8
  );

  reg_86_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_8,
    Q => sig_86_9
  );

  cmpswp_88_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_9,
    Y => sig_66_9,
    MIN => sig_88_10,
    MAX => sig_87_10
  );

  reg_87_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_10,
    Q => sig_87_11
  );

  cmpswp_89_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_9,
    Y => sig_83_9,
    MIN => sig_89_10,
    MAX => sig_90_10
  );

  cmpswp_92_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_10,
    Y => sig_89_10,
    MIN => sig_92_11,
    MAX => sig_91_11
  );

  cmpswp_96_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_11,
    Y => sig_91_11,
    MIN => sig_96_12,
    MAX => sig_95_12
  );

  cmpswp_97_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_12,
    Y => sig_50_12,
    MIN => sig_97_13,
    MAX => sig_98_13
  );

  sig_out_med <= sig_98_13;
end generated;
