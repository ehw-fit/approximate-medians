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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_3_1, sig_3_2, sig_4_0, sig_5_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_12_1, sig_11_1, sig_14_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_1, sig_15_1, sig_16_1, sig_17_1, sig_18_1, sig_20_2, sig_19_2, sig_21_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_2, sig_24_2, sig_23_2, sig_25_1, sig_26_1, sig_25_2, sig_25_3, sig_26_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_26_3, sig_30_3, sig_29_3, sig_32_4, sig_31_4, sig_33_2, sig_34_2, sig_34_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_4, sig_35_5, sig_36_5, sig_40_3, sig_39_3, sig_40_4, sig_40_5, sig_39_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_5, sig_45_4, sig_46_4, sig_45_5, sig_45_6, sig_48_6, sig_47_6, sig_52_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_51_7, sig_51_8, sig_53_6, sig_54_6, sig_54_7, sig_57_8, sig_58_8, sig_65_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_3_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Q => sig_3_1
  );

  reg_3_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_1,
    Q => sig_3_2
  );

  cmpswp_12_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_9_0,
    MIN => sig_12_1,
    MAX => sig_11_1
  );

  cmpswp_14_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_5_0,
    MIN => sig_14_1,
    MAX => sig_13_1
  );

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_2_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  cmpswp_17_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_6_0,
    MIN => sig_17_1,
    MAX => sig_18_1
  );

  cmpswp_20_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Y => sig_11_1,
    MIN => sig_20_2,
    MAX => sig_19_2
  );

  cmpswp_21_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_12_1,
    MIN => sig_21_2,
    MAX => sig_22_2
  );

  cmpswp_24_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_16_1,
    MIN => sig_24_2,
    MAX => sig_23_2
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_1_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  reg_25_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Q => sig_25_2
  );

  reg_25_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Q => sig_25_3
  );

  reg_26_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Q => sig_26_2
  );

  reg_26_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Q => sig_26_3
  );

  cmpswp_30_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Y => sig_24_2,
    MIN => sig_30_3,
    MAX => sig_29_3
  );

  cmpswp_32_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Y => sig_30_3,
    MIN => sig_32_4,
    MAX => sig_31_4
  );

  cmpswp_33_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_15_1,
    MIN => sig_33_2,
    MAX => sig_34_2
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

  cmpswp_35_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_4,
    Y => sig_31_4,
    MIN => sig_35_5,
    MAX => sig_36_5
  );

  cmpswp_40_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_3_2,
    MIN => sig_40_3,
    MAX => sig_39_3
  );

  reg_40_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_3,
    Q => sig_40_4
  );

  reg_40_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_4,
    Q => sig_40_5
  );

  reg_39_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_3,
    Q => sig_39_4
  );

  reg_39_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_4,
    Q => sig_39_5
  );

  cmpswp_45_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_3,
    Y => sig_26_3,
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

  cmpswp_48_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_5,
    Y => sig_36_5,
    MIN => sig_48_6,
    MAX => sig_47_6
  );

  cmpswp_52_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Y => sig_48_6,
    MIN => sig_52_7,
    MAX => sig_51_7
  );

  reg_51_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_7,
    Q => sig_51_8
  );

  cmpswp_53_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_5,
    Y => sig_40_5,
    MIN => sig_53_6,
    MAX => sig_54_6
  );

  reg_54_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_6,
    Q => sig_54_7
  );

  cmpswp_57_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_7,
    Y => sig_54_7,
    MIN => sig_57_8,
    MAX => sig_58_8
  );

  cmpswp_65_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_8,
    Y => sig_51_8,
    MIN => sig_65_9,
    MAX => sig_66_9
  );

  sig_out_med <= sig_65_9;
end generated;
