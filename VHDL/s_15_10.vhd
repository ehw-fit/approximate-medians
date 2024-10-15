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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_4_1, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0, sig_14_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_16_1, sig_15_1, sig_18_1, sig_17_1, sig_19_1, sig_20_1, sig_22_1, sig_21_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_2, sig_23_2, sig_24_2, sig_26_1, sig_25_1, sig_27_2, sig_28_2, sig_29_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_1, sig_29_2, sig_29_3, sig_33_2, sig_34_2, sig_35_3, sig_36_3, sig_37_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_38_4, sig_42_3, sig_41_3, sig_41_4, sig_41_5, sig_43_1, sig_44_1, sig_44_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_44_3, sig_46_4, sig_45_4, sig_57_5, sig_58_5, sig_57_6, sig_63_6, sig_64_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_7, sig_85_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_4_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Q => sig_4_1
  );

  cmpswp_16_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_2_0,
    MIN => sig_16_1,
    MAX => sig_15_1
  );

  cmpswp_18_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_14_0,
    MIN => sig_18_1,
    MAX => sig_17_1
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Y => sig_9_0,
    MIN => sig_19_1,
    MAX => sig_20_1
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_1_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  reg_22_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Q => sig_22_2
  );

  cmpswp_23_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_1,
    Y => sig_21_1,
    MIN => sig_23_2,
    MAX => sig_24_2
  );

  cmpswp_26_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_7_0,
    MIN => sig_26_1,
    MAX => sig_25_1
  );

  cmpswp_27_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_26_1,
    MIN => sig_27_2,
    MAX => sig_28_2
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_10_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  reg_29_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Q => sig_29_2
  );

  reg_29_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
    Q => sig_29_3
  );

  cmpswp_33_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_15_1,
    MIN => sig_33_2,
    MAX => sig_34_2
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Y => sig_33_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  cmpswp_37_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_3,
    Y => sig_35_3,
    MIN => sig_37_4,
    MAX => sig_38_4
  );

  cmpswp_42_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_22_2,
    MIN => sig_42_3,
    MAX => sig_41_3
  );

  reg_41_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Q => sig_41_4
  );

  reg_41_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_4,
    Q => sig_41_5
  );

  cmpswp_43_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_6_0,
    MIN => sig_43_1,
    MAX => sig_44_1
  );

  reg_44_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_1,
    Q => sig_44_2
  );

  reg_44_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_2,
    Q => sig_44_3
  );

  cmpswp_46_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Y => sig_44_3,
    MIN => sig_46_4,
    MAX => sig_45_4
  );

  cmpswp_57_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_4,
    Y => sig_46_4,
    MIN => sig_57_5,
    MAX => sig_58_5
  );

  reg_57_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_5,
    Q => sig_57_6
  );

  cmpswp_63_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_5,
    Y => sig_41_5,
    MIN => sig_63_6,
    MAX => sig_64_6
  );

  cmpswp_86_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_6,
    Y => sig_63_6,
    MIN => sig_86_7,
    MAX => sig_85_7
  );

  sig_out_med <= sig_85_7;
end generated;
