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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0, sig_7_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_8_0, sig_8_1, sig_8_2, sig_8_3, sig_9_0, sig_10_0, sig_11_0, sig_12_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_13_1, sig_14_1, sig_13_2, sig_16_1, sig_15_1, sig_18_1, sig_17_1, sig_19_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_20_1, sig_21_1, sig_22_1, sig_21_2, sig_22_2, sig_22_3, sig_24_2, sig_23_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_27_2, sig_28_2, sig_30_3, sig_29_3, sig_31_4, sig_32_4, sig_33_4, sig_34_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_34_5, sig_35_3, sig_36_3, sig_37_1, sig_38_1, sig_37_2, sig_37_3, sig_40_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_39_2, sig_42_3, sig_41_3, sig_42_4, sig_43_3, sig_44_3, sig_43_4, sig_44_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_45_5, sig_46_5, sig_48_5, sig_47_5, sig_50_4, sig_49_4, sig_49_5, sig_51_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_52_6, sig_53_5, sig_54_5, sig_54_6, sig_55_6, sig_56_6, sig_57_2, sig_58_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_3, sig_57_4, sig_57_5, sig_57_6, sig_58_3, sig_60_6, sig_59_6, sig_62_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_61_7, sig_64_4, sig_63_4, sig_64_5, sig_64_6, sig_64_7, sig_63_5, sig_63_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_65_7, sig_66_7, sig_67_7, sig_68_7, sig_67_8, sig_68_8, sig_72_8, sig_71_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_76_7, sig_75_7, sig_78_9, sig_77_9, sig_79_9, sig_80_9, sig_84_8, sig_83_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_84_9, sig_83_9, sig_85_10, sig_86_10, sig_92_10, sig_91_10, sig_93_11, sig_94_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_8_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Q => sig_8_1
  );

  reg_8_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_1,
    Q => sig_8_2
  );

  reg_8_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_2,
    Q => sig_8_3
  );

  cmpswp_13_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_4_0,
    MIN => sig_13_1,
    MAX => sig_14_1
  );

  reg_13_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Q => sig_13_2
  );

  cmpswp_16_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_9_0,
    MIN => sig_16_1,
    MAX => sig_15_1
  );

  cmpswp_18_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_7_0,
    MIN => sig_18_1,
    MAX => sig_17_1
  );

  cmpswp_19_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_1_0,
    MIN => sig_19_1,
    MAX => sig_20_1
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_6_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  reg_21_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Q => sig_21_2
  );

  reg_22_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Q => sig_22_2
  );

  reg_22_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_2,
    Q => sig_22_3
  );

  cmpswp_24_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_1,
    Y => sig_20_1,
    MIN => sig_24_2,
    MAX => sig_23_2
  );

  cmpswp_27_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_1,
    Y => sig_18_1,
    MIN => sig_27_2,
    MAX => sig_28_2
  );

  cmpswp_30_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_2,
    Y => sig_28_2,
    MIN => sig_30_3,
    MAX => sig_29_3
  );

  cmpswp_31_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_3,
    Y => sig_8_3,
    MIN => sig_31_4,
    MAX => sig_32_4
  );

  cmpswp_33_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_3,
    Y => sig_29_3,
    MIN => sig_33_4,
    MAX => sig_34_4
  );

  reg_34_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_34_4,
    Q => sig_34_5
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_2,
    Y => sig_13_2,
    MIN => sig_35_3,
    MAX => sig_36_3
  );

  cmpswp_37_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_12_0,
    MIN => sig_37_1,
    MAX => sig_38_1
  );

  reg_37_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_1,
    Q => sig_37_2
  );

  reg_37_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_2,
    Q => sig_37_3
  );

  cmpswp_40_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Y => sig_38_1,
    MIN => sig_40_2,
    MAX => sig_39_2
  );

  cmpswp_42_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Y => sig_39_2,
    MIN => sig_42_3,
    MAX => sig_41_3
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
    X => sig_21_2,
    Y => sig_40_2,
    MIN => sig_43_3,
    MAX => sig_44_3
  );

  reg_43_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Q => sig_43_4
  );

  reg_44_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_3,
    Q => sig_44_4
  );

  cmpswp_45_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_4,
    Y => sig_33_4,
    MIN => sig_45_5,
    MAX => sig_46_5
  );

  cmpswp_48_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_4,
    Y => sig_43_4,
    MIN => sig_48_5,
    MAX => sig_47_5
  );

  cmpswp_50_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_3,
    Y => sig_37_3,
    MIN => sig_50_4,
    MAX => sig_49_4
  );

  reg_49_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_4,
    Q => sig_49_5
  );

  cmpswp_51_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_5,
    Y => sig_45_5,
    MIN => sig_51_6,
    MAX => sig_52_6
  );

  cmpswp_53_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_4,
    Y => sig_44_4,
    MIN => sig_53_5,
    MAX => sig_54_5
  );

  reg_54_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_5,
    Q => sig_54_6
  );

  cmpswp_55_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_5,
    Y => sig_53_5,
    MIN => sig_55_6,
    MAX => sig_56_6
  );

  cmpswp_57_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_1,
    Y => sig_19_1,
    MIN => sig_57_2,
    MAX => sig_58_2
  );

  reg_57_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_2,
    Q => sig_57_3
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

  reg_57_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_5,
    Q => sig_57_6
  );

  reg_58_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_2,
    Q => sig_58_3
  );

  cmpswp_60_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_5,
    Y => sig_34_5,
    MIN => sig_60_6,
    MAX => sig_59_6
  );

  cmpswp_62_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_6,
    Y => sig_54_6,
    MIN => sig_62_7,
    MAX => sig_61_7
  );

  cmpswp_64_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_3,
    Y => sig_58_3,
    MIN => sig_64_4,
    MAX => sig_63_4
  );

  reg_64_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_4,
    Q => sig_64_5
  );

  reg_64_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_5,
    Q => sig_64_6
  );

  reg_64_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_6,
    Q => sig_64_7
  );

  reg_63_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_4,
    Q => sig_63_5
  );

  reg_63_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_5,
    Q => sig_63_6
  );

  cmpswp_65_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_6,
    Y => sig_51_6,
    MIN => sig_65_7,
    MAX => sig_66_7
  );

  cmpswp_67_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_6,
    Y => sig_63_6,
    MIN => sig_67_7,
    MAX => sig_68_7
  );

  reg_67_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_7,
    Q => sig_67_8
  );

  reg_68_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_7,
    Q => sig_68_8
  );

  cmpswp_72_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_7,
    Y => sig_62_7,
    MIN => sig_72_8,
    MAX => sig_71_8
  );

  cmpswp_76_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_6,
    Y => sig_60_6,
    MIN => sig_76_7,
    MAX => sig_75_7
  );

  cmpswp_78_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_8,
    Y => sig_68_8,
    MIN => sig_78_9,
    MAX => sig_77_9
  );

  cmpswp_79_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_8,
    Y => sig_67_8,
    MIN => sig_79_9,
    MAX => sig_80_9
  );

  cmpswp_84_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_7,
    Y => sig_76_7,
    MIN => sig_84_8,
    MAX => sig_83_8
  );

  reg_84_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_8,
    Q => sig_84_9
  );

  reg_83_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_8,
    Q => sig_83_9
  );

  cmpswp_85_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_9,
    Y => sig_78_9,
    MIN => sig_85_10,
    MAX => sig_86_10
  );

  cmpswp_92_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_80_9,
    Y => sig_84_9,
    MIN => sig_92_10,
    MAX => sig_91_10
  );

  cmpswp_93_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_10,
    Y => sig_85_10,
    MIN => sig_93_11,
    MAX => sig_94_11
  );

  sig_out_med <= sig_94_11;
end generated;
