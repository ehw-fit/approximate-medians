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

entity median_9 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 8,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_9 is
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_1, sig_6_2, sig_6_3, sig_7_0, sig_7_1, sig_8_0, sig_10_1, sig_9_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_10_2, sig_9_2, sig_12_1, sig_11_1, sig_14_2, sig_13_2, sig_15_1, sig_16_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_2, sig_16_2, sig_17_3, sig_18_3, sig_20_2, sig_19_2, sig_22_4, sig_21_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_5, sig_24_3, sig_23_3, sig_27_3, sig_28_3, sig_27_4, sig_30_3, sig_29_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_32_4, sig_31_4, sig_34_4, sig_33_4, sig_34_5, sig_35_5, sig_36_5, sig_38_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_37_5, sig_39_6, sig_40_6, sig_40_7, sig_41_6, sig_42_6, sig_43_7, sig_44_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_8, sig_46_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_6_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_1,
    Q => sig_6_2
  );

  reg_6_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_2,
    Q => sig_6_3
  );

  reg_7_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Q => sig_7_1
  );

  cmpswp_10_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_5_0,
    MIN => sig_10_1,
    MAX => sig_9_1
  );

  reg_10_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_1,
    Q => sig_10_2
  );

  reg_9_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_1,
    Q => sig_9_2
  );

  cmpswp_12_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_0_0,
    MIN => sig_12_1,
    MAX => sig_11_1
  );

  cmpswp_14_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Y => sig_7_1,
    MIN => sig_14_2,
    MAX => sig_13_2
  );

  cmpswp_15_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_3_0,
    MIN => sig_15_1,
    MAX => sig_16_1
  );

  reg_15_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Q => sig_15_2
  );

  reg_16_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Q => sig_16_2
  );

  cmpswp_17_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_2,
    Y => sig_14_2,
    MIN => sig_17_3,
    MAX => sig_18_3
  );

  cmpswp_20_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_1,
    Y => sig_2_1,
    MIN => sig_20_2,
    MAX => sig_19_2
  );

  cmpswp_22_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_3,
    Y => sig_18_3,
    MIN => sig_22_4,
    MAX => sig_21_4
  );

  reg_22_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_4,
    Q => sig_22_5
  );

  cmpswp_24_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Y => sig_16_2,
    MIN => sig_24_3,
    MAX => sig_23_3
  );

  cmpswp_27_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_2,
    Y => sig_20_2,
    MIN => sig_27_3,
    MAX => sig_28_3
  );

  reg_27_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_3,
    Q => sig_27_4
  );

  cmpswp_30_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_2,
    Y => sig_13_2,
    MIN => sig_30_3,
    MAX => sig_29_3
  );

  cmpswp_32_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_3,
    Y => sig_30_3,
    MIN => sig_32_4,
    MAX => sig_31_4
  );

  cmpswp_34_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_3,
    Y => sig_29_3,
    MIN => sig_34_4,
    MAX => sig_33_4
  );

  reg_34_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_4,
    Q => sig_34_5
  );

  cmpswp_35_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_4,
    Y => sig_31_4,
    MIN => sig_35_5,
    MAX => sig_36_5
  );

  cmpswp_38_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_4,
    Y => sig_32_4,
    MIN => sig_38_5,
    MAX => sig_37_5
  );

  cmpswp_39_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_5,
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

  cmpswp_41_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_5,
    Y => sig_22_5,
    MIN => sig_41_6,
    MAX => sig_42_6
  );

  cmpswp_43_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_6,
    Y => sig_42_6,
    MIN => sig_43_7,
    MAX => sig_44_7
  );

  cmpswp_45_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_7,
    Y => sig_40_7,
    MIN => sig_45_8,
    MAX => sig_46_8
  );

  sig_out_med <= sig_45_8;
end generated;
