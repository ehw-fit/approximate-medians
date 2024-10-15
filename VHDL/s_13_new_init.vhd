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
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_1, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_12_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_1, sig_14_1, sig_13_2, sig_13_3, sig_13_4, sig_13_5, sig_14_2, sig_14_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_4, sig_14_5, sig_15_1, sig_16_1, sig_15_2, sig_17_2, sig_18_2, sig_18_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_3, sig_20_3, sig_19_4, sig_20_4, sig_21_1, sig_22_1, sig_21_2, sig_23_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_24_2, sig_25_3, sig_26_3, sig_27_1, sig_28_1, sig_27_2, sig_29_2, sig_30_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_31_3, sig_32_3, sig_34_1, sig_33_1, sig_34_2, sig_34_3, sig_34_4, sig_34_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_6, sig_33_2, sig_33_3, sig_33_4, sig_33_5, sig_33_6, sig_33_7, sig_33_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_4, sig_36_4, sig_35_5, sig_37_5, sig_38_5, sig_38_6, sig_38_7, sig_39_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_6, sig_40_7, sig_41_4, sig_42_4, sig_41_5, sig_43_5, sig_44_5, sig_45_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_6, sig_47_3, sig_48_3, sig_47_4, sig_49_4, sig_50_4, sig_51_5, sig_52_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_6, sig_51_7, sig_51_8, sig_51_9, sig_56_7, sig_55_7, sig_57_6, sig_58_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_61_6, sig_62_6, sig_63_7, sig_64_7, sig_67_8, sig_68_8, sig_69_7, sig_70_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_69_8, sig_70_8, sig_71_8, sig_72_8, sig_73_9, sig_74_9, sig_73_10, sig_75_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_76_10, sig_77_9, sig_78_9, sig_77_10, sig_77_11, sig_79_11, sig_80_11, sig_81_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_12, sig_83_9, sig_84_9, sig_83_10, sig_83_11, sig_83_12, sig_84_10, sig_84_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_85_12, sig_86_12, sig_88_10, sig_87_10, sig_87_11, sig_87_12, sig_89_13, sig_90_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_91_13, sig_92_13, sig_94_14, sig_93_14, sig_95_14, sig_96_14, sig_97_15, sig_98_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_6_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Q => sig_6_1
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
    X => sig_0_0,
    Y => sig_8_0,
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

  reg_14_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_4,
    Q => sig_14_5
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
    X => sig_10_0,
    Y => sig_5_0,
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
    X => sig_12_1,
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
    Y => sig_1_0,
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
    X => sig_6_1,
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

  cmpswp_34_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_7_0,
    MIN => sig_34_1,
    MAX => sig_33_1
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

  cmpswp_35_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Y => sig_25_3,
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

  cmpswp_56_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Y => sig_34_6,
    MIN => sig_56_7,
    MAX => sig_55_7
  );

  cmpswp_57_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_5,
    Y => sig_44_5,
    MIN => sig_57_6,
    MAX => sig_58_6
  );

  cmpswp_61_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_5,
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

  cmpswp_67_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_7,
    Y => sig_40_7,
    MIN => sig_67_8,
    MAX => sig_68_8
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

  cmpswp_79_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_75_10,
    Y => sig_73_10,
    MIN => sig_79_11,
    MAX => sig_80_11
  );

  cmpswp_81_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_11,
    Y => sig_79_11,
    MIN => sig_81_12,
    MAX => sig_82_12
  );

  cmpswp_83_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_8,
    Y => sig_68_8,
    MIN => sig_83_9,
    MAX => sig_84_9
  );

  reg_83_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_9,
    Q => sig_83_10
  );

  reg_83_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_10,
    Q => sig_83_11
  );

  reg_83_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_11,
    Q => sig_83_12
  );

  reg_84_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_9,
    Q => sig_84_10
  );

  reg_84_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_10,
    Q => sig_84_11
  );

  cmpswp_85_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_11,
    Y => sig_84_11,
    MIN => sig_85_12,
    MAX => sig_86_12
  );

  cmpswp_88_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_9,
    Y => sig_78_9,
    MIN => sig_88_10,
    MAX => sig_87_10
  );

  reg_87_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_10,
    Q => sig_87_11
  );

  reg_87_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_11,
    Q => sig_87_12
  );

  cmpswp_89_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_12,
    Y => sig_82_12,
    MIN => sig_89_13,
    MAX => sig_90_13
  );

  cmpswp_91_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_12,
    Y => sig_83_12,
    MIN => sig_91_13,
    MAX => sig_92_13
  );

  cmpswp_94_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_13,
    Y => sig_91_13,
    MIN => sig_94_14,
    MAX => sig_93_14
  );

  cmpswp_95_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_13,
    Y => sig_92_13,
    MIN => sig_95_14,
    MAX => sig_96_14
  );

  cmpswp_97_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_14,
    Y => sig_93_14,
    MIN => sig_97_15,
    MAX => sig_98_15
  );

  sig_out_med <= sig_98_15;
end generated;
