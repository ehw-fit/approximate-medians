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
  signal sig_15_1, sig_16_1, sig_16_2, sig_19_1, sig_20_1, sig_19_2, sig_19_3, sig_24_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_1, sig_25_2, sig_26_2, sig_26_3, sig_28_2, sig_27_2, sig_30_1, sig_29_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_2, sig_30_3, sig_31_2, sig_32_2, sig_31_3, sig_31_4, sig_32_3, sig_34_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_1, sig_36_2, sig_35_2, sig_39_3, sig_40_3, sig_42_3, sig_41_3, sig_44_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_43_4, sig_45_4, sig_46_4, sig_45_5, sig_45_6, sig_46_5, sig_47_2, sig_48_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_3, sig_47_4, sig_48_3, sig_48_4, sig_52_3, sig_51_3, sig_52_4, sig_54_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_53_5, sig_54_6, sig_55_4, sig_56_4, sig_58_4, sig_57_4, sig_59_5, sig_60_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_61_6, sig_62_6, sig_64_5, sig_63_5, sig_63_6, sig_63_7, sig_70_5, sig_69_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_71_6, sig_72_6, sig_73_7, sig_74_7, sig_73_8, sig_74_8, sig_78_6, sig_77_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_7, sig_78_8, sig_78_9, sig_79_7, sig_80_7, sig_84_8, sig_83_8, sig_85_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_9, sig_85_10, sig_90_9, sig_89_9, sig_93_10, sig_94_10, sig_94_11, sig_96_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_11, sig_97_12, sig_98_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
    X => sig_6_0,
    Y => sig_3_0,
    MIN => sig_14_1,
    MAX => sig_13_1
  );

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_10_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  reg_16_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Q => sig_16_2
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_2_0,
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

  cmpswp_24_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_7_0,
    MIN => sig_24_1,
    MAX => sig_23_1
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_23_1,
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
    X => sig_15_1,
    Y => sig_1_1,
    MIN => sig_28_2,
    MAX => sig_27_2
  );

  cmpswp_30_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_5_0,
    MIN => sig_30_1,
    MAX => sig_29_1
  );

  reg_30_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_1,
    Q => sig_30_2
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
    X => sig_13_1,
    Y => sig_29_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  reg_31_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_2,
    Q => sig_31_3
  );

  reg_31_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Q => sig_31_4
  );

  reg_32_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Q => sig_32_3
  );

  cmpswp_34_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_4_0,
    MIN => sig_34_1,
    MAX => sig_33_1
  );

  cmpswp_36_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_1,
    Y => sig_24_1,
    MIN => sig_36_2,
    MAX => sig_35_2
  );

  cmpswp_39_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_2,
    Y => sig_16_2,
    MIN => sig_39_3,
    MAX => sig_40_3
  );

  cmpswp_42_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_2,
    Y => sig_28_2,
    MIN => sig_42_3,
    MAX => sig_41_3
  );

  cmpswp_44_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Y => sig_40_3,
    MIN => sig_44_4,
    MAX => sig_43_4
  );

  cmpswp_45_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_3,
    Y => sig_39_3,
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

  reg_46_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Q => sig_46_5
  );

  cmpswp_47_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_1,
    Y => sig_14_1,
    MIN => sig_47_2,
    MAX => sig_48_2
  );

  reg_47_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_2,
    Q => sig_47_3
  );

  reg_47_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Q => sig_47_4
  );

  reg_48_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_2,
    Q => sig_48_3
  );

  reg_48_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_3,
    Q => sig_48_4
  );

  cmpswp_52_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_2,
    Y => sig_25_2,
    MIN => sig_52_3,
    MAX => sig_51_3
  );

  reg_52_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_3,
    Q => sig_52_4
  );

  cmpswp_54_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_4,
    Y => sig_44_4,
    MIN => sig_54_5,
    MAX => sig_53_5
  );

  reg_54_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_5,
    Q => sig_54_6
  );

  cmpswp_55_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Y => sig_30_3,
    MIN => sig_55_4,
    MAX => sig_56_4
  );

  cmpswp_58_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_51_3,
    MIN => sig_58_4,
    MAX => sig_57_4
  );

  cmpswp_59_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_4,
    Y => sig_48_4,
    MIN => sig_59_5,
    MAX => sig_60_5
  );

  cmpswp_61_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_5,
    Y => sig_46_5,
    MIN => sig_61_6,
    MAX => sig_62_6
  );

  cmpswp_64_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Y => sig_52_4,
    MIN => sig_64_5,
    MAX => sig_63_5
  );

  reg_63_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_5,
    Q => sig_63_6
  );

  reg_63_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_6,
    Q => sig_63_7
  );

  cmpswp_70_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_4,
    Y => sig_55_4,
    MIN => sig_70_5,
    MAX => sig_69_5
  );

  cmpswp_71_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_5,
    Y => sig_69_5,
    MIN => sig_71_6,
    MAX => sig_72_6
  );

  cmpswp_73_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_6,
    Y => sig_54_6,
    MIN => sig_73_7,
    MAX => sig_74_7
  );

  reg_73_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_7,
    Q => sig_73_8
  );

  reg_74_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_7,
    Q => sig_74_8
  );

  cmpswp_78_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_5,
    Y => sig_53_5,
    MIN => sig_78_6,
    MAX => sig_77_6
  );

  reg_78_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_6,
    Q => sig_78_7
  );

  reg_78_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_7,
    Q => sig_78_8
  );

  reg_78_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_8,
    Q => sig_78_9
  );

  cmpswp_79_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Y => sig_72_6,
    MIN => sig_79_7,
    MAX => sig_80_7
  );

  cmpswp_84_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_7,
    Y => sig_63_7,
    MIN => sig_84_8,
    MAX => sig_83_8
  );

  cmpswp_85_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_8,
    Y => sig_83_8,
    MIN => sig_85_9,
    MAX => sig_86_9
  );

  reg_85_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_9,
    Q => sig_85_10
  );

  cmpswp_90_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_8,
    Y => sig_84_8,
    MIN => sig_90_9,
    MAX => sig_89_9
  );

  cmpswp_93_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_9,
    Y => sig_89_9,
    MIN => sig_93_10,
    MAX => sig_94_10
  );

  reg_94_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_10,
    Q => sig_94_11
  );

  cmpswp_96_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_10,
    Y => sig_85_10,
    MIN => sig_96_11,
    MAX => sig_95_11
  );

  cmpswp_97_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_11,
    Y => sig_95_11,
    MIN => sig_97_12,
    MAX => sig_98_12
  );

  sig_out_med <= sig_97_12;
end generated;
