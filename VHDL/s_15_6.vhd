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
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_2_2, sig_2_3, sig_3_0, sig_4_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_5_0, sig_6_0, sig_7_0, sig_7_1, sig_8_0, sig_8_1, sig_9_0, sig_10_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_10_1, sig_11_0, sig_12_0, sig_13_0, sig_13_1, sig_14_0, sig_15_1, sig_16_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_2, sig_18_1, sig_17_1, sig_20_1, sig_19_1, sig_21_1, sig_22_1, sig_21_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_2, sig_24_2, sig_25_2, sig_26_2, sig_27_1, sig_28_1, sig_30_2, sig_29_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_31_2, sig_32_2, sig_34_3, sig_33_3, sig_35_2, sig_36_2, sig_38_3, sig_37_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_38_4, sig_39_2, sig_40_2, sig_41_3, sig_42_3, sig_42_4, sig_43_3, sig_44_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_46_4, sig_45_4, sig_47_4, sig_48_4, sig_49_4, sig_50_4, sig_50_5, sig_51_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_52_3, sig_51_4, sig_51_5, sig_51_6, sig_52_4, sig_52_5, sig_53_5, sig_54_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_55_6, sig_56_6, sig_58_3, sig_57_3, sig_58_4, sig_58_5, sig_58_6, sig_60_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_59_5, sig_62_5, sig_61_5, sig_64_6, sig_63_6, sig_67_7, sig_68_7, sig_70_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_69_6, sig_70_7, sig_69_7, sig_69_8, sig_69_9, sig_73_3, sig_74_3, sig_73_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_73_5, sig_73_6, sig_75_7, sig_76_7, sig_77_8, sig_78_8, sig_84_7, sig_83_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_83_8, sig_86_8, sig_85_8, sig_88_9, sig_87_9, sig_90_10, sig_89_10, sig_96_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_9, sig_96_10, sig_96_11, sig_95_10, sig_98_11, sig_97_11, sig_111_12, sig_112_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_2_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_1,
    Q => sig_2_2
  );

  reg_2_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_2,
    Q => sig_2_3
  );

  reg_7_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Q => sig_7_1
  );

  reg_8_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Q => sig_8_1
  );

  reg_10_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Q => sig_10_1
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
    X => sig_11_0,
    Y => sig_5_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  reg_15_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Q => sig_15_2
  );

  cmpswp_18_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_3_0,
    MIN => sig_18_1,
    MAX => sig_17_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_9_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Y => sig_0_0,
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
    X => sig_17_1,
    Y => sig_13_1,
    MIN => sig_23_2,
    MAX => sig_24_2
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Y => sig_22_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_4_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  cmpswp_30_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_1,
    Y => sig_28_1,
    MIN => sig_30_2,
    MAX => sig_29_2
  );

  cmpswp_31_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_27_1,
    MIN => sig_31_2,
    MAX => sig_32_2
  );

  cmpswp_34_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_2,
    Y => sig_31_2,
    MIN => sig_34_3,
    MAX => sig_33_3
  );

  cmpswp_35_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_1,
    Y => sig_19_1,
    MIN => sig_35_2,
    MAX => sig_36_2
  );

  cmpswp_38_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_30_2,
    MIN => sig_38_3,
    MAX => sig_37_3
  );

  reg_38_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_3,
    Q => sig_38_4
  );

  cmpswp_39_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_1,
    Y => sig_18_1,
    MIN => sig_39_2,
    MAX => sig_40_2
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Y => sig_40_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  reg_42_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Q => sig_42_4
  );

  cmpswp_43_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Y => sig_39_2,
    MIN => sig_43_3,
    MAX => sig_44_3
  );

  cmpswp_46_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Y => sig_43_3,
    MIN => sig_46_4,
    MAX => sig_45_4
  );

  cmpswp_47_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_3,
    Y => sig_44_3,
    MIN => sig_47_4,
    MAX => sig_48_4
  );

  cmpswp_49_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_3,
    Y => sig_33_3,
    MIN => sig_49_4,
    MAX => sig_50_4
  );

  reg_50_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_4,
    Q => sig_50_5
  );

  cmpswp_51_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_2,
    Y => sig_35_2,
    MIN => sig_51_3,
    MAX => sig_52_3
  );

  reg_51_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_3,
    Q => sig_51_4
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

  reg_52_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_3,
    Q => sig_52_4
  );

  reg_52_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_4,
    Q => sig_52_5
  );

  cmpswp_53_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_4,
    Y => sig_45_4,
    MIN => sig_53_5,
    MAX => sig_54_5
  );

  cmpswp_55_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_5,
    Y => sig_50_5,
    MIN => sig_55_6,
    MAX => sig_56_6
  );

  cmpswp_58_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_2,
    Y => sig_29_2,
    MIN => sig_58_3,
    MAX => sig_57_3
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

  cmpswp_60_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_4,
    Y => sig_48_4,
    MIN => sig_60_5,
    MAX => sig_59_5
  );

  cmpswp_62_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_4,
    Y => sig_49_4,
    MIN => sig_62_5,
    MAX => sig_61_5
  );

  cmpswp_64_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_5,
    Y => sig_53_5,
    MIN => sig_64_6,
    MAX => sig_63_6
  );

  cmpswp_67_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_6,
    Y => sig_55_6,
    MIN => sig_67_7,
    MAX => sig_68_7
  );

  cmpswp_70_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_5,
    Y => sig_52_5,
    MIN => sig_70_6,
    MAX => sig_69_6
  );

  reg_70_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_6,
    Q => sig_70_7
  );

  reg_69_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Q => sig_69_7
  );

  reg_69_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_7,
    Q => sig_69_8
  );

  reg_69_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_8,
    Q => sig_69_9
  );

  cmpswp_73_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_2,
    Y => sig_26_2,
    MIN => sig_73_3,
    MAX => sig_74_3
  );

  reg_73_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_3,
    Q => sig_73_4
  );

  reg_73_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_4,
    Q => sig_73_5
  );

  reg_73_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_5,
    Q => sig_73_6
  );

  cmpswp_75_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_6,
    Y => sig_56_6,
    MIN => sig_75_7,
    MAX => sig_76_7
  );

  cmpswp_77_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_7,
    Y => sig_75_7,
    MIN => sig_77_8,
    MAX => sig_78_8
  );

  cmpswp_84_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_6,
    Y => sig_51_6,
    MIN => sig_84_7,
    MAX => sig_83_7
  );

  reg_83_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_7,
    Q => sig_83_8
  );

  cmpswp_86_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_7,
    Y => sig_67_7,
    MIN => sig_86_8,
    MAX => sig_85_8
  );

  cmpswp_88_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_8,
    Y => sig_77_8,
    MIN => sig_88_9,
    MAX => sig_87_9
  );

  cmpswp_90_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_9,
    Y => sig_69_9,
    MIN => sig_90_10,
    MAX => sig_89_10
  );

  cmpswp_96_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_8,
    Y => sig_85_8,
    MIN => sig_96_9,
    MAX => sig_95_9
  );

  reg_96_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_9,
    Q => sig_96_10
  );

  reg_96_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_10,
    Q => sig_96_11
  );

  reg_95_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_9,
    Q => sig_95_10
  );

  cmpswp_98_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_10,
    Y => sig_90_10,
    MIN => sig_98_11,
    MAX => sig_97_11
  );

  cmpswp_111_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_96_11,
    Y => sig_98_11,
    MIN => sig_111_12,
    MAX => sig_112_12
  );

  sig_out_med <= sig_112_12;
end generated;
