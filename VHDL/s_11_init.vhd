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
  signal sig_0_0, sig_0_1, sig_0_2, sig_0_3, sig_0_4, sig_1_0, sig_1_1, sig_2_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_3_0, sig_4_0, sig_4_1, sig_5_0, sig_6_0, sig_7_0, sig_7_1, sig_8_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_9_0, sig_10_0, sig_10_1, sig_10_2, sig_10_3, sig_10_4, sig_10_5, sig_10_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_1, sig_12_1, sig_11_2, sig_13_2, sig_14_2, sig_14_3, sig_15_3, sig_16_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_4, sig_16_4, sig_17_1, sig_18_1, sig_17_2, sig_19_2, sig_20_2, sig_21_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_3, sig_23_1, sig_24_1, sig_23_2, sig_25_2, sig_26_2, sig_27_3, sig_28_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_4, sig_30_4, sig_29_5, sig_31_5, sig_32_5, sig_32_6, sig_32_7, sig_33_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_6, sig_34_7, sig_35_4, sig_36_4, sig_35_5, sig_37_5, sig_38_5, sig_38_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_6, sig_40_6, sig_39_7, sig_39_8, sig_40_7, sig_40_8, sig_41_3, sig_42_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_41_4, sig_43_4, sig_44_4, sig_45_5, sig_46_5, sig_45_6, sig_45_7, sig_45_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_9, sig_47_7, sig_48_7, sig_49_5, sig_50_5, sig_51_6, sig_52_6, sig_53_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_54_7, sig_55_8, sig_56_8, sig_57_9, sig_58_9, sig_58_10, sig_58_11, sig_59_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_8, sig_59_9, sig_59_10, sig_59_11, sig_59_12, sig_61_9, sig_62_9, sig_61_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_63_10, sig_64_10, sig_65_11, sig_66_11, sig_65_12, sig_65_13, sig_67_12, sig_68_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_67_13, sig_67_14, sig_69_13, sig_70_13, sig_71_14, sig_72_14, sig_72_15, sig_73_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_74_15, sig_75_16, sig_76_16 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_0_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Q => sig_0_1
  );

  reg_0_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_1,
    Q => sig_0_2
  );

  reg_0_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_2,
    Q => sig_0_3
  );

  reg_0_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_3,
    Q => sig_0_4
  );

  reg_1_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Q => sig_1_1
  );

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

  reg_10_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_2,
    Q => sig_10_3
  );

  reg_10_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_3,
    Q => sig_10_4
  );

  reg_10_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_4,
    Q => sig_10_5
  );

  reg_10_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_5,
    Q => sig_10_6
  );

  cmpswp_11_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_3_0,
    MIN => sig_11_1,
    MAX => sig_12_1
  );

  reg_11_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_1,
    Q => sig_11_2
  );

  cmpswp_13_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_1,
    Y => sig_12_1,
    MIN => sig_13_2,
    MAX => sig_14_2
  );

  reg_14_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_2,
    Q => sig_14_3
  );

  cmpswp_15_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_2,
    Y => sig_11_2,
    MIN => sig_15_3,
    MAX => sig_16_3
  );

  reg_15_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_3,
    Q => sig_15_4
  );

  reg_16_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_3,
    Q => sig_16_4
  );

  cmpswp_17_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_6_0,
    MIN => sig_17_1,
    MAX => sig_18_1
  );

  reg_17_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Q => sig_17_2
  );

  cmpswp_19_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_1,
    Y => sig_18_1,
    MIN => sig_19_2,
    MAX => sig_20_2
  );

  cmpswp_21_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_2,
    Y => sig_17_2,
    MIN => sig_21_3,
    MAX => sig_22_3
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_9_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  reg_23_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Q => sig_23_2
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_1,
    Y => sig_24_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  cmpswp_27_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Y => sig_23_2,
    MIN => sig_27_3,
    MAX => sig_28_3
  );

  cmpswp_29_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_3,
    Y => sig_27_3,
    MIN => sig_29_4,
    MAX => sig_30_4
  );

  reg_29_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_4,
    Q => sig_29_5
  );

  cmpswp_31_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_4,
    Y => sig_30_4,
    MIN => sig_31_5,
    MAX => sig_32_5
  );

  reg_32_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_5,
    Q => sig_32_6
  );

  reg_32_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_6,
    Q => sig_32_7
  );

  cmpswp_33_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_5,
    Y => sig_29_5,
    MIN => sig_33_6,
    MAX => sig_34_6
  );

  reg_34_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_6,
    Q => sig_34_7
  );

  cmpswp_35_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_3,
    Y => sig_28_3,
    MIN => sig_35_4,
    MAX => sig_36_4
  );

  reg_35_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_4,
    Q => sig_35_5
  );

  cmpswp_37_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_4,
    Y => sig_36_4,
    MIN => sig_37_5,
    MAX => sig_38_5
  );

  reg_38_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_5,
    Q => sig_38_6
  );

  cmpswp_39_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_5,
    Y => sig_35_5,
    MIN => sig_39_6,
    MAX => sig_40_6
  );

  reg_39_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_6,
    Q => sig_39_7
  );

  reg_39_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_7,
    Q => sig_39_8
  );

  reg_40_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_6,
    Q => sig_40_7
  );

  reg_40_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_7,
    Q => sig_40_8
  );

  cmpswp_41_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_26_2,
    MIN => sig_41_3,
    MAX => sig_42_3
  );

  reg_41_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_3,
    Q => sig_41_4
  );

  cmpswp_43_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_3,
    Y => sig_42_3,
    MIN => sig_43_4,
    MAX => sig_44_4
  );

  cmpswp_45_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Y => sig_41_4,
    MIN => sig_45_5,
    MAX => sig_46_5
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

  cmpswp_47_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_6,
    Y => sig_10_6,
    MIN => sig_47_7,
    MAX => sig_48_7
  );

  cmpswp_49_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_4,
    Y => sig_44_4,
    MIN => sig_49_5,
    MAX => sig_50_5
  );

  cmpswp_51_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_5,
    Y => sig_46_5,
    MIN => sig_51_6,
    MAX => sig_52_6
  );

  cmpswp_53_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_51_6,
    Y => sig_38_6,
    MIN => sig_53_7,
    MAX => sig_54_7
  );

  cmpswp_55_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_7,
    Y => sig_48_7,
    MIN => sig_55_8,
    MAX => sig_56_8
  );

  cmpswp_57_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_8,
    Y => sig_56_8,
    MIN => sig_57_9,
    MAX => sig_58_9
  );

  reg_58_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_9,
    Q => sig_58_10
  );

  reg_58_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_10,
    Q => sig_58_11
  );

  cmpswp_59_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_7,
    Y => sig_32_7,
    MIN => sig_59_8,
    MAX => sig_60_8
  );

  reg_59_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_8,
    Q => sig_59_9
  );

  reg_59_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_9,
    Q => sig_59_10
  );

  reg_59_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_10,
    Q => sig_59_11
  );

  reg_59_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_11,
    Q => sig_59_12
  );

  cmpswp_61_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_8,
    Y => sig_60_8,
    MIN => sig_61_9,
    MAX => sig_62_9
  );

  reg_61_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_9,
    Q => sig_61_10
  );

  cmpswp_63_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_9,
    Y => sig_62_9,
    MIN => sig_63_10,
    MAX => sig_64_10
  );

  cmpswp_65_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_10,
    Y => sig_61_10,
    MIN => sig_65_11,
    MAX => sig_66_11
  );

  reg_65_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_11,
    Q => sig_65_12
  );

  reg_65_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_12,
    Q => sig_65_13
  );

  cmpswp_67_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_11,
    Y => sig_58_11,
    MIN => sig_67_12,
    MAX => sig_68_12
  );

  reg_67_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_12,
    Q => sig_67_13
  );

  reg_67_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_13,
    Q => sig_67_14
  );

  cmpswp_69_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_12,
    Y => sig_68_12,
    MIN => sig_69_13,
    MAX => sig_70_13
  );

  cmpswp_71_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_13,
    Y => sig_65_13,
    MIN => sig_71_14,
    MAX => sig_72_14
  );

  reg_72_14: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_14,
    Q => sig_72_15
  );

  cmpswp_73_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_14,
    Y => sig_67_14,
    MIN => sig_73_15,
    MAX => sig_74_15
  );

  cmpswp_75_16: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_15,
    Y => sig_74_15,
    MIN => sig_75_16,
    MAX => sig_76_16
  );

  sig_out_med <= sig_76_16;
end generated;
