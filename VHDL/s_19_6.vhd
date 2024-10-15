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
  signal sig_0_0, sig_0_1, sig_1_0, sig_2_0, sig_2_1, sig_3_0, sig_4_0, sig_5_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_6_0, sig_6_1, sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_12_1, sig_12_2, sig_13_0, sig_14_0, sig_14_1, sig_15_0, sig_16_0, sig_17_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_18_0, sig_20_1, sig_19_1, sig_22_1, sig_21_1, sig_23_1, sig_24_1, sig_24_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_26_2, sig_25_2, sig_26_3, sig_26_4, sig_25_3, sig_25_4, sig_27_1, sig_28_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_29_1, sig_30_1, sig_34_2, sig_33_2, sig_35_2, sig_36_2, sig_36_3, sig_38_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_37_2, sig_37_3, sig_39_3, sig_40_3, sig_41_1, sig_42_1, sig_41_2, sig_42_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_43_3, sig_44_3, sig_43_4, sig_45_3, sig_46_3, sig_45_4, sig_45_5, sig_47_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_4, sig_51_5, sig_52_5, sig_55_2, sig_56_2, sig_55_3, sig_55_4, sig_57_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_58_3, sig_58_4, sig_58_5, sig_58_6, sig_58_7, sig_59_1, sig_60_1, sig_59_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_59_3, sig_61_4, sig_62_4, sig_64_2, sig_63_2, sig_64_3, sig_64_4, sig_65_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_66_3, sig_65_4, sig_65_5, sig_67_5, sig_68_5, sig_72_4, sig_71_4, sig_73_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_74_5, sig_73_6, sig_77_6, sig_78_6, sig_82_7, sig_81_7, sig_83_8, sig_84_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_6, sig_85_6, sig_87_4, sig_88_4, sig_89_2, sig_90_2, sig_89_3, sig_89_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_90_3, sig_90_4, sig_91_5, sig_92_5, sig_91_6, sig_93_7, sig_94_7, sig_93_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_95_5, sig_96_5, sig_95_6, sig_95_7, sig_95_8, sig_97_5, sig_98_5, sig_97_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_97_7, sig_97_8, sig_97_9, sig_97_10, sig_104_8, sig_103_8, sig_107_6, sig_108_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_107_7, sig_107_8, sig_112_9, sig_111_9, sig_112_10, sig_112_11, sig_114_5, sig_113_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_113_6, sig_113_7, sig_113_8, sig_113_9, sig_116_9, sig_115_9, sig_118_9, sig_117_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_117_10, sig_119_6, sig_120_6, sig_119_7, sig_119_8, sig_119_9, sig_120_7, sig_120_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_120_9, sig_124_10, sig_123_10, sig_125_11, sig_126_11, sig_125_12, sig_125_13, sig_126_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_126_13, sig_126_14, sig_127_10, sig_128_10, sig_133_11, sig_134_11, sig_139_12, sig_140_12 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_144_10, sig_143_10, sig_143_11, sig_143_12, sig_150_13, sig_149_13, sig_154_14, sig_153_14 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_156_15, sig_155_15 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_0_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Q => sig_0_1
  );

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

  reg_14_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Q => sig_14_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_4_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  cmpswp_22_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_16_0,
    MIN => sig_22_1,
    MAX => sig_21_1
  );

  cmpswp_23_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_1_0,
    MIN => sig_23_1,
    MAX => sig_24_1
  );

  reg_24_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Q => sig_24_2
  );

  cmpswp_26_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_0_1,
    MIN => sig_26_2,
    MAX => sig_25_2
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

  reg_25_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_2,
    Q => sig_25_3
  );

  reg_25_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_3,
    Q => sig_25_4
  );

  cmpswp_27_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_13_0,
    MIN => sig_27_1,
    MAX => sig_28_1
  );

  cmpswp_29_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_11_0,
    MIN => sig_29_1,
    MAX => sig_30_1
  );

  cmpswp_34_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Y => sig_6_1,
    MIN => sig_34_2,
    MAX => sig_33_2
  );

  cmpswp_35_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Y => sig_30_1,
    MIN => sig_35_2,
    MAX => sig_36_2
  );

  reg_36_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_2,
    Q => sig_36_3
  );

  cmpswp_38_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Y => sig_14_1,
    MIN => sig_38_2,
    MAX => sig_37_2
  );

  reg_37_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_37_2,
    Q => sig_37_3
  );

  cmpswp_39_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_2,
    Y => sig_38_2,
    MIN => sig_39_3,
    MAX => sig_40_3
  );

  cmpswp_41_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_3_0,
    MIN => sig_41_1,
    MAX => sig_42_1
  );

  reg_41_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_1,
    Q => sig_41_2
  );

  reg_42_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_1,
    Q => sig_42_2
  );

  cmpswp_43_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_42_2,
    Y => sig_33_2,
    MIN => sig_43_3,
    MAX => sig_44_3
  );

  reg_43_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_3,
    Q => sig_43_4
  );

  cmpswp_45_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_2,
    Y => sig_34_2,
    MIN => sig_45_3,
    MAX => sig_46_3
  );

  reg_45_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_3,
    Q => sig_45_4
  );

  reg_45_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_4,
    Q => sig_45_5
  );

  cmpswp_47_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_3,
    Y => sig_46_3,
    MIN => sig_47_4,
    MAX => sig_48_4
  );

  cmpswp_51_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_4,
    Y => sig_26_4,
    MIN => sig_51_5,
    MAX => sig_52_5
  );

  cmpswp_55_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_29_1,
    Y => sig_2_1,
    MIN => sig_55_2,
    MAX => sig_56_2
  );

  reg_55_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_2,
    Q => sig_55_3
  );

  reg_55_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_3,
    Q => sig_55_4
  );

  cmpswp_57_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_56_2,
    Y => sig_12_2,
    MIN => sig_57_3,
    MAX => sig_58_3
  );

  reg_58_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_3,
    Q => sig_58_4
  );

  reg_58_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_4,
    Q => sig_58_5
  );

  reg_58_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_5,
    Q => sig_58_6
  );

  reg_58_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_6,
    Q => sig_58_7
  );

  cmpswp_59_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_17_0,
    MIN => sig_59_1,
    MAX => sig_60_1
  );

  reg_59_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_1,
    Q => sig_59_2
  );

  reg_59_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_2,
    Q => sig_59_3
  );

  cmpswp_61_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_59_3,
    Y => sig_57_3,
    MIN => sig_61_4,
    MAX => sig_62_4
  );

  cmpswp_64_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Y => sig_27_1,
    MIN => sig_64_2,
    MAX => sig_63_2
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

  cmpswp_65_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_2,
    Y => sig_41_2,
    MIN => sig_65_3,
    MAX => sig_66_3
  );

  reg_65_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_3,
    Q => sig_65_4
  );

  reg_65_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_4,
    Q => sig_65_5
  );

  cmpswp_67_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_4,
    Y => sig_61_4,
    MIN => sig_67_5,
    MAX => sig_68_5
  );

  cmpswp_72_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_66_3,
    Y => sig_37_3,
    MIN => sig_72_4,
    MAX => sig_71_4
  );

  cmpswp_73_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_4,
    Y => sig_25_4,
    MIN => sig_73_5,
    MAX => sig_74_5
  );

  reg_73_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_5,
    Q => sig_73_6
  );

  cmpswp_77_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_5,
    Y => sig_45_5,
    MIN => sig_77_6,
    MAX => sig_78_6
  );

  cmpswp_82_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_6,
    Y => sig_73_6,
    MIN => sig_82_7,
    MAX => sig_81_7
  );

  cmpswp_83_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_81_7,
    Y => sig_58_7,
    MIN => sig_83_8,
    MAX => sig_84_8
  );

  cmpswp_86_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_5,
    Y => sig_68_5,
    MIN => sig_86_6,
    MAX => sig_85_6
  );

  cmpswp_87_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_40_3,
    Y => sig_36_3,
    MIN => sig_87_4,
    MAX => sig_88_4
  );

  cmpswp_89_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_60_1,
    Y => sig_19_1,
    MIN => sig_89_2,
    MAX => sig_90_2
  );

  reg_89_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_2,
    Q => sig_89_3
  );

  reg_89_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_3,
    Q => sig_89_4
  );

  reg_90_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_2,
    Q => sig_90_3
  );

  reg_90_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_3,
    Q => sig_90_4
  );

  cmpswp_91_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_4,
    Y => sig_62_4,
    MIN => sig_91_5,
    MAX => sig_92_5
  );

  reg_91_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_5,
    Q => sig_91_6
  );

  cmpswp_93_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_85_6,
    Y => sig_91_6,
    MIN => sig_93_7,
    MAX => sig_94_7
  );

  reg_93_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_7,
    Q => sig_93_8
  );

  cmpswp_95_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_71_4,
    Y => sig_90_4,
    MIN => sig_95_5,
    MAX => sig_96_5
  );

  reg_95_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_5,
    Q => sig_95_6
  );

  reg_95_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_6,
    Q => sig_95_7
  );

  reg_95_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_95_7,
    Q => sig_95_8
  );

  cmpswp_97_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_87_4,
    Y => sig_64_4,
    MIN => sig_97_5,
    MAX => sig_98_5
  );

  reg_97_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_5,
    Q => sig_97_6
  );

  reg_97_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_6,
    Q => sig_97_7
  );

  reg_97_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_7,
    Q => sig_97_8
  );

  reg_97_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_8,
    Q => sig_97_9
  );

  reg_97_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_9,
    Q => sig_97_10
  );

  cmpswp_104_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_94_7,
    Y => sig_82_7,
    MIN => sig_104_8,
    MAX => sig_103_8
  );

  cmpswp_107_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_74_5,
    Y => sig_98_5,
    MIN => sig_107_6,
    MAX => sig_108_6
  );

  reg_107_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_6,
    Q => sig_107_7
  );

  reg_107_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_107_7,
    Q => sig_107_8
  );

  cmpswp_112_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_84_8,
    Y => sig_95_8,
    MIN => sig_112_9,
    MAX => sig_111_9
  );

  reg_112_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_9,
    Q => sig_112_10
  );

  reg_112_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_112_10,
    Q => sig_112_11
  );

  cmpswp_114_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_43_4,
    Y => sig_48_4,
    MIN => sig_114_5,
    MAX => sig_113_5
  );

  reg_113_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_5,
    Q => sig_113_6
  );

  reg_113_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_6,
    Q => sig_113_7
  );

  reg_113_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_7,
    Q => sig_113_8
  );

  reg_113_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_8,
    Q => sig_113_9
  );

  cmpswp_116_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_103_8,
    Y => sig_107_8,
    MIN => sig_116_9,
    MAX => sig_115_9
  );

  cmpswp_118_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_93_8,
    Y => sig_83_8,
    MIN => sig_118_9,
    MAX => sig_117_9
  );

  reg_117_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_9,
    Q => sig_117_10
  );

  cmpswp_119_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_5,
    Y => sig_92_5,
    MIN => sig_119_6,
    MAX => sig_120_6
  );

  reg_119_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_6,
    Q => sig_119_7
  );

  reg_119_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_7,
    Q => sig_119_8
  );

  reg_119_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_8,
    Q => sig_119_9
  );

  reg_120_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_6,
    Q => sig_120_7
  );

  reg_120_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_7,
    Q => sig_120_8
  );

  reg_120_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_8,
    Q => sig_120_9
  );

  cmpswp_124_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_9,
    Y => sig_116_9,
    MIN => sig_124_10,
    MAX => sig_123_10
  );

  cmpswp_125_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_117_10,
    Y => sig_123_10,
    MIN => sig_125_11,
    MAX => sig_126_11
  );

  reg_125_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_125_11,
    Q => sig_125_12
  );

  reg_125_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_125_12,
    Q => sig_125_13
  );

  reg_126_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_126_11,
    Q => sig_126_12
  );

  reg_126_12: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_126_12,
    Q => sig_126_13
  );

  reg_126_13: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_126_13,
    Q => sig_126_14
  );

  cmpswp_127_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_120_9,
    Y => sig_115_9,
    MIN => sig_127_10,
    MAX => sig_128_10
  );

  cmpswp_133_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_97_10,
    Y => sig_127_10,
    MIN => sig_133_11,
    MAX => sig_134_11
  );

  cmpswp_139_12: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_134_11,
    Y => sig_112_11,
    MIN => sig_139_12,
    MAX => sig_140_12
  );

  cmpswp_144_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_118_9,
    Y => sig_113_9,
    MIN => sig_144_10,
    MAX => sig_143_10
  );

  reg_143_10: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_10,
    Q => sig_143_11
  );

  reg_143_11: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_11,
    Q => sig_143_12
  );

  cmpswp_150_13: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_143_12,
    Y => sig_139_12,
    MIN => sig_150_13,
    MAX => sig_149_13
  );

  cmpswp_154_14: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_150_13,
    Y => sig_125_13,
    MIN => sig_154_14,
    MAX => sig_153_14
  );

  cmpswp_156_15: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_153_14,
    Y => sig_126_14,
    MIN => sig_156_15,
    MAX => sig_155_15
  );

  sig_out_med <= sig_156_15;
end generated;
