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

entity median_19 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 18,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_19 is
  signal sig_0_0, sig_1_0, sig_1_1, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_5_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_6_1, sig_6_2, sig_7_0, sig_7_1, sig_8_0, sig_9_0, sig_9_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_9_2, sig_9_3, sig_10_0, sig_10_1, sig_10_2, sig_10_3, sig_11_0, sig_12_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_1, sig_12_2, sig_13_0, sig_13_1, sig_14_0, sig_15_0, sig_16_0, sig_17_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_17_1, sig_18_0, sig_20_1, sig_19_1, sig_21_1, sig_22_1, sig_24_1, sig_23_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_2, sig_23_3, sig_23_4, sig_25_2, sig_26_2, sig_25_3, sig_26_3, sig_26_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_26_5, sig_27_1, sig_28_1, sig_28_2, sig_28_3, sig_30_2, sig_29_2, sig_31_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_32_3, sig_34_2, sig_33_2, sig_34_3, sig_34_4, sig_33_3, sig_35_1, sig_36_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_36_2, sig_38_2, sig_37_2, sig_38_3, sig_39_2, sig_40_2, sig_40_3, sig_40_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_40_5, sig_42_3, sig_41_3, sig_43_2, sig_44_2, sig_46_4, sig_45_4, sig_47_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_3, sig_51_4, sig_52_4, sig_52_5, sig_53_4, sig_54_4, sig_54_5, sig_54_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_3, sig_58_3, sig_57_4, sig_59_4, sig_60_4, sig_61_5, sig_62_5, sig_66_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_65_4, sig_69_4, sig_70_4, sig_70_5, sig_72_5, sig_71_5, sig_73_5, sig_74_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_75_5, sig_76_5, sig_77_5, sig_78_5, sig_78_6, sig_78_7, sig_82_6, sig_81_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_7, sig_84_6, sig_83_6, sig_84_7, sig_84_8, sig_85_6, sig_86_6, sig_91_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_92_6, sig_98_7, sig_97_7, sig_101_6, sig_102_6, sig_101_7, sig_104_8, sig_103_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_104_9, sig_103_9, sig_103_10, sig_103_11, sig_103_12, sig_103_13, sig_108_7, sig_107_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_111_8, sig_112_8, sig_112_9, sig_112_10, sig_114_8, sig_113_8, sig_113_9, sig_113_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_113_11, sig_113_12, sig_130_9, sig_129_9, sig_129_10, sig_129_11, sig_138_10, sig_137_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_140_11, sig_139_11, sig_140_12, sig_140_13, sig_140_14, sig_146_12, sig_145_12, sig_148_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_147_13, sig_151_14, sig_152_14, sig_155_15, sig_156_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
    sig_15_0(i) <= sig_in(15,i);
    sig_16_0(i) <= sig_in(16,i);
    sig_17_0(i) <= sig_in(17,i);
    sig_18_0(i) <= sig_in(18,i);
  end generate;
  reg_1_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Q => sig_1_1
  );

  reg_5_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Q => sig_5_1
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

  reg_9_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_2,
    Q => sig_9_3
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

  reg_12_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Q => sig_12_1
  );

  reg_12_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_1,
    Q => sig_12_2
  );

  reg_13_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_0,
    Q => sig_13_1
  );

  reg_17_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Q => sig_17_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_4_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_16_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  cmpswp_24_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Y => sig_11_0,
    MIN => sig_24_1,
    MAX => sig_23_1
  );

  reg_23_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Q => sig_23_2
  );

  reg_23_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_2,
    Q => sig_23_3
  );

  reg_23_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_3,
    Q => sig_23_4
  );

  cmpswp_25_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Y => sig_5_1,
    MIN => sig_25_2,
    MAX => sig_26_2
  );

  reg_25_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Q => sig_25_3
  );

  reg_26_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Q => sig_26_3
  );

  reg_26_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Q => sig_26_4
  );

  reg_26_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_4,
    Q => sig_26_5
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_0_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  reg_28_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Q => sig_28_2
  );

  reg_28_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Q => sig_28_3
  );

  cmpswp_30_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Y => sig_27_1,
    MIN => sig_30_2,
    MAX => sig_29_2
  );

  cmpswp_31_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_2,
    Y => sig_6_2,
    MIN => sig_31_3,
    MAX => sig_32_3
  );

  cmpswp_34_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_1,
    Y => sig_20_1,
    MIN => sig_34_2,
    MAX => sig_33_2
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

  reg_33_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_2,
    Q => sig_33_3
  );

  cmpswp_35_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Y => sig_2_0,
    MIN => sig_35_1,
    MAX => sig_36_1
  );

  reg_36_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_1,
    Q => sig_36_2
  );

  cmpswp_38_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_1,
    Y => sig_17_1,
    MIN => sig_38_2,
    MAX => sig_37_2
  );

  reg_38_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_2,
    Q => sig_38_3
  );

  cmpswp_39_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Y => sig_7_1,
    MIN => sig_39_2,
    MAX => sig_40_2
  );

  reg_40_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_2,
    Q => sig_40_3
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

  cmpswp_42_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_2,
    Y => sig_39_2,
    MIN => sig_42_3,
    MAX => sig_41_3
  );

  cmpswp_43_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_13_1,
    Y => sig_19_1,
    MIN => sig_43_2,
    MAX => sig_44_2
  );

  cmpswp_46_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_3,
    Y => sig_38_3,
    MIN => sig_46_4,
    MAX => sig_45_4
  );

  cmpswp_47_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_44_2,
    Y => sig_36_2,
    MIN => sig_47_3,
    MAX => sig_48_3
  );

  cmpswp_51_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Y => sig_47_3,
    MIN => sig_51_4,
    MAX => sig_52_4
  );

  reg_52_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_4,
    Q => sig_52_5
  );

  cmpswp_53_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_3,
    Y => sig_28_3,
    MIN => sig_53_4,
    MAX => sig_54_4
  );

  reg_54_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_4,
    Q => sig_54_5
  );

  reg_54_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_5,
    Q => sig_54_6
  );

  cmpswp_57_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_2,
    Y => sig_43_2,
    MIN => sig_57_3,
    MAX => sig_58_3
  );

  reg_57_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_3,
    Q => sig_57_4
  );

  cmpswp_59_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_3,
    Y => sig_58_3,
    MIN => sig_59_4,
    MAX => sig_60_4
  );

  cmpswp_61_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_4,
    Y => sig_57_4,
    MIN => sig_61_5,
    MAX => sig_62_5
  );

  cmpswp_66_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_3,
    Y => sig_10_3,
    MIN => sig_66_4,
    MAX => sig_65_4
  );

  cmpswp_69_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_3,
    Y => sig_41_3,
    MIN => sig_69_4,
    MAX => sig_70_4
  );

  reg_70_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_70_4,
    Q => sig_70_5
  );

  cmpswp_72_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_4,
    Y => sig_60_4,
    MIN => sig_72_5,
    MAX => sig_71_5
  );

  cmpswp_73_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_4,
    Y => sig_69_4,
    MIN => sig_73_5,
    MAX => sig_74_5
  );

  cmpswp_75_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_4,
    Y => sig_51_4,
    MIN => sig_75_5,
    MAX => sig_76_5
  );

  cmpswp_77_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_4,
    Y => sig_34_4,
    MIN => sig_77_5,
    MAX => sig_78_5
  );

  reg_78_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_5,
    Q => sig_78_6
  );

  reg_78_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_6,
    Q => sig_78_7
  );

  cmpswp_82_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_5,
    Y => sig_26_5,
    MIN => sig_82_6,
    MAX => sig_81_6
  );

  reg_82_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_6,
    Q => sig_82_7
  );

  cmpswp_84_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_5,
    Y => sig_74_5,
    MIN => sig_84_6,
    MAX => sig_83_6
  );

  reg_84_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_6,
    Q => sig_84_7
  );

  reg_84_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_7,
    Q => sig_84_8
  );

  cmpswp_85_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_5,
    Y => sig_76_5,
    MIN => sig_85_6,
    MAX => sig_86_6
  );

  cmpswp_91_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_5,
    Y => sig_61_5,
    MIN => sig_91_6,
    MAX => sig_92_6
  );

  cmpswp_98_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_6,
    Y => sig_86_6,
    MIN => sig_98_7,
    MAX => sig_97_7
  );

  cmpswp_101_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_5,
    Y => sig_70_5,
    MIN => sig_101_6,
    MAX => sig_102_6
  );

  reg_101_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_6,
    Q => sig_101_7
  );

  cmpswp_104_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_7,
    Y => sig_78_7,
    MIN => sig_104_8,
    MAX => sig_103_8
  );

  reg_104_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_8,
    Q => sig_104_9
  );

  reg_103_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_8,
    Q => sig_103_9
  );

  reg_103_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_9,
    Q => sig_103_10
  );

  reg_103_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_10,
    Q => sig_103_11
  );

  reg_103_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_11,
    Q => sig_103_12
  );

  reg_103_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_12,
    Q => sig_103_13
  );

  cmpswp_108_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_6,
    Y => sig_92_6,
    MIN => sig_108_7,
    MAX => sig_107_7
  );

  cmpswp_111_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_108_7,
    Y => sig_101_7,
    MIN => sig_111_8,
    MAX => sig_112_8
  );

  reg_112_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_8,
    Q => sig_112_9
  );

  reg_112_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_9,
    Q => sig_112_10
  );

  cmpswp_114_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_7,
    Y => sig_82_7,
    MIN => sig_114_8,
    MAX => sig_113_8
  );

  reg_113_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_8,
    Q => sig_113_9
  );

  reg_113_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_9,
    Q => sig_113_10
  );

  reg_113_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_10,
    Q => sig_113_11
  );

  reg_113_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_11,
    Q => sig_113_12
  );

  cmpswp_130_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_8,
    Y => sig_84_8,
    MIN => sig_130_9,
    MAX => sig_129_9
  );

  reg_129_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_9,
    Q => sig_129_10
  );

  reg_129_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_129_10,
    Q => sig_129_11
  );

  cmpswp_138_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_104_9,
    Y => sig_130_9,
    MIN => sig_138_10,
    MAX => sig_137_10
  );

  cmpswp_140_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_10,
    Y => sig_137_10,
    MIN => sig_140_11,
    MAX => sig_139_11
  );

  reg_140_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_11,
    Q => sig_140_12
  );

  reg_140_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_12,
    Q => sig_140_13
  );

  reg_140_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_13,
    Q => sig_140_14
  );

  cmpswp_146_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_139_11,
    Y => sig_129_11,
    MIN => sig_146_12,
    MAX => sig_145_12
  );

  cmpswp_148_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_12,
    Y => sig_146_12,
    MIN => sig_148_13,
    MAX => sig_147_13
  );

  cmpswp_151_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_13,
    Y => sig_103_13,
    MIN => sig_151_14,
    MAX => sig_152_14
  );

  cmpswp_155_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_14,
    Y => sig_151_14,
    MIN => sig_155_15,
    MAX => sig_156_15
  );

  sig_out_med <= sig_156_15;
end generated;
