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

entity median_25 is 
  generic(
    DATA_WIDTH  : integer := 8
  );
  port(
    RESET : in std_logic;
    CLK   : in std_logic;
    
    sig_in : in tkernel(0 to 24,DATA_WIDTH-1 downto 0);
    
    sig_out_med : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture generated of  median_25 is
  signal sig_0_0, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_3_1, sig_3_2, sig_3_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_4_0, sig_5_0, sig_6_0, sig_7_0, sig_7_1, sig_8_0, sig_9_0, sig_10_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_11_0, sig_12_0, sig_13_0, sig_14_0, sig_15_0, sig_16_0, sig_16_1, sig_17_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_17_1, sig_17_2, sig_17_3, sig_18_0, sig_18_1, sig_18_2, sig_19_0, sig_20_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_0, sig_21_1, sig_21_2, sig_22_0, sig_23_0, sig_24_0, sig_25_1, sig_26_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_26_2, sig_26_3, sig_26_4, sig_27_1, sig_28_1, sig_28_2, sig_30_1, sig_29_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_32_2, sig_31_2, sig_33_2, sig_34_2, sig_35_3, sig_36_3, sig_36_4, sig_36_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_36_6, sig_37_1, sig_38_1, sig_39_1, sig_40_1, sig_39_2, sig_41_1, sig_42_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_43_2, sig_44_2, sig_45_1, sig_46_1, sig_47_1, sig_48_1, sig_50_2, sig_49_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_50_3, sig_50_4, sig_51_2, sig_52_2, sig_52_3, sig_53_3, sig_54_3, sig_53_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_53_5, sig_54_4, sig_54_5, sig_54_6, sig_55_4, sig_56_4, sig_58_3, sig_57_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_60_4, sig_59_4, sig_62_3, sig_61_3, sig_61_4, sig_61_5, sig_63_1, sig_64_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_63_2, sig_64_2, sig_64_3, sig_64_4, sig_66_2, sig_65_2, sig_66_3, sig_66_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_67_3, sig_68_3, sig_68_4, sig_69_2, sig_70_2, sig_71_5, sig_72_5, sig_73_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_74_3, sig_75_4, sig_76_4, sig_76_5, sig_76_6, sig_76_7, sig_76_8, sig_77_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_5, sig_81_2, sig_82_2, sig_81_3, sig_81_4, sig_81_5, sig_82_3, sig_82_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_82_5, sig_86_5, sig_85_5, sig_90_5, sig_89_5, sig_90_6, sig_92_5, sig_91_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_91_6, sig_91_7, sig_97_6, sig_98_6, sig_100_6, sig_99_6, sig_101_7, sig_102_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_110_6, sig_109_6, sig_111_7, sig_112_7, sig_111_8, sig_111_9, sig_115_7, sig_116_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_119_6, sig_120_6, sig_120_7, sig_121_8, sig_122_8, sig_122_9, sig_125_8, sig_126_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_133_9, sig_134_9, sig_155_10, sig_156_10, sig_179_6, sig_180_6, sig_190_7, sig_189_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_197_8, sig_198_8, sig_198_9, sig_198_10, sig_205_9, sig_206_9, sig_211_10, sig_212_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_211_11, sig_217_11, sig_218_11, sig_217_12, sig_219_12, sig_220_12, sig_221_13, sig_222_13 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
    sig_19_0(i) <= sig_in(19,i);
    sig_20_0(i) <= sig_in(20,i);
    sig_21_0(i) <= sig_in(21,i);
    sig_22_0(i) <= sig_in(22,i);
    sig_23_0(i) <= sig_in(23,i);
    sig_24_0(i) <= sig_in(24,i);
  end generate;
  reg_2_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Q => sig_2_1
  );

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

  reg_7_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Q => sig_7_1
  );

  reg_16_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_0,
    Q => sig_16_1
  );

  reg_17_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Q => sig_17_1
  );

  reg_17_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_1,
    Q => sig_17_2
  );

  reg_17_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_2,
    Q => sig_17_3
  );

  reg_18_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Q => sig_18_1
  );

  reg_18_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Q => sig_18_2
  );

  reg_21_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_0,
    Q => sig_21_1
  );

  reg_21_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Q => sig_21_2
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_0,
    Y => sig_5_0,
    MIN => sig_25_1,
    MAX => sig_26_1
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

  reg_26_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_3,
    Q => sig_26_4
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_0,
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

  cmpswp_30_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_0,
    Y => sig_20_0,
    MIN => sig_30_1,
    MAX => sig_29_1
  );

  cmpswp_32_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Y => sig_16_1,
    MIN => sig_32_2,
    MAX => sig_31_2
  );

  cmpswp_33_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Y => sig_2_1,
    MIN => sig_33_2,
    MAX => sig_34_2
  );

  cmpswp_35_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_2,
    Y => sig_32_2,
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

  reg_36_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_5,
    Q => sig_36_6
  );

  cmpswp_37_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_12_0,
    Y => sig_6_0,
    MIN => sig_37_1,
    MAX => sig_38_1
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_15_0,
    MIN => sig_39_1,
    MAX => sig_40_1
  );

  reg_39_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Q => sig_39_2
  );

  cmpswp_41_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_0,
    Y => sig_8_0,
    MIN => sig_41_1,
    MAX => sig_42_1
  );

  cmpswp_43_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Y => sig_7_1,
    MIN => sig_43_2,
    MAX => sig_44_2
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_4_0,
    MIN => sig_45_1,
    MAX => sig_46_1
  );

  cmpswp_47_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_13_0,
    MIN => sig_47_1,
    MAX => sig_48_1
  );

  cmpswp_50_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_1,
    Y => sig_45_1,
    MIN => sig_50_2,
    MAX => sig_49_2
  );

  reg_50_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_2,
    Q => sig_50_3
  );

  reg_50_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Q => sig_50_4
  );

  cmpswp_51_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_27_1,
    Y => sig_37_1,
    MIN => sig_51_2,
    MAX => sig_52_2
  );

  reg_52_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_2,
    Q => sig_52_3
  );

  cmpswp_53_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_2,
    Y => sig_44_2,
    MIN => sig_53_3,
    MAX => sig_54_3
  );

  reg_53_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_3,
    Q => sig_53_4
  );

  reg_53_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_53_4,
    Q => sig_53_5
  );

  reg_54_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_3,
    Q => sig_54_4
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

  cmpswp_55_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_3,
    Y => sig_35_3,
    MIN => sig_55_4,
    MAX => sig_56_4
  );

  cmpswp_58_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_2,
    Y => sig_18_2,
    MIN => sig_58_3,
    MAX => sig_57_3
  );

  cmpswp_60_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_3,
    Y => sig_57_3,
    MIN => sig_60_4,
    MAX => sig_59_4
  );

  cmpswp_62_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_2,
    Y => sig_34_2,
    MIN => sig_62_3,
    MAX => sig_61_3
  );

  reg_61_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_3,
    Q => sig_61_4
  );

  reg_61_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_4,
    Q => sig_61_5
  );

  cmpswp_63_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_14_0,
    MIN => sig_63_1,
    MAX => sig_64_1
  );

  reg_63_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_1,
    Q => sig_63_2
  );

  reg_64_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_1,
    Q => sig_64_2
  );

  reg_64_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_2,
    Q => sig_64_3
  );

  reg_64_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_3,
    Q => sig_64_4
  );

  cmpswp_66_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_1,
    Y => sig_40_1,
    MIN => sig_66_2,
    MAX => sig_65_2
  );

  reg_66_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_2,
    Q => sig_66_3
  );

  reg_66_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_3,
    Q => sig_66_4
  );

  cmpswp_67_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_49_2,
    Y => sig_63_2,
    MIN => sig_67_3,
    MAX => sig_68_3
  );

  reg_68_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_3,
    Q => sig_68_4
  );

  cmpswp_69_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_38_1,
    Y => sig_46_1,
    MIN => sig_69_2,
    MAX => sig_70_2
  );

  cmpswp_71_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_4,
    Y => sig_64_4,
    MIN => sig_71_5,
    MAX => sig_72_5
  );

  cmpswp_73_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_69_2,
    Y => sig_39_2,
    MIN => sig_73_3,
    MAX => sig_74_3
  );

  cmpswp_75_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_3,
    Y => sig_74_3,
    MIN => sig_75_4,
    MAX => sig_76_4
  );

  reg_76_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_4,
    Q => sig_76_5
  );

  reg_76_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_5,
    Q => sig_76_6
  );

  reg_76_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_6,
    Q => sig_76_7
  );

  reg_76_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_76_7,
    Q => sig_76_8
  );

  cmpswp_77_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_4,
    Y => sig_75_4,
    MIN => sig_77_5,
    MAX => sig_78_5
  );

  cmpswp_81_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_1,
    Y => sig_30_1,
    MIN => sig_81_2,
    MAX => sig_82_2
  );

  reg_81_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_2,
    Q => sig_81_3
  );

  reg_81_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_3,
    Q => sig_81_4
  );

  reg_81_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_4,
    Q => sig_81_5
  );

  reg_82_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_2,
    Q => sig_82_3
  );

  reg_82_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_3,
    Q => sig_82_4
  );

  reg_82_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_4,
    Q => sig_82_5
  );

  cmpswp_86_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_4,
    Y => sig_26_4,
    MIN => sig_86_5,
    MAX => sig_85_5
  );

  cmpswp_90_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_4,
    Y => sig_59_4,
    MIN => sig_90_5,
    MAX => sig_89_5
  );

  reg_90_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_5,
    Q => sig_90_6
  );

  cmpswp_92_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_4,
    Y => sig_55_4,
    MIN => sig_92_5,
    MAX => sig_91_5
  );

  reg_91_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_5,
    Q => sig_91_6
  );

  reg_91_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_6,
    Q => sig_91_7
  );

  cmpswp_97_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_5,
    Y => sig_72_5,
    MIN => sig_97_6,
    MAX => sig_98_6
  );

  cmpswp_100_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_82_5,
    Y => sig_85_5,
    MIN => sig_100_6,
    MAX => sig_99_6
  );

  cmpswp_101_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_54_6,
    Y => sig_97_6,
    MIN => sig_101_7,
    MAX => sig_102_7
  );

  cmpswp_110_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_61_5,
    Y => sig_86_5,
    MIN => sig_110_6,
    MAX => sig_109_6
  );

  cmpswp_111_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_6,
    Y => sig_110_6,
    MIN => sig_111_7,
    MAX => sig_112_7
  );

  reg_111_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_7,
    Q => sig_111_8
  );

  reg_111_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_8,
    Q => sig_111_9
  );

  cmpswp_115_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_6,
    Y => sig_36_6,
    MIN => sig_115_7,
    MAX => sig_116_7
  );

  cmpswp_119_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_5,
    Y => sig_77_5,
    MIN => sig_119_6,
    MAX => sig_120_6
  );

  reg_120_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_6,
    Q => sig_120_7
  );

  cmpswp_121_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_7,
    Y => sig_120_7,
    MIN => sig_121_8,
    MAX => sig_122_8
  );

  reg_122_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_122_8,
    Q => sig_122_9
  );

  cmpswp_125_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_7,
    Y => sig_115_7,
    MIN => sig_125_8,
    MAX => sig_126_8
  );

  cmpswp_133_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_121_8,
    Y => sig_125_8,
    MIN => sig_133_9,
    MAX => sig_134_9
  );

  cmpswp_155_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_111_9,
    Y => sig_134_9,
    MIN => sig_155_10,
    MAX => sig_156_10
  );

  cmpswp_179_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_5,
    Y => sig_53_5,
    MIN => sig_179_6,
    MAX => sig_180_6
  );

  cmpswp_190_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_180_6,
    Y => sig_100_6,
    MIN => sig_190_7,
    MAX => sig_189_7
  );

  cmpswp_197_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_190_7,
    Y => sig_91_7,
    MIN => sig_197_8,
    MAX => sig_198_8
  );

  reg_198_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_8,
    Q => sig_198_9
  );

  reg_198_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_9,
    Q => sig_198_10
  );

  cmpswp_205_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_126_8,
    Y => sig_76_8,
    MIN => sig_205_9,
    MAX => sig_206_9
  );

  cmpswp_211_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_9,
    Y => sig_122_9,
    MIN => sig_211_10,
    MAX => sig_212_10
  );

  reg_211_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_10,
    Q => sig_211_11
  );

  cmpswp_217_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_198_10,
    Y => sig_156_10,
    MIN => sig_217_11,
    MAX => sig_218_11
  );

  reg_217_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_217_11,
    Q => sig_217_12
  );

  cmpswp_219_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_211_11,
    Y => sig_218_11,
    MIN => sig_219_12,
    MAX => sig_220_12
  );

  cmpswp_221_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_219_12,
    Y => sig_217_12,
    MIN => sig_221_13,
    MAX => sig_222_13
  );

  sig_out_med <= sig_222_13;
end generated;
