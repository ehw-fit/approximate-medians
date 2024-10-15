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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_4_1, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_7_1, sig_8_0, sig_9_0, sig_9_1, sig_9_2, sig_10_0, sig_11_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_1, sig_12_2, sig_12_3, sig_12_4, sig_12_5, sig_12_6, sig_12_7, sig_13_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_14_1, sig_14_2, sig_14_3, sig_15_2, sig_16_2, sig_15_3, sig_15_4, sig_15_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_16_3, sig_16_4, sig_18_1, sig_17_1, sig_19_2, sig_20_2, sig_22_2, sig_21_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_3, sig_23_1, sig_24_1, sig_23_2, sig_24_2, sig_28_3, sig_27_3, sig_30_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_4, sig_31_5, sig_32_5, sig_34_3, sig_33_3, sig_35_4, sig_36_4, sig_35_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_6, sig_36_5, sig_37_6, sig_38_6, sig_39_7, sig_40_7, sig_40_8, sig_40_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_3, sig_42_3, sig_45_4, sig_46_4, sig_45_5, sig_45_6, sig_45_7, sig_45_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_9, sig_45_10, sig_46_5, sig_46_6, sig_48_7, sig_47_7, sig_54_8, sig_53_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_55_4, sig_56_4, sig_55_5, sig_55_6, sig_55_7, sig_55_8, sig_58_6, sig_57_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_7, sig_60_9, sig_59_9, sig_60_10, sig_60_11, sig_60_12, sig_60_13, sig_61_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_62_10, sig_64_8, sig_63_8, sig_63_9, sig_63_10, sig_63_11, sig_66_11, sig_65_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_65_12, sig_67_12, sig_68_12, sig_69_13, sig_70_13, sig_70_14, sig_72_14, sig_71_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_76_15, sig_75_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_4_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Q => sig_4_1
  );

  reg_7_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Q => sig_7_1
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

  cmpswp_11_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_1_0,
    MIN => sig_11_1,
    MAX => sig_12_1
  );

  reg_12_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Q => sig_12_2
  );

  reg_12_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_2,
    Q => sig_12_3
  );

  reg_12_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_3,
    Q => sig_12_4
  );

  reg_12_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_4,
    Q => sig_12_5
  );

  reg_12_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_5,
    Q => sig_12_6
  );

  reg_12_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_6,
    Q => sig_12_7
  );

  cmpswp_13_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_2_0,
    MIN => sig_13_1,
    MAX => sig_14_1
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

  cmpswp_15_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_1,
    Y => sig_11_1,
    MIN => sig_15_2,
    MAX => sig_16_2
  );

  reg_15_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_2,
    Q => sig_15_3
  );

  reg_15_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_3,
    Q => sig_15_4
  );

  reg_15_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_4,
    Q => sig_15_5
  );

  reg_16_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_2,
    Q => sig_16_3
  );

  reg_16_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_3,
    Q => sig_16_4
  );

  cmpswp_18_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_0_0,
    MIN => sig_18_1,
    MAX => sig_17_1
  );

  cmpswp_19_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_4_1,
    MIN => sig_19_2,
    MAX => sig_20_2
  );

  cmpswp_22_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_13_1,
    MIN => sig_22_2,
    MAX => sig_21_2
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
    X => sig_10_0,
    Y => sig_3_0,
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

  cmpswp_28_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_19_2,
    MIN => sig_28_3,
    MAX => sig_27_3
  );

  cmpswp_30_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_3,
    Y => sig_28_3,
    MIN => sig_30_4,
    MAX => sig_29_4
  );

  cmpswp_31_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_4,
    Y => sig_16_4,
    MIN => sig_31_5,
    MAX => sig_32_5
  );

  cmpswp_34_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_2,
    Y => sig_21_2,
    MIN => sig_34_3,
    MAX => sig_33_3
  );

  cmpswp_35_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_3,
    Y => sig_27_3,
    MIN => sig_35_4,
    MAX => sig_36_4
  );

  reg_35_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_4,
    Q => sig_35_5
  );

  reg_35_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_5,
    Q => sig_35_6
  );

  reg_36_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_4,
    Q => sig_36_5
  );

  cmpswp_37_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_5,
    Y => sig_32_5,
    MIN => sig_37_6,
    MAX => sig_38_6
  );

  cmpswp_39_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_6,
    Y => sig_35_6,
    MIN => sig_39_7,
    MAX => sig_40_7
  );

  reg_40_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_7,
    Q => sig_40_8
  );

  reg_40_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_8,
    Q => sig_40_9
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_24_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  cmpswp_45_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_3,
    Y => sig_41_3,
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

  reg_45_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_6,
    Q => sig_45_7
  );

  reg_45_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_7,
    Q => sig_45_8
  );

  reg_45_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_8,
    Q => sig_45_9
  );

  reg_45_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_9,
    Q => sig_45_10
  );

  reg_46_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_4,
    Q => sig_46_5
  );

  reg_46_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_5,
    Q => sig_46_6
  );

  cmpswp_48_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_6,
    Y => sig_46_6,
    MIN => sig_48_7,
    MAX => sig_47_7
  );

  cmpswp_54_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_7,
    Y => sig_48_7,
    MIN => sig_54_8,
    MAX => sig_53_8
  );

  cmpswp_55_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_3,
    Y => sig_42_3,
    MIN => sig_55_4,
    MAX => sig_56_4
  );

  reg_55_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_4,
    Q => sig_55_5
  );

  reg_55_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_5,
    Q => sig_55_6
  );

  reg_55_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_6,
    Q => sig_55_7
  );

  reg_55_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_7,
    Q => sig_55_8
  );

  cmpswp_58_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_5,
    Y => sig_15_5,
    MIN => sig_58_6,
    MAX => sig_57_6
  );

  reg_57_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_6,
    Q => sig_57_7
  );

  cmpswp_60_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_8,
    Y => sig_55_8,
    MIN => sig_60_9,
    MAX => sig_59_9
  );

  reg_60_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_9,
    Q => sig_60_10
  );

  reg_60_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_10,
    Q => sig_60_11
  );

  reg_60_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_11,
    Q => sig_60_12
  );

  reg_60_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_12,
    Q => sig_60_13
  );

  cmpswp_61_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_9,
    Y => sig_40_9,
    MIN => sig_61_10,
    MAX => sig_62_10
  );

  cmpswp_64_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_7,
    Y => sig_39_7,
    MIN => sig_64_8,
    MAX => sig_63_8
  );

  reg_63_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_8,
    Q => sig_63_9
  );

  reg_63_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_9,
    Q => sig_63_10
  );

  reg_63_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_10,
    Q => sig_63_11
  );

  cmpswp_66_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_10,
    Y => sig_45_10,
    MIN => sig_66_11,
    MAX => sig_65_11
  );

  reg_65_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_11,
    Q => sig_65_12
  );

  cmpswp_67_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_11,
    Y => sig_66_11,
    MIN => sig_67_12,
    MAX => sig_68_12
  );

  cmpswp_69_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_12,
    Y => sig_68_12,
    MIN => sig_69_13,
    MAX => sig_70_13
  );

  reg_70_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_13,
    Q => sig_70_14
  );

  cmpswp_72_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_13,
    Y => sig_69_13,
    MIN => sig_72_14,
    MAX => sig_71_14
  );

  cmpswp_76_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_14,
    Y => sig_70_14,
    MIN => sig_76_15,
    MAX => sig_75_15
  );

  sig_out_med <= sig_76_15;
end generated;
