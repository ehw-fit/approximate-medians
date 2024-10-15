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

entity median_11 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 10,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_11 is
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_9_0, sig_9_1, sig_9_2, sig_10_0, sig_10_1, sig_10_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_1, sig_12_1, sig_14_1, sig_13_1, sig_13_2, sig_13_3, sig_13_4, sig_13_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_6, sig_17_1, sig_18_1, sig_19_2, sig_20_2, sig_20_3, sig_22_2, sig_21_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_24_1, sig_23_1, sig_26_3, sig_25_3, sig_27_2, sig_28_2, sig_29_2, sig_30_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_3, sig_33_4, sig_34_4, sig_35_3, sig_36_3, sig_36_4, sig_36_5, sig_39_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_3, sig_39_4, sig_43_4, sig_44_4, sig_44_5, sig_46_5, sig_45_5, sig_48_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_6, sig_52_6, sig_51_6, sig_53_4, sig_54_4, sig_53_5, sig_53_6, sig_60_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_59_7, sig_63_7, sig_64_7, sig_66_8, sig_65_8, sig_71_8, sig_72_8, sig_73_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_74_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  end generate;
  reg_2_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Q => sig_2_1
  );

  reg_9_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Q => sig_9_1
  );

  reg_9_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_1,
    Q => sig_9_2
  );

  reg_10_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Q => sig_10_1
  );

  reg_10_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_1,
    Q => sig_10_2
  );

  cmpswp_11_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_1_0,
    MIN => sig_11_1,
    MAX => sig_12_1
  );

  cmpswp_14_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_7_0,
    MIN => sig_14_1,
    MAX => sig_13_1
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

  reg_13_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_5,
    Q => sig_13_6
  );

  cmpswp_17_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_0_0,
    MIN => sig_17_1,
    MAX => sig_18_1
  );

  cmpswp_19_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_2_1,
    MIN => sig_19_2,
    MAX => sig_20_2
  );

  reg_20_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Q => sig_20_3
  );

  cmpswp_22_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_17_1,
    MIN => sig_22_2,
    MAX => sig_21_2
  );

  cmpswp_24_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_6_0,
    MIN => sig_24_1,
    MAX => sig_23_1
  );

  cmpswp_26_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Y => sig_21_2,
    MIN => sig_26_3,
    MAX => sig_25_3
  );

  cmpswp_27_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Y => sig_12_1,
    MIN => sig_27_2,
    MAX => sig_28_2
  );

  cmpswp_29_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_1,
    Y => sig_24_1,
    MIN => sig_29_2,
    MAX => sig_30_2
  );

  reg_29_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
    Q => sig_29_3
  );

  cmpswp_33_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_3,
    Y => sig_25_3,
    MIN => sig_33_4,
    MAX => sig_34_4
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_2,
    Y => sig_10_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  reg_36_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Q => sig_36_4
  );

  reg_36_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_4,
    Q => sig_36_5
  );

  cmpswp_39_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_2,
    Y => sig_27_2,
    MIN => sig_39_3,
    MAX => sig_40_3
  );

  reg_39_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_3,
    Q => sig_39_4
  );

  cmpswp_43_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Y => sig_35_3,
    MIN => sig_43_4,
    MAX => sig_44_4
  );

  reg_44_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_4,
    Q => sig_44_5
  );

  cmpswp_46_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_4,
    Y => sig_39_4,
    MIN => sig_46_5,
    MAX => sig_45_5
  );

  cmpswp_48_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_5,
    Y => sig_46_5,
    MIN => sig_48_6,
    MAX => sig_47_6
  );

  cmpswp_52_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_5,
    Y => sig_36_5,
    MIN => sig_52_6,
    MAX => sig_51_6
  );

  cmpswp_53_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_3,
    Y => sig_40_3,
    MIN => sig_53_4,
    MAX => sig_54_4
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

  cmpswp_60_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_6,
    Y => sig_47_6,
    MIN => sig_60_7,
    MAX => sig_59_7
  );

  cmpswp_63_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_6,
    Y => sig_13_6,
    MIN => sig_63_7,
    MAX => sig_64_7
  );

  cmpswp_66_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_7,
    Y => sig_59_7,
    MIN => sig_66_8,
    MAX => sig_65_8
  );

  cmpswp_71_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_7,
    Y => sig_64_7,
    MIN => sig_71_8,
    MAX => sig_72_8
  );

  cmpswp_73_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_8,
    Y => sig_71_8,
    MIN => sig_73_9,
    MAX => sig_74_9
  );

  sig_out_med <= sig_74_9;
end generated;
