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
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_4_1, sig_4_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_5_0, sig_6_0, sig_7_0, sig_7_1, sig_8_0, sig_9_0, sig_10_0, sig_11_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_0, sig_13_0, sig_14_0, sig_16_1, sig_15_1, sig_18_1, sig_17_1, sig_20_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_19_1, sig_21_2, sig_22_2, sig_22_3, sig_23_1, sig_24_1, sig_25_2, sig_26_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_3, sig_27_1, sig_28_1, sig_28_2, sig_29_2, sig_30_2, sig_32_2, sig_31_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_3, sig_34_3, sig_35_1, sig_36_1, sig_36_2, sig_40_2, sig_39_2, sig_43_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_3, sig_48_4, sig_47_4, sig_50_4, sig_49_4, sig_53_3, sig_54_3, sig_53_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_54_4, sig_56_5, sig_55_5, sig_59_3, sig_60_3, sig_59_4, sig_62_5, sig_61_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_64_2, sig_63_2, sig_66_3, sig_65_3, sig_66_4, sig_66_5, sig_66_6, sig_65_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_65_5, sig_68_4, sig_67_4, sig_67_5, sig_73_6, sig_74_6, sig_76_6, sig_75_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_80_7, sig_79_7, sig_84_5, sig_83_5, sig_90_7, sig_89_7, sig_92_8, sig_91_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_93_6, sig_94_6, sig_93_7, sig_93_8, sig_94_7, sig_94_8, sig_96_9, sig_95_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_98_9, sig_97_9, sig_103_10, sig_104_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_7_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Q => sig_7_1
  );

  cmpswp_16_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_0_0,
    MIN => sig_16_1,
    MAX => sig_15_1
  );

  cmpswp_18_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_3_0,
    MIN => sig_18_1,
    MAX => sig_17_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_8_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  cmpswp_21_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Y => sig_2_1,
    MIN => sig_21_2,
    MAX => sig_22_2
  );

  reg_22_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Q => sig_22_3
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_10_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Y => sig_20_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  reg_25_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Q => sig_25_3
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_6_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  reg_28_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Q => sig_28_2
  );

  cmpswp_29_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_27_1,
    MIN => sig_29_2,
    MAX => sig_30_2
  );

  cmpswp_32_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Y => sig_24_1,
    MIN => sig_32_2,
    MAX => sig_31_2
  );

  cmpswp_33_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Y => sig_21_2,
    MIN => sig_33_3,
    MAX => sig_34_3
  );

  cmpswp_35_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_14_0,
    MIN => sig_35_1,
    MAX => sig_36_1
  );

  reg_36_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_1,
    Q => sig_36_2
  );

  cmpswp_40_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_1,
    Y => sig_17_1,
    MIN => sig_40_2,
    MAX => sig_39_2
  );

  cmpswp_43_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_2,
    Y => sig_32_2,
    MIN => sig_43_3,
    MAX => sig_44_3
  );

  cmpswp_48_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_3,
    Y => sig_44_3,
    MIN => sig_48_4,
    MAX => sig_47_4
  );

  cmpswp_50_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Y => sig_34_3,
    MIN => sig_50_4,
    MAX => sig_49_4
  );

  cmpswp_53_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_2,
    Y => sig_40_2,
    MIN => sig_53_3,
    MAX => sig_54_3
  );

  reg_53_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_3,
    Q => sig_53_4
  );

  reg_54_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_3,
    Q => sig_54_4
  );

  cmpswp_56_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_4,
    Y => sig_49_4,
    MIN => sig_56_5,
    MAX => sig_55_5
  );

  cmpswp_59_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Y => sig_39_2,
    MIN => sig_59_3,
    MAX => sig_60_3
  );

  reg_59_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_3,
    Q => sig_59_4
  );

  cmpswp_62_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_4,
    Y => sig_48_4,
    MIN => sig_62_5,
    MAX => sig_61_5
  );

  cmpswp_64_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_1,
    Y => sig_16_1,
    MIN => sig_64_2,
    MAX => sig_63_2
  );

  cmpswp_66_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Y => sig_63_2,
    MIN => sig_66_3,
    MAX => sig_65_3
  );

  reg_66_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_3,
    Q => sig_66_4
  );

  reg_66_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_4,
    Q => sig_66_5
  );

  reg_66_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_5,
    Q => sig_66_6
  );

  reg_65_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_3,
    Q => sig_65_4
  );

  reg_65_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_4,
    Q => sig_65_5
  );

  cmpswp_68_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Y => sig_33_3,
    MIN => sig_68_4,
    MAX => sig_67_4
  );

  reg_67_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_4,
    Q => sig_67_5
  );

  cmpswp_73_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_5,
    Y => sig_61_5,
    MIN => sig_73_6,
    MAX => sig_74_6
  );

  cmpswp_76_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_5,
    Y => sig_56_5,
    MIN => sig_76_6,
    MAX => sig_75_6
  );

  cmpswp_80_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_6,
    Y => sig_75_6,
    MIN => sig_80_7,
    MAX => sig_79_7
  );

  cmpswp_84_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_4,
    Y => sig_50_4,
    MIN => sig_84_5,
    MAX => sig_83_5
  );

  cmpswp_90_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_6,
    Y => sig_76_6,
    MIN => sig_90_7,
    MAX => sig_89_7
  );

  cmpswp_92_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_7,
    Y => sig_89_7,
    MIN => sig_92_8,
    MAX => sig_91_8
  );

  cmpswp_93_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_5,
    Y => sig_83_5,
    MIN => sig_93_6,
    MAX => sig_94_6
  );

  reg_93_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_6,
    Q => sig_93_7
  );

  reg_93_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_7,
    Q => sig_93_8
  );

  reg_94_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_6,
    Q => sig_94_7
  );

  reg_94_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_7,
    Q => sig_94_8
  );

  cmpswp_96_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_8,
    Y => sig_91_8,
    MIN => sig_96_9,
    MAX => sig_95_9
  );

  cmpswp_98_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_8,
    Y => sig_92_8,
    MIN => sig_98_9,
    MAX => sig_97_9
  );

  cmpswp_103_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_9,
    Y => sig_97_9,
    MIN => sig_103_10,
    MAX => sig_104_10
  );

  sig_out_med <= sig_103_10;
end generated;
