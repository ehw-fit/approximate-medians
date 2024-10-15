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
  signal sig_6_0, sig_7_0, sig_8_0, sig_8_1, sig_9_0, sig_10_0, sig_11_0, sig_12_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_1, sig_14_1, sig_13_2, sig_13_3, sig_13_4, sig_13_5, sig_14_2, sig_14_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_4, sig_15_1, sig_16_1, sig_15_2, sig_17_2, sig_18_2, sig_18_3, sig_19_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_20_3, sig_19_4, sig_20_4, sig_21_1, sig_22_1, sig_21_2, sig_23_2, sig_24_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_3, sig_26_3, sig_27_1, sig_28_1, sig_27_2, sig_29_2, sig_30_2, sig_31_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_32_3, sig_33_1, sig_34_1, sig_33_2, sig_33_3, sig_33_4, sig_33_5, sig_33_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_2, sig_34_3, sig_34_4, sig_34_5, sig_34_6, sig_35_4, sig_36_4, sig_35_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_37_5, sig_38_5, sig_38_6, sig_38_7, sig_39_6, sig_40_6, sig_40_7, sig_41_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_42_4, sig_41_5, sig_43_5, sig_44_5, sig_45_6, sig_46_6, sig_47_3, sig_48_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_4, sig_49_4, sig_50_4, sig_51_5, sig_52_5, sig_51_6, sig_51_7, sig_51_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_9, sig_53_7, sig_54_7, sig_55_7, sig_56_7, sig_55_8, sig_56_8, sig_56_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_56_10, sig_56_11, sig_56_12, sig_56_13, sig_56_14, sig_57_6, sig_58_6, sig_59_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_5, sig_61_6, sig_62_6, sig_63_7, sig_64_7, sig_65_8, sig_66_8, sig_67_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_68_9, sig_68_10, sig_68_11, sig_68_12, sig_69_7, sig_70_7, sig_69_8, sig_70_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_71_8, sig_72_8, sig_73_9, sig_74_9, sig_73_10, sig_75_10, sig_76_10, sig_77_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_9, sig_77_10, sig_77_11, sig_78_10, sig_78_11, sig_78_12, sig_78_13, sig_78_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_79_11, sig_80_11, sig_80_12, sig_80_13, sig_81_12, sig_82_12, sig_82_13, sig_82_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_15, sig_83_13, sig_84_13, sig_85_14, sig_86_14, sig_87_15, sig_88_15, sig_89_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_90_16, sig_91_15, sig_92_15, sig_91_16, sig_92_16, sig_93_17, sig_94_17, sig_95_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_96_17, sig_97_18, sig_98_18 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_8_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Q => sig_8_1
  );

  cmpswp_13_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_1_0,
    MIN => sig_13_1,
    MAX => sig_14_1
  );

  reg_13_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Q => sig_13_2
  );

  reg_13_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_2,
    Q => sig_13_3
  );

  reg_13_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_3,
    Q => sig_13_4
  );

  reg_13_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_4,
    Q => sig_13_5
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

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_4_0,
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
    X => sig_2_1,
    Y => sig_16_1,
    MIN => sig_17_2,
    MAX => sig_18_2
  );

  reg_18_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_2,
    Q => sig_18_3
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

  reg_20_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_3,
    Q => sig_20_4
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_7_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  reg_21_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Q => sig_21_2
  );

  cmpswp_23_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_1,
    Y => sig_22_1,
    MIN => sig_23_2,
    MAX => sig_24_2
  );

  cmpswp_25_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_21_2,
    MIN => sig_25_3,
    MAX => sig_26_3
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_10_0,
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
    X => sig_8_1,
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
    X => sig_11_0,
    Y => sig_12_0,
    MIN => sig_33_1,
    MAX => sig_34_1
  );

  reg_33_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_1,
    Q => sig_33_2
  );

  reg_33_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_2,
    Q => sig_33_3
  );

  reg_33_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_3,
    Q => sig_33_4
  );

  reg_33_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_4,
    Q => sig_33_5
  );

  reg_33_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_5,
    Q => sig_33_6
  );

  reg_34_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_1,
    Q => sig_34_2
  );

  reg_34_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_2,
    Q => sig_34_3
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

  reg_34_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_5,
    Q => sig_34_6
  );

  cmpswp_35_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Y => sig_31_3,
    MIN => sig_35_4,
    MAX => sig_36_4
  );

  reg_35_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_4,
    Q => sig_35_5
  );

  cmpswp_37_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_4,
    Y => sig_36_4,
    MIN => sig_37_5,
    MAX => sig_38_5
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

  cmpswp_39_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_5,
    Y => sig_35_5,
    MIN => sig_39_6,
    MAX => sig_40_6
  );

  reg_40_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_6,
    Q => sig_40_7
  );

  cmpswp_41_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Y => sig_32_3,
    MIN => sig_41_4,
    MAX => sig_42_4
  );

  reg_41_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_4,
    Q => sig_41_5
  );

  cmpswp_43_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_4,
    Y => sig_42_4,
    MIN => sig_43_5,
    MAX => sig_44_5
  );

  cmpswp_45_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_5,
    Y => sig_41_5,
    MIN => sig_45_6,
    MAX => sig_46_6
  );

  cmpswp_47_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_2,
    Y => sig_30_2,
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
    X => sig_18_3,
    Y => sig_48_3,
    MIN => sig_49_4,
    MAX => sig_50_4
  );

  cmpswp_51_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_4,
    Y => sig_47_4,
    MIN => sig_51_5,
    MAX => sig_52_5
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

  reg_51_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_8,
    Q => sig_51_9
  );

  cmpswp_53_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_6,
    Y => sig_33_6,
    MIN => sig_53_7,
    MAX => sig_54_7
  );

  cmpswp_55_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Y => sig_34_6,
    MIN => sig_55_7,
    MAX => sig_56_7
  );

  reg_55_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_7,
    Q => sig_55_8
  );

  reg_56_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_7,
    Q => sig_56_8
  );

  reg_56_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_8,
    Q => sig_56_9
  );

  reg_56_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_9,
    Q => sig_56_10
  );

  reg_56_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_10,
    Q => sig_56_11
  );

  reg_56_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_11,
    Q => sig_56_12
  );

  reg_56_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_12,
    Q => sig_56_13
  );

  reg_56_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_13,
    Q => sig_56_14
  );

  cmpswp_57_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_5,
    Y => sig_44_5,
    MIN => sig_57_6,
    MAX => sig_58_6
  );

  cmpswp_59_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_4,
    Y => sig_50_4,
    MIN => sig_59_5,
    MAX => sig_60_5
  );

  cmpswp_61_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_5,
    Y => sig_52_5,
    MIN => sig_61_6,
    MAX => sig_62_6
  );

  cmpswp_63_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_6,
    Y => sig_58_6,
    MIN => sig_63_7,
    MAX => sig_64_7
  );

  cmpswp_65_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_7,
    Y => sig_54_7,
    MIN => sig_65_8,
    MAX => sig_66_8
  );

  cmpswp_67_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_8,
    Y => sig_66_8,
    MIN => sig_67_9,
    MAX => sig_68_9
  );

  reg_68_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_9,
    Q => sig_68_10
  );

  reg_68_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_10,
    Q => sig_68_11
  );

  reg_68_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_11,
    Q => sig_68_12
  );

  cmpswp_69_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_6,
    Y => sig_46_6,
    MIN => sig_69_7,
    MAX => sig_70_7
  );

  reg_69_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_7,
    Q => sig_69_8
  );

  reg_70_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_7,
    Q => sig_70_8
  );

  cmpswp_71_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_7,
    Y => sig_38_7,
    MIN => sig_71_8,
    MAX => sig_72_8
  );

  cmpswp_73_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_8,
    Y => sig_72_8,
    MIN => sig_73_9,
    MAX => sig_74_9
  );

  reg_73_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_9,
    Q => sig_73_10
  );

  cmpswp_75_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_9,
    Y => sig_74_9,
    MIN => sig_75_10,
    MAX => sig_76_10
  );

  cmpswp_77_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_8,
    Y => sig_71_8,
    MIN => sig_77_9,
    MAX => sig_78_9
  );

  reg_77_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_9,
    Q => sig_77_10
  );

  reg_77_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_10,
    Q => sig_77_11
  );

  reg_78_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_9,
    Q => sig_78_10
  );

  reg_78_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_10,
    Q => sig_78_11
  );

  reg_78_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_11,
    Q => sig_78_12
  );

  reg_78_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_12,
    Q => sig_78_13
  );

  reg_78_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_13,
    Q => sig_78_14
  );

  cmpswp_79_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_10,
    Y => sig_73_10,
    MIN => sig_79_11,
    MAX => sig_80_11
  );

  reg_80_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_11,
    Q => sig_80_12
  );

  reg_80_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_12,
    Q => sig_80_13
  );

  cmpswp_81_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_11,
    Y => sig_79_11,
    MIN => sig_81_12,
    MAX => sig_82_12
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

  cmpswp_83_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_12,
    Y => sig_68_12,
    MIN => sig_83_13,
    MAX => sig_84_13
  );

  cmpswp_85_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_13,
    Y => sig_84_13,
    MIN => sig_85_14,
    MAX => sig_86_14
  );

  cmpswp_87_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_14,
    Y => sig_86_14,
    MIN => sig_87_15,
    MAX => sig_88_15
  );

  cmpswp_89_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_15,
    Y => sig_82_15,
    MIN => sig_89_16,
    MAX => sig_90_16
  );

  cmpswp_91_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_14,
    Y => sig_56_14,
    MIN => sig_91_15,
    MAX => sig_92_15
  );

  reg_91_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_15,
    Q => sig_91_16
  );

  reg_92_15: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_15,
    Q => sig_92_16
  );

  cmpswp_93_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_16,
    Y => sig_91_16,
    MIN => sig_93_17,
    MAX => sig_94_17
  );

  cmpswp_95_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_16,
    Y => sig_92_16,
    MIN => sig_95_17,
    MAX => sig_96_17
  );

  cmpswp_97_18: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_17,
    Y => sig_94_17,
    MIN => sig_97_18,
    MAX => sig_98_18
  );

  sig_out_med <= sig_98_18;
end generated;
