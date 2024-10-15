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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_3_1, sig_4_0, sig_5_0, sig_6_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_7_0, sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0, sig_14_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_15_0, sig_16_0, sig_17_0, sig_18_0, sig_20_1, sig_19_1, sig_20_2, sig_21_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_22_1, sig_24_1, sig_23_1, sig_25_1, sig_26_1, sig_26_2, sig_28_1, sig_27_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_30_1, sig_29_1, sig_32_1, sig_31_1, sig_32_2, sig_31_2, sig_35_1, sig_36_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_35_2, sig_40_2, sig_39_2, sig_44_2, sig_43_2, sig_50_3, sig_49_3, sig_51_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_52_3, sig_52_4, sig_52_5, sig_54_2, sig_53_2, sig_56_2, sig_55_2, sig_58_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_1, sig_58_2, sig_62_2, sig_61_2, sig_63_2, sig_64_2, sig_67_3, sig_68_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_67_4, sig_67_5, sig_67_6, sig_71_3, sig_72_3, sig_73_4, sig_74_4, sig_78_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_77_3, sig_77_4, sig_77_5, sig_77_6, sig_77_7, sig_83_3, sig_84_3, sig_85_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_86_4, sig_100_5, sig_99_5, sig_100_6, sig_110_5, sig_109_5, sig_113_6, sig_114_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_115_7, sig_116_7, sig_119_8, sig_120_8, sig_119_9, sig_147_7, sig_148_7, sig_148_8 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_151_9, sig_152_9, sig_155_10, sig_156_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_3_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_3_0,
    Q => sig_3_1
  );

  cmpswp_20_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_2_0,
    MIN => sig_20_1,
    MAX => sig_19_1
  );

  reg_20_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Q => sig_20_2
  );

  cmpswp_21_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_14_0,
    Y => sig_17_0,
    MIN => sig_21_1,
    MAX => sig_22_1
  );

  cmpswp_24_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_7_0,
    Y => sig_16_0,
    MIN => sig_24_1,
    MAX => sig_23_1
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_18_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  reg_26_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_1,
    Q => sig_26_2
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_12_0,
    MIN => sig_28_1,
    MAX => sig_27_1
  );

  cmpswp_30_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_4_0,
    MIN => sig_30_1,
    MAX => sig_29_1
  );

  cmpswp_32_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_13_0,
    MIN => sig_32_1,
    MAX => sig_31_1
  );

  reg_32_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_1,
    Q => sig_32_2
  );

  reg_31_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_1,
    Q => sig_31_2
  );

  cmpswp_35_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_6_0,
    MIN => sig_35_1,
    MAX => sig_36_1
  );

  reg_35_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_35_1,
    Q => sig_35_2
  );

  cmpswp_40_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_1,
    Y => sig_3_1,
    MIN => sig_40_2,
    MAX => sig_39_2
  );

  cmpswp_44_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_23_1,
    Y => sig_22_1,
    MIN => sig_44_2,
    MAX => sig_43_2
  );

  cmpswp_50_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_31_2,
    Y => sig_39_2,
    MIN => sig_50_3,
    MAX => sig_49_3
  );

  cmpswp_51_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Y => sig_44_2,
    MIN => sig_51_3,
    MAX => sig_52_3
  );

  reg_52_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_3,
    Q => sig_52_4
  );

  reg_52_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_52_4,
    Q => sig_52_5
  );

  cmpswp_54_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_30_1,
    Y => sig_25_1,
    MIN => sig_54_2,
    MAX => sig_53_2
  );

  cmpswp_56_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_28_1,
    Y => sig_24_1,
    MIN => sig_56_2,
    MAX => sig_55_2
  );

  cmpswp_58_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_11_0,
    MIN => sig_58_1,
    MAX => sig_57_1
  );

  reg_58_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_1,
    Q => sig_58_2
  );

  cmpswp_62_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_36_1,
    Y => sig_29_1,
    MIN => sig_62_2,
    MAX => sig_61_2
  );

  cmpswp_63_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_1,
    Y => sig_27_1,
    MIN => sig_63_2,
    MAX => sig_64_2
  );

  cmpswp_67_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_2,
    Y => sig_53_2,
    MIN => sig_67_3,
    MAX => sig_68_3
  );

  reg_67_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_3,
    Q => sig_67_4
  );

  reg_67_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_4,
    Q => sig_67_5
  );

  reg_67_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_5,
    Q => sig_67_6
  );

  cmpswp_71_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_26_2,
    Y => sig_62_2,
    MIN => sig_71_3,
    MAX => sig_72_3
  );

  cmpswp_73_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_3,
    Y => sig_71_3,
    MIN => sig_73_4,
    MAX => sig_74_4
  );

  cmpswp_78_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_2,
    Y => sig_35_2,
    MIN => sig_78_3,
    MAX => sig_77_3
  );

  reg_77_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_3,
    Q => sig_77_4
  );

  reg_77_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_4,
    Q => sig_77_5
  );

  reg_77_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_5,
    Q => sig_77_6
  );

  reg_77_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_6,
    Q => sig_77_7
  );

  cmpswp_83_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_55_2,
    Y => sig_58_2,
    MIN => sig_83_3,
    MAX => sig_84_3
  );

  cmpswp_85_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_50_3,
    Y => sig_84_3,
    MIN => sig_85_4,
    MAX => sig_86_4
  );

  cmpswp_100_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_86_4,
    Y => sig_74_4,
    MIN => sig_100_5,
    MAX => sig_99_5
  );

  reg_100_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_100_5,
    Q => sig_100_6
  );

  cmpswp_110_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_73_4,
    Y => sig_85_4,
    MIN => sig_110_5,
    MAX => sig_109_5
  );

  cmpswp_113_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_109_5,
    Y => sig_52_5,
    MIN => sig_113_6,
    MAX => sig_114_6
  );

  cmpswp_115_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_114_6,
    Y => sig_100_6,
    MIN => sig_115_7,
    MAX => sig_116_7
  );

  cmpswp_119_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_115_7,
    Y => sig_77_7,
    MIN => sig_119_8,
    MAX => sig_120_8
  );

  reg_119_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_8,
    Q => sig_119_9
  );

  cmpswp_147_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_113_6,
    Y => sig_67_6,
    MIN => sig_147_7,
    MAX => sig_148_7
  );

  reg_148_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_7,
    Q => sig_148_8
  );

  cmpswp_151_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_148_8,
    Y => sig_120_8,
    MIN => sig_151_9,
    MAX => sig_152_9
  );

  cmpswp_155_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_9,
    Y => sig_151_9,
    MIN => sig_155_10,
    MAX => sig_156_10
  );

  sig_out_med <= sig_156_10;
end generated;
