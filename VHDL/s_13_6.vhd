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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_3_1, sig_3_2, sig_3_3, sig_4_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_4_1, sig_5_0, sig_6_0, sig_7_0, sig_8_0, sig_9_0, sig_9_1, sig_9_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_10_0, sig_10_1, sig_11_0, sig_12_0, sig_12_1, sig_14_1, sig_13_1, sig_16_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_1, sig_16_2, sig_17_1, sig_18_1, sig_19_2, sig_20_2, sig_21_2, sig_22_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_25_2, sig_26_2, sig_27_3, sig_28_3, sig_29_1, sig_30_1, sig_29_2, sig_30_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_3, sig_31_3, sig_32_3, sig_31_4, sig_31_5, sig_34_2, sig_33_2, sig_34_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_37_3, sig_38_3, sig_39_4, sig_40_4, sig_40_5, sig_40_6, sig_44_4, sig_43_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_3, sig_47_3, sig_56_4, sig_55_4, sig_58_3, sig_57_3, sig_57_4, sig_57_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_4, sig_59_4, sig_59_5, sig_67_5, sig_68_5, sig_69_6, sig_70_6, sig_71_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_72_5, sig_76_6, sig_75_6, sig_76_7, sig_77_7, sig_78_7, sig_80_6, sig_79_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_80_7, sig_80_8, sig_81_8, sig_82_8, sig_82_9, sig_85_7, sig_86_7, sig_88_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_87_8, sig_89_9, sig_90_9, sig_90_10, sig_91_10, sig_92_10, sig_98_11, sig_97_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
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

  reg_3_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_2,
    Q => sig_3_3
  );

  reg_4_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Q => sig_4_1
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

  reg_12_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Q => sig_12_1
  );

  cmpswp_14_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_6_0,
    MIN => sig_14_1,
    MAX => sig_13_1
  );

  cmpswp_16_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_11_0,
    MIN => sig_16_1,
    MAX => sig_15_1
  );

  reg_16_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Q => sig_16_2
  );

  cmpswp_17_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_5_0,
    MIN => sig_17_1,
    MAX => sig_18_1
  );

  cmpswp_19_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_10_1,
    MIN => sig_19_2,
    MAX => sig_20_2
  );

  cmpswp_21_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_15_1,
    MIN => sig_21_2,
    MAX => sig_22_2
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_12_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  cmpswp_27_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_9_2,
    MIN => sig_27_3,
    MAX => sig_28_3
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_0_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  reg_29_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Q => sig_29_2
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

  cmpswp_31_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_2,
    Y => sig_26_2,
    MIN => sig_31_3,
    MAX => sig_32_3
  );

  reg_31_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Q => sig_31_4
  );

  reg_31_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_4,
    Q => sig_31_5
  );

  cmpswp_34_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Y => sig_4_1,
    MIN => sig_34_2,
    MAX => sig_33_2
  );

  reg_34_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_2,
    Q => sig_34_3
  );

  cmpswp_37_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Y => sig_33_2,
    MIN => sig_37_3,
    MAX => sig_38_3
  );

  cmpswp_39_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_3,
    Y => sig_27_3,
    MIN => sig_39_4,
    MAX => sig_40_4
  );

  reg_40_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_4,
    Q => sig_40_5
  );

  reg_40_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_5,
    Q => sig_40_6
  );

  cmpswp_44_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Y => sig_32_3,
    MIN => sig_44_4,
    MAX => sig_43_4
  );

  cmpswp_48_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_2,
    Y => sig_25_2,
    MIN => sig_48_3,
    MAX => sig_47_3
  );

  cmpswp_56_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_3,
    Y => sig_28_3,
    MIN => sig_56_4,
    MAX => sig_55_4
  );

  cmpswp_58_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Y => sig_29_2,
    MIN => sig_58_3,
    MAX => sig_57_3
  );

  reg_57_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_3,
    Q => sig_57_4
  );

  reg_57_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_4,
    Q => sig_57_5
  );

  cmpswp_60_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_3,
    Y => sig_3_3,
    MIN => sig_60_4,
    MAX => sig_59_4
  );

  reg_59_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_4,
    Q => sig_59_5
  );

  cmpswp_67_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_4,
    Y => sig_39_4,
    MIN => sig_67_5,
    MAX => sig_68_5
  );

  cmpswp_69_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_5,
    Y => sig_57_5,
    MIN => sig_69_6,
    MAX => sig_70_6
  );

  cmpswp_71_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Y => sig_44_4,
    MIN => sig_71_5,
    MAX => sig_72_5
  );

  cmpswp_76_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_5,
    Y => sig_31_5,
    MIN => sig_76_6,
    MAX => sig_75_6
  );

  reg_76_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_6,
    Q => sig_76_7
  );

  cmpswp_77_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_6,
    Y => sig_70_6,
    MIN => sig_77_7,
    MAX => sig_78_7
  );

  cmpswp_80_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_5,
    Y => sig_59_5,
    MIN => sig_80_6,
    MAX => sig_79_6
  );

  reg_80_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_6,
    Q => sig_80_7
  );

  reg_80_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_7,
    Q => sig_80_8
  );

  cmpswp_81_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_7,
    Y => sig_77_7,
    MIN => sig_81_8,
    MAX => sig_82_8
  );

  reg_82_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_8,
    Q => sig_82_9
  );

  cmpswp_85_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_6,
    Y => sig_75_6,
    MIN => sig_85_7,
    MAX => sig_86_7
  );

  cmpswp_88_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_7,
    Y => sig_86_7,
    MIN => sig_88_8,
    MAX => sig_87_8
  );

  cmpswp_89_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_8,
    Y => sig_88_8,
    MIN => sig_89_9,
    MAX => sig_90_9
  );

  reg_90_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_9,
    Q => sig_90_10
  );

  cmpswp_91_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_9,
    Y => sig_89_9,
    MIN => sig_91_10,
    MAX => sig_92_10
  );

  cmpswp_98_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_92_10,
    Y => sig_90_10,
    MIN => sig_98_11,
    MAX => sig_97_11
  );

  sig_out_med <= sig_98_11;
end generated;
