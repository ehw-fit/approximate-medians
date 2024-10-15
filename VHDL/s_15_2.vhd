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
  signal sig_0_0, sig_0_1, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_1, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_0, sig_14_1, sig_16_1, sig_15_1, sig_20_1, sig_19_1, sig_19_2, sig_19_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_4, sig_19_5, sig_21_2, sig_22_2, sig_23_1, sig_24_1, sig_23_2, sig_24_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_24_3, sig_24_4, sig_24_5, sig_25_3, sig_26_3, sig_25_4, sig_26_4, sig_27_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_28_1, sig_27_2, sig_29_2, sig_30_2, sig_30_3, sig_31_3, sig_32_3, sig_34_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_1, sig_33_2, sig_35_2, sig_36_2, sig_36_3, sig_36_4, sig_37_3, sig_38_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_1, sig_40_1, sig_39_2, sig_39_3, sig_40_2, sig_41_3, sig_42_3, sig_43_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_4, sig_43_5, sig_43_6, sig_45_4, sig_46_4, sig_47_5, sig_48_5, sig_48_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_7, sig_48_8, sig_48_9, sig_52_4, sig_51_4, sig_51_5, sig_51_6, sig_53_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_54_5, sig_56_6, sig_55_6, sig_58_4, sig_57_4, sig_59_5, sig_60_5, sig_59_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_62_6, sig_61_6, sig_68_7, sig_67_7, sig_68_8, sig_68_9, sig_68_10, sig_69_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_70_5, sig_69_6, sig_70_6, sig_70_7, sig_70_8, sig_71_6, sig_72_6, sig_73_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_74_7, sig_74_8, sig_74_9, sig_74_10, sig_74_11, sig_74_12, sig_74_13, sig_77_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_7, sig_80_8, sig_79_8, sig_81_7, sig_82_7, sig_82_8, sig_84_2, sig_83_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_84_3, sig_84_4, sig_84_5, sig_84_6, sig_84_7, sig_83_3, sig_83_4, sig_86_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_85_8, sig_87_5, sig_88_5, sig_87_6, sig_87_7, sig_87_8, sig_87_9, sig_89_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_90_9, sig_91_10, sig_92_10, sig_91_11, sig_93_11, sig_94_11, sig_95_10, sig_96_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_11, sig_95_12, sig_96_11, sig_96_12, sig_96_13, sig_97_12, sig_98_12, sig_100_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_99_13, sig_99_14, sig_101_9, sig_102_9, sig_102_10, sig_102_11, sig_102_12, sig_103_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_104_13, sig_105_14, sig_106_14, sig_108_15, sig_107_15, sig_110_14, sig_109_14, sig_110_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_109_15, sig_111_16, sig_112_16, sig_113_16, sig_114_16, sig_115_17, sig_116_17 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_0_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Q => sig_0_1
  );

  reg_6_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Q => sig_6_1
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
    X => sig_9_0,
    Y => sig_5_0,
    MIN => sig_16_1,
    MAX => sig_15_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_10_0,
    MIN => sig_20_1,
    MAX => sig_19_1
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

  reg_19_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_3,
    Q => sig_19_4
  );

  reg_19_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_4,
    Q => sig_19_5
  );

  cmpswp_21_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_1,
    Y => sig_16_1,
    MIN => sig_21_2,
    MAX => sig_22_2
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_7_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  reg_23_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Q => sig_23_2
  );

  reg_24_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Q => sig_24_2
  );

  reg_24_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_2,
    Q => sig_24_3
  );

  reg_24_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_3,
    Q => sig_24_4
  );

  reg_24_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_4,
    Q => sig_24_5
  );

  cmpswp_25_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_2,
    Y => sig_23_2,
    MIN => sig_25_3,
    MAX => sig_26_3
  );

  reg_25_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Q => sig_25_4
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
    X => sig_1_0,
    Y => sig_4_0,
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

  reg_30_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Q => sig_30_3
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
    X => sig_8_0,
    Y => sig_12_0,
    MIN => sig_34_1,
    MAX => sig_33_1
  );

  reg_33_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_1,
    Q => sig_33_2
  );

  cmpswp_35_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_15_1,
    MIN => sig_35_2,
    MAX => sig_36_2
  );

  reg_36_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_2,
    Q => sig_36_3
  );

  reg_36_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Q => sig_36_4
  );

  cmpswp_37_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_2,
    Y => sig_35_2,
    MIN => sig_37_3,
    MAX => sig_38_3
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_11_0,
    MIN => sig_39_1,
    MAX => sig_40_1
  );

  reg_39_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Q => sig_39_2
  );

  reg_39_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_2,
    Q => sig_39_3
  );

  reg_40_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_1,
    Q => sig_40_2
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Y => sig_40_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  cmpswp_43_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Y => sig_31_3,
    MIN => sig_43_4,
    MAX => sig_44_4
  );

  reg_43_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Q => sig_43_5
  );

  reg_43_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_5,
    Q => sig_43_6
  );

  cmpswp_45_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_3,
    Y => sig_37_3,
    MIN => sig_45_4,
    MAX => sig_46_4
  );

  cmpswp_47_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Y => sig_25_4,
    MIN => sig_47_5,
    MAX => sig_48_5
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

  cmpswp_52_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_38_3,
    MIN => sig_52_4,
    MAX => sig_51_4
  );

  reg_51_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_4,
    Q => sig_51_5
  );

  reg_51_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_5,
    Q => sig_51_6
  );

  cmpswp_53_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_4,
    Y => sig_26_4,
    MIN => sig_53_5,
    MAX => sig_54_5
  );

  cmpswp_56_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_5,
    Y => sig_47_5,
    MIN => sig_56_6,
    MAX => sig_55_6
  );

  cmpswp_58_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Y => sig_42_3,
    MIN => sig_58_4,
    MAX => sig_57_4
  );

  cmpswp_59_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_4,
    Y => sig_36_4,
    MIN => sig_59_5,
    MAX => sig_60_5
  );

  reg_59_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_5,
    Q => sig_59_6
  );

  cmpswp_62_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_5,
    Y => sig_24_5,
    MIN => sig_62_6,
    MAX => sig_61_6
  );

  cmpswp_68_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_6,
    Y => sig_59_6,
    MIN => sig_68_7,
    MAX => sig_67_7
  );

  reg_68_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_7,
    Q => sig_68_8
  );

  reg_68_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_8,
    Q => sig_68_9
  );

  reg_68_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_9,
    Q => sig_68_10
  );

  cmpswp_69_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_4,
    Y => sig_44_4,
    MIN => sig_69_5,
    MAX => sig_70_5
  );

  reg_69_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_5,
    Q => sig_69_6
  );

  reg_70_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_5,
    Q => sig_70_6
  );

  reg_70_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_6,
    Q => sig_70_7
  );

  reg_70_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_7,
    Q => sig_70_8
  );

  cmpswp_71_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_5,
    Y => sig_54_5,
    MIN => sig_71_6,
    MAX => sig_72_6
  );

  cmpswp_73_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_6,
    Y => sig_43_6,
    MIN => sig_73_7,
    MAX => sig_74_7
  );

  reg_74_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_7,
    Q => sig_74_8
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

  reg_74_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_10,
    Q => sig_74_11
  );

  reg_74_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_11,
    Q => sig_74_12
  );

  reg_74_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_12,
    Q => sig_74_13
  );

  cmpswp_77_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_6,
    Y => sig_72_6,
    MIN => sig_77_7,
    MAX => sig_78_7
  );

  cmpswp_80_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_7,
    Y => sig_67_7,
    MIN => sig_80_8,
    MAX => sig_79_8
  );

  cmpswp_81_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Y => sig_55_6,
    MIN => sig_81_7,
    MAX => sig_82_7
  );

  reg_82_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_7,
    Q => sig_82_8
  );

  cmpswp_84_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_1,
    Y => sig_20_1,
    MIN => sig_84_2,
    MAX => sig_83_2
  );

  reg_84_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_2,
    Q => sig_84_3
  );

  reg_84_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_3,
    Q => sig_84_4
  );

  reg_84_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_4,
    Q => sig_84_5
  );

  reg_84_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_5,
    Q => sig_84_6
  );

  reg_84_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_6,
    Q => sig_84_7
  );

  reg_83_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_2,
    Q => sig_83_3
  );

  reg_83_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_3,
    Q => sig_83_4
  );

  cmpswp_86_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_7,
    Y => sig_84_7,
    MIN => sig_86_8,
    MAX => sig_85_8
  );

  cmpswp_87_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_4,
    Y => sig_57_4,
    MIN => sig_87_5,
    MAX => sig_88_5
  );

  reg_87_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_5,
    Q => sig_87_6
  );

  reg_87_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_6,
    Q => sig_87_7
  );

  reg_87_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_7,
    Q => sig_87_8
  );

  reg_87_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_8,
    Q => sig_87_9
  );

  cmpswp_89_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_8,
    Y => sig_70_8,
    MIN => sig_89_9,
    MAX => sig_90_9
  );

  cmpswp_91_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_9,
    Y => sig_90_9,
    MIN => sig_91_10,
    MAX => sig_92_10
  );

  reg_91_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_10,
    Q => sig_91_11
  );

  cmpswp_93_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_10,
    Y => sig_92_10,
    MIN => sig_93_11,
    MAX => sig_94_11
  );

  cmpswp_95_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_9,
    Y => sig_89_9,
    MIN => sig_95_10,
    MAX => sig_96_10
  );

  reg_95_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_10,
    Q => sig_95_11
  );

  reg_95_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_11,
    Q => sig_95_12
  );

  reg_96_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_10,
    Q => sig_96_11
  );

  reg_96_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_11,
    Q => sig_96_12
  );

  reg_96_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_12,
    Q => sig_96_13
  );

  cmpswp_97_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_11,
    Y => sig_91_11,
    MIN => sig_97_12,
    MAX => sig_98_12
  );

  cmpswp_100_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_12,
    Y => sig_97_12,
    MIN => sig_100_13,
    MAX => sig_99_13
  );

  reg_99_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_99_13,
    Q => sig_99_14
  );

  cmpswp_101_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_8,
    Y => sig_85_8,
    MIN => sig_101_9,
    MAX => sig_102_9
  );

  reg_102_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_9,
    Q => sig_102_10
  );

  reg_102_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_10,
    Q => sig_102_11
  );

  reg_102_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_102_11,
    Q => sig_102_12
  );

  cmpswp_103_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_12,
    Y => sig_102_12,
    MIN => sig_103_13,
    MAX => sig_104_13
  );

  cmpswp_105_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_13,
    Y => sig_104_13,
    MIN => sig_105_14,
    MAX => sig_106_14
  );

  cmpswp_108_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_14,
    Y => sig_99_14,
    MIN => sig_108_15,
    MAX => sig_107_15
  );

  cmpswp_110_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_13,
    Y => sig_74_13,
    MIN => sig_110_14,
    MAX => sig_109_14
  );

  reg_110_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_110_14,
    Q => sig_110_15
  );

  reg_109_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_14,
    Q => sig_109_15
  );

  cmpswp_111_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_15,
    Y => sig_109_15,
    MIN => sig_111_16,
    MAX => sig_112_16
  );

  cmpswp_113_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_15,
    Y => sig_110_15,
    MIN => sig_113_16,
    MAX => sig_114_16
  );

  cmpswp_115_17: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_16,
    Y => sig_111_16,
    MIN => sig_115_17,
    MAX => sig_116_17
  );

  sig_out_med <= sig_116_17;
end generated;
