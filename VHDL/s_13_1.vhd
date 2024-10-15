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
  signal sig_5_2, sig_5_3, sig_5_4, sig_6_0, sig_7_0, sig_7_1, sig_7_2, sig_7_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_1, sig_14_1, sig_14_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_1, sig_16_1, sig_15_2, sig_18_2, sig_17_2, sig_17_3, sig_19_3, sig_20_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_1, sig_21_1, sig_23_1, sig_24_1, sig_25_2, sig_26_2, sig_25_3, sig_26_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_26_4, sig_27_1, sig_28_1, sig_27_2, sig_29_2, sig_30_2, sig_31_3, sig_32_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_4, sig_33_4, sig_34_5, sig_33_5, sig_33_6, sig_33_7, sig_33_8, sig_33_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_4, sig_36_4, sig_37_5, sig_38_5, sig_39_6, sig_40_6, sig_41_4, sig_42_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_5, sig_44_5, sig_43_5, sig_45_6, sig_46_6, sig_47_3, sig_48_3, sig_47_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_50_4, sig_49_4, sig_51_5, sig_52_5, sig_51_6, sig_52_6, sig_54_6, sig_53_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_56_6, sig_55_6, sig_57_2, sig_58_2, sig_57_3, sig_57_4, sig_57_5, sig_57_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_58_3, sig_58_4, sig_58_5, sig_58_6, sig_58_7, sig_64_7, sig_63_7, sig_63_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_65_7, sig_66_7, sig_69_7, sig_70_7, sig_71_7, sig_72_7, sig_73_8, sig_74_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_75_8, sig_76_8, sig_75_9, sig_77_8, sig_78_8, sig_78_9, sig_80_9, sig_79_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_83_9, sig_84_9, sig_85_10, sig_86_10, sig_88_10, sig_87_10, sig_90_11, sig_89_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_91_10, sig_92_10, sig_91_11, sig_92_11, sig_93_12, sig_94_12, sig_96_12, sig_95_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_98_13, sig_97_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_5_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_1,
    Q => sig_5_2
  );

  reg_5_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_2,
    Q => sig_5_3
  );

  reg_5_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_3,
    Q => sig_5_4
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

  reg_7_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_2,
    Q => sig_7_3
  );

  cmpswp_13_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_9_0,
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
    X => sig_3_0,
    Y => sig_1_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  reg_15_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Q => sig_15_2
  );

  cmpswp_18_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Y => sig_2_1,
    MIN => sig_18_2,
    MAX => sig_17_2
  );

  reg_17_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_2,
    Q => sig_17_3
  );

  cmpswp_19_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_2,
    Y => sig_18_2,
    MIN => sig_19_3,
    MAX => sig_20_3
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_11_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_12_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Y => sig_13_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  reg_25_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Q => sig_25_3
  );

  reg_26_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Q => sig_26_3
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
    Y => sig_0_0,
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
    X => sig_22_1,
    Y => sig_28_1,
    MIN => sig_29_2,
    MAX => sig_30_2
  );

  cmpswp_31_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_2,
    Y => sig_29_2,
    MIN => sig_31_3,
    MAX => sig_32_3
  );

  cmpswp_34_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_3,
    Y => sig_7_3,
    MIN => sig_34_4,
    MAX => sig_33_4
  );

  reg_34_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_4,
    Q => sig_34_5
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

  reg_33_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_6,
    Q => sig_33_7
  );

  reg_33_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_7,
    Q => sig_33_8
  );

  reg_33_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_8,
    Q => sig_33_9
  );

  cmpswp_35_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Y => sig_31_3,
    MIN => sig_35_4,
    MAX => sig_36_4
  );

  cmpswp_37_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_4,
    Y => sig_5_4,
    MIN => sig_37_5,
    MAX => sig_38_5
  );

  cmpswp_39_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_5,
    Y => sig_38_5,
    MIN => sig_39_6,
    MAX => sig_40_6
  );

  cmpswp_41_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_20_3,
    MIN => sig_41_4,
    MAX => sig_42_4
  );

  reg_41_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_4,
    Q => sig_41_5
  );

  cmpswp_44_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_4,
    Y => sig_42_4,
    MIN => sig_44_5,
    MAX => sig_43_5
  );

  cmpswp_45_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_5,
    Y => sig_44_5,
    MIN => sig_45_6,
    MAX => sig_46_6
  );

  cmpswp_47_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_2,
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

  cmpswp_50_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_3,
    Y => sig_48_3,
    MIN => sig_50_4,
    MAX => sig_49_4
  );

  cmpswp_51_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_4,
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

  reg_52_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_5,
    Q => sig_52_6
  );

  cmpswp_54_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_5,
    Y => sig_37_5,
    MIN => sig_54_6,
    MAX => sig_53_6
  );

  cmpswp_56_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_5,
    Y => sig_37_5,
    MIN => sig_56_6,
    MAX => sig_55_6
  );

  cmpswp_57_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Y => sig_21_1,
    MIN => sig_57_2,
    MAX => sig_58_2
  );

  reg_57_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_2,
    Q => sig_57_3
  );

  reg_57_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_3,
    Q => sig_57_4
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

  reg_58_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_2,
    Q => sig_58_3
  );

  reg_58_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_3,
    Q => sig_58_4
  );

  reg_58_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_4,
    Q => sig_58_5
  );

  reg_58_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_5,
    Q => sig_58_6
  );

  reg_58_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_6,
    Q => sig_58_7
  );

  cmpswp_64_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_6,
    Y => sig_45_6,
    MIN => sig_64_7,
    MAX => sig_63_7
  );

  reg_63_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_7,
    Q => sig_63_8
  );

  cmpswp_65_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_6,
    Y => sig_55_6,
    MIN => sig_65_7,
    MAX => sig_66_7
  );

  cmpswp_69_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_6,
    Y => sig_46_6,
    MIN => sig_69_7,
    MAX => sig_70_7
  );

  cmpswp_71_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_6,
    Y => sig_40_6,
    MIN => sig_71_7,
    MAX => sig_72_7
  );

  cmpswp_73_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_7,
    Y => sig_72_7,
    MIN => sig_73_8,
    MAX => sig_74_8
  );

  cmpswp_75_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_7,
    Y => sig_58_7,
    MIN => sig_75_8,
    MAX => sig_76_8
  );

  reg_75_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_8,
    Q => sig_75_9
  );

  cmpswp_77_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_7,
    Y => sig_71_7,
    MIN => sig_77_8,
    MAX => sig_78_8
  );

  reg_78_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_8,
    Q => sig_78_9
  );

  cmpswp_80_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_8,
    Y => sig_73_8,
    MIN => sig_80_9,
    MAX => sig_79_9
  );

  cmpswp_83_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_8,
    Y => sig_63_8,
    MIN => sig_83_9,
    MAX => sig_84_9
  );

  cmpswp_85_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_9,
    Y => sig_33_9,
    MIN => sig_85_10,
    MAX => sig_86_10
  );

  cmpswp_88_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_9,
    Y => sig_79_9,
    MIN => sig_88_10,
    MAX => sig_87_10
  );

  cmpswp_90_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_88_10,
    Y => sig_85_10,
    MIN => sig_90_11,
    MAX => sig_89_11
  );

  cmpswp_91_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_9,
    Y => sig_78_9,
    MIN => sig_91_10,
    MAX => sig_92_10
  );

  reg_91_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_10,
    Q => sig_91_11
  );

  reg_92_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_10,
    Q => sig_92_11
  );

  cmpswp_93_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_11,
    Y => sig_91_11,
    MIN => sig_93_12,
    MAX => sig_94_12
  );

  cmpswp_96_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_11,
    Y => sig_90_11,
    MIN => sig_96_12,
    MAX => sig_95_12
  );

  cmpswp_98_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_12,
    Y => sig_94_12,
    MIN => sig_98_13,
    MAX => sig_97_13
  );

  sig_out_med <= sig_98_13;
end generated;
