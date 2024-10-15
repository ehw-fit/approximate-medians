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
  signal sig_0_0, sig_1_0, sig_1_1, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_14_1, sig_13_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_1, sig_16_1, sig_17_2, sig_18_2, sig_21_1, sig_22_1, sig_24_1, sig_23_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_2, sig_26_2, sig_25_2, sig_26_3, sig_27_1, sig_28_1, sig_30_1, sig_29_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_2, sig_29_2, sig_31_2, sig_32_2, sig_34_2, sig_33_2, sig_35_3, sig_36_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_36_4, sig_38_3, sig_37_3, sig_40_4, sig_39_4, sig_42_3, sig_41_3, sig_42_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_4, sig_43_3, sig_44_3, sig_46_2, sig_45_2, sig_47_3, sig_48_3, sig_49_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_50_4, sig_54_4, sig_53_4, sig_53_5, sig_55_3, sig_56_3, sig_56_4, sig_59_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_5, sig_63_6, sig_64_6, sig_63_7, sig_66_5, sig_65_5, sig_67_4, sig_68_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_67_5, sig_70_6, sig_69_6, sig_71_5, sig_72_5, sig_72_6, sig_73_7, sig_74_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_75_5, sig_76_5, sig_75_6, sig_75_7, sig_78_7, sig_77_7, sig_82_8, sig_81_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_83_8, sig_84_8, sig_89_5, sig_90_5, sig_89_6, sig_89_7, sig_89_8, sig_89_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_90_6, sig_90_7, sig_90_8, sig_90_9, sig_91_9, sig_92_9, sig_94_10, sig_93_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_10, sig_96_10, sig_98_11, sig_97_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_1_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Q => sig_1_1
  );

  cmpswp_14_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_8_0,
    MIN => sig_14_1,
    MAX => sig_13_1
  );

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_5_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  cmpswp_17_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_15_1,
    MIN => sig_17_2,
    MAX => sig_18_2
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_9_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  cmpswp_24_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_10_0,
    MIN => sig_24_1,
    MAX => sig_23_1
  );

  reg_23_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Q => sig_23_2
  );

  cmpswp_26_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_1,
    Y => sig_24_1,
    MIN => sig_26_2,
    MAX => sig_25_2
  );

  reg_26_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Q => sig_26_3
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_7_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  cmpswp_30_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_11_0,
    MIN => sig_30_1,
    MAX => sig_29_1
  );

  reg_30_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_1,
    Q => sig_30_2
  );

  reg_29_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Q => sig_29_2
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Y => sig_22_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  cmpswp_34_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_1,
    Y => sig_21_1,
    MIN => sig_34_2,
    MAX => sig_33_2
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Y => sig_29_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  reg_36_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Q => sig_36_4
  );

  cmpswp_38_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_2,
    Y => sig_33_2,
    MIN => sig_38_3,
    MAX => sig_37_3
  );

  cmpswp_40_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_3,
    Y => sig_38_3,
    MIN => sig_40_4,
    MAX => sig_39_4
  );

  cmpswp_42_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Y => sig_30_2,
    MIN => sig_42_3,
    MAX => sig_41_3
  );

  reg_42_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Q => sig_42_4
  );

  reg_41_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Q => sig_41_4
  );

  cmpswp_43_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_2,
    Y => sig_17_2,
    MIN => sig_43_3,
    MAX => sig_44_3
  );

  cmpswp_46_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Y => sig_16_1,
    MIN => sig_46_2,
    MAX => sig_45_2
  );

  cmpswp_47_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_2,
    Y => sig_23_2,
    MIN => sig_47_3,
    MAX => sig_48_3
  );

  cmpswp_49_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Y => sig_37_3,
    MIN => sig_49_4,
    MAX => sig_50_4
  );

  cmpswp_54_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_3,
    Y => sig_26_3,
    MIN => sig_54_4,
    MAX => sig_53_4
  );

  reg_53_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_4,
    Q => sig_53_5
  );

  cmpswp_55_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_2,
    Y => sig_31_2,
    MIN => sig_55_3,
    MAX => sig_56_3
  );

  reg_56_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_3,
    Q => sig_56_4
  );

  cmpswp_59_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Y => sig_39_4,
    MIN => sig_59_5,
    MAX => sig_60_5
  );

  cmpswp_63_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_5,
    Y => sig_59_5,
    MIN => sig_63_6,
    MAX => sig_64_6
  );

  reg_63_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_6,
    Q => sig_63_7
  );

  cmpswp_66_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_4,
    Y => sig_50_4,
    MIN => sig_66_5,
    MAX => sig_65_5
  );

  cmpswp_67_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_3,
    Y => sig_48_3,
    MIN => sig_67_4,
    MAX => sig_68_4
  );

  reg_67_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_4,
    Q => sig_67_5
  );

  cmpswp_70_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_5,
    Y => sig_67_5,
    MIN => sig_70_6,
    MAX => sig_69_6
  );

  cmpswp_71_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_4,
    Y => sig_54_4,
    MIN => sig_71_5,
    MAX => sig_72_5
  );

  reg_72_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_5,
    Q => sig_72_6
  );

  cmpswp_73_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Y => sig_64_6,
    MIN => sig_73_7,
    MAX => sig_74_7
  );

  cmpswp_75_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_4,
    Y => sig_68_4,
    MIN => sig_75_5,
    MAX => sig_76_5
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

  cmpswp_78_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_6,
    Y => sig_72_6,
    MIN => sig_78_7,
    MAX => sig_77_7
  );

  cmpswp_82_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_7,
    Y => sig_77_7,
    MIN => sig_82_8,
    MAX => sig_81_8
  );

  cmpswp_83_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_7,
    Y => sig_75_7,
    MIN => sig_83_8,
    MAX => sig_84_8
  );

  cmpswp_89_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_4,
    Y => sig_42_4,
    MIN => sig_89_5,
    MAX => sig_90_5
  );

  reg_89_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_5,
    Q => sig_89_6
  );

  reg_89_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_6,
    Q => sig_89_7
  );

  reg_89_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_7,
    Q => sig_89_8
  );

  reg_89_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_8,
    Q => sig_89_9
  );

  reg_90_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_5,
    Q => sig_90_6
  );

  reg_90_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_6,
    Q => sig_90_7
  );

  reg_90_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_7,
    Q => sig_90_8
  );

  reg_90_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_8,
    Q => sig_90_9
  );

  cmpswp_91_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_8,
    Y => sig_83_8,
    MIN => sig_91_9,
    MAX => sig_92_9
  );

  cmpswp_94_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_9,
    Y => sig_91_9,
    MIN => sig_94_10,
    MAX => sig_93_10
  );

  cmpswp_95_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_9,
    Y => sig_92_9,
    MIN => sig_95_10,
    MAX => sig_96_10
  );

  cmpswp_98_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_10,
    Y => sig_93_10,
    MIN => sig_98_11,
    MAX => sig_97_11
  );

  sig_out_med <= sig_97_11;
end generated;
