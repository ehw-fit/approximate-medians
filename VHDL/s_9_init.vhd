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
  signal sig_0_0, sig_0_1, sig_1_0, sig_2_0, sig_3_0, sig_3_1, sig_4_0, sig_5_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_6_1, sig_7_0, sig_8_0, sig_9_1, sig_10_1, sig_10_2, sig_11_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_1, sig_12_2, sig_13_1, sig_14_1, sig_14_2, sig_15_2, sig_16_2, sig_17_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_2, sig_19_2, sig_20_2, sig_19_3, sig_21_3, sig_22_3, sig_21_4, sig_22_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_3, sig_24_3, sig_25_3, sig_26_3, sig_27_3, sig_28_3, sig_29_4, sig_30_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_31_4, sig_32_4, sig_32_5, sig_33_4, sig_34_4, sig_34_5, sig_34_6, sig_34_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_5, sig_36_5, sig_37_5, sig_38_5, sig_37_6, sig_39_6, sig_40_6, sig_41_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_42_7, sig_42_8, sig_43_8, sig_44_8, sig_45_9, sig_46_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_0_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Q => sig_0_1
  );

  reg_3_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Q => sig_3_1
  );

  reg_6_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Q => sig_6_1
  );

  cmpswp_9_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_2_0,
    MIN => sig_9_1,
    MAX => sig_10_1
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
    Y => sig_5_0,
    MIN => sig_11_1,
    MAX => sig_12_1
  );

  reg_12_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Q => sig_12_2
  );

  cmpswp_13_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_8_0,
    MIN => sig_13_1,
    MAX => sig_14_1
  );

  reg_14_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Q => sig_14_2
  );

  cmpswp_15_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_1,
    Y => sig_9_1,
    MIN => sig_15_2,
    MAX => sig_16_2
  );

  cmpswp_17_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_1,
    Y => sig_11_1,
    MIN => sig_17_2,
    MAX => sig_18_2
  );

  cmpswp_19_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_1,
    Y => sig_13_1,
    MIN => sig_19_2,
    MAX => sig_20_2
  );

  reg_19_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Q => sig_19_3
  );

  cmpswp_21_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_2,
    Y => sig_10_2,
    MIN => sig_21_3,
    MAX => sig_22_3
  );

  reg_21_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_3,
    Q => sig_21_4
  );

  reg_22_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_3,
    Q => sig_22_4
  );

  cmpswp_23_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_2,
    Y => sig_12_2,
    MIN => sig_23_3,
    MAX => sig_24_3
  );

  cmpswp_25_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_14_2,
    MIN => sig_25_3,
    MAX => sig_26_3
  );

  cmpswp_27_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_2,
    Y => sig_17_2,
    MIN => sig_27_3,
    MAX => sig_28_3
  );

  cmpswp_29_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_3,
    Y => sig_26_3,
    MIN => sig_29_4,
    MAX => sig_30_4
  );

  cmpswp_31_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_3,
    Y => sig_25_3,
    MIN => sig_31_4,
    MAX => sig_32_4
  );

  reg_32_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_4,
    Q => sig_32_5
  );

  cmpswp_33_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_3,
    Y => sig_19_3,
    MIN => sig_33_4,
    MAX => sig_34_4
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

  reg_34_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_6,
    Q => sig_34_7
  );

  cmpswp_35_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_4,
    Y => sig_31_4,
    MIN => sig_35_5,
    MAX => sig_36_5
  );

  cmpswp_37_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_4,
    Y => sig_29_4,
    MIN => sig_37_5,
    MAX => sig_38_5
  );

  reg_37_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_5,
    Q => sig_37_6
  );

  cmpswp_39_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_5,
    Y => sig_32_5,
    MIN => sig_39_6,
    MAX => sig_40_6
  );

  cmpswp_41_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_6,
    Y => sig_37_6,
    MIN => sig_41_7,
    MAX => sig_42_7
  );

  reg_42_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_7,
    Q => sig_42_8
  );

  cmpswp_43_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_7,
    Y => sig_41_7,
    MIN => sig_43_8,
    MAX => sig_44_8
  );

  cmpswp_45_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_8,
    Y => sig_42_8,
    MIN => sig_45_9,
    MAX => sig_46_9
  );

  sig_out_med <= sig_45_9;
end generated;
