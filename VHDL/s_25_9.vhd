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
  signal sig_0_0, sig_1_0, sig_2_0, sig_3_0, sig_4_0, sig_5_0, sig_6_0, sig_7_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_8_0, sig_9_0, sig_10_0, sig_11_0, sig_12_0, sig_13_0, sig_14_0, sig_15_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_16_0, sig_17_0, sig_17_1, sig_18_0, sig_19_0, sig_19_1, sig_20_0, sig_20_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_21_0, sig_22_0, sig_22_1, sig_23_0, sig_24_0, sig_24_1, sig_26_1, sig_25_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_28_1, sig_27_1, sig_30_1, sig_29_1, sig_30_2, sig_30_3, sig_32_2, sig_31_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_33_1, sig_34_1, sig_33_2, sig_33_3, sig_33_4, sig_33_5, sig_38_2, sig_37_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_38_3, sig_39_2, sig_40_2, sig_45_1, sig_46_1, sig_45_2, sig_46_2, sig_47_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_48_1, sig_48_2, sig_49_3, sig_50_3, sig_52_1, sig_51_1, sig_55_2, sig_56_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_57_1, sig_58_1, sig_61_2, sig_62_2, sig_63_1, sig_64_1, sig_65_2, sig_66_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_67_3, sig_68_3, sig_75_1, sig_76_1, sig_84_2, sig_83_2, sig_83_3, sig_90_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_89_2, sig_92_2, sig_91_2, sig_97_3, sig_98_3, sig_98_4, sig_101_4, sig_102_4 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_106_3, sig_105_3, sig_106_4, sig_106_5, sig_106_6, sig_119_4, sig_120_4, sig_122_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_121_5, sig_124_4, sig_123_4, sig_126_5, sig_125_5, sig_128_4, sig_127_4, sig_136_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_135_6, sig_145_7, sig_146_7, sig_146_8, sig_167_6, sig_168_6, sig_167_7, sig_183_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_184_3, sig_184_4, sig_192_5, sig_191_5, sig_191_6, sig_195_5, sig_196_5, sig_196_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_196_7, sig_196_8, sig_199_6, sig_200_6, sig_199_7, sig_199_8, sig_199_9, sig_199_10 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_205_7, sig_206_7, sig_211_8, sig_212_8, sig_216_9, sig_215_9, sig_218_9, sig_217_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_219_10, sig_220_10, sig_221_11, sig_222_11 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_17_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_17_0,
    Q => sig_17_1
  );

  reg_19_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_0,
    Q => sig_19_1
  );

  reg_20_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_0,
    Q => sig_20_1
  );

  reg_22_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_0,
    Q => sig_22_1
  );

  reg_24_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_0,
    Q => sig_24_1
  );

  cmpswp_26_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_9_0,
    Y => sig_1_0,
    MIN => sig_26_1,
    MAX => sig_25_1
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_5_0,
    MIN => sig_28_1,
    MAX => sig_27_1
  );

  cmpswp_30_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_13_0,
    MIN => sig_30_1,
    MAX => sig_29_1
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

  cmpswp_32_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_24_1,
    Y => sig_27_1,
    MIN => sig_32_2,
    MAX => sig_31_2
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_16_0,
    MIN => sig_33_1,
    MAX => sig_34_1
  );

  reg_33_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_1,
    Q => sig_33_2
  );

  reg_33_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_2,
    Q => sig_33_3
  );

  reg_33_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_3,
    Q => sig_33_4
  );

  reg_33_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_4,
    Q => sig_33_5
  );

  cmpswp_38_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Y => sig_29_1,
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
    X => sig_17_1,
    Y => sig_28_1,
    MIN => sig_39_2,
    MAX => sig_40_2
  );

  cmpswp_45_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Y => sig_23_0,
    MIN => sig_45_1,
    MAX => sig_46_1
  );

  reg_45_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_1,
    Q => sig_45_2
  );

  reg_46_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_1,
    Q => sig_46_2
  );

  cmpswp_47_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_4_0,
    Y => sig_14_0,
    MIN => sig_47_1,
    MAX => sig_48_1
  );

  reg_48_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_1,
    Q => sig_48_2
  );

  cmpswp_49_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_2,
    Y => sig_45_2,
    MIN => sig_49_3,
    MAX => sig_50_3
  );

  cmpswp_52_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_0,
    Y => sig_6_0,
    MIN => sig_52_1,
    MAX => sig_51_1
  );

  cmpswp_55_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_1,
    Y => sig_51_1,
    MIN => sig_55_2,
    MAX => sig_56_2
  );

  cmpswp_57_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_12_0,
    MIN => sig_57_1,
    MAX => sig_58_1
  );

  cmpswp_61_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_1,
    Y => sig_57_1,
    MIN => sig_61_2,
    MAX => sig_62_2
  );

  cmpswp_63_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_3_0,
    MIN => sig_63_1,
    MAX => sig_64_1
  );

  cmpswp_65_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_58_1,
    Y => sig_64_1,
    MIN => sig_65_2,
    MAX => sig_66_2
  );

  cmpswp_67_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_65_2,
    Y => sig_40_2,
    MIN => sig_67_3,
    MAX => sig_68_3
  );

  cmpswp_75_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_11_0,
    Y => sig_7_0,
    MIN => sig_75_1,
    MAX => sig_76_1
  );

  cmpswp_84_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_1,
    Y => sig_75_1,
    MIN => sig_84_2,
    MAX => sig_83_2
  );

  reg_83_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_2,
    Q => sig_83_3
  );

  cmpswp_90_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_20_1,
    Y => sig_52_1,
    MIN => sig_90_2,
    MAX => sig_89_2
  );

  cmpswp_92_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_47_1,
    Y => sig_26_1,
    MIN => sig_92_2,
    MAX => sig_91_2
  );

  cmpswp_97_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_2,
    Y => sig_89_2,
    MIN => sig_97_3,
    MAX => sig_98_3
  );

  reg_98_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_3,
    Q => sig_98_4
  );

  cmpswp_101_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_83_3,
    Y => sig_97_3,
    MIN => sig_101_4,
    MAX => sig_102_4
  );

  cmpswp_106_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_2,
    Y => sig_55_2,
    MIN => sig_106_3,
    MAX => sig_105_3
  );

  reg_106_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_3,
    Q => sig_106_4
  );

  reg_106_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_4,
    Q => sig_106_5
  );

  reg_106_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_106_5,
    Q => sig_106_6
  );

  cmpswp_119_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_105_3,
    Y => sig_50_3,
    MIN => sig_119_4,
    MAX => sig_120_4
  );

  cmpswp_122_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_98_4,
    Y => sig_120_4,
    MIN => sig_122_5,
    MAX => sig_121_5
  );

  cmpswp_124_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_68_3,
    Y => sig_38_3,
    MIN => sig_124_4,
    MAX => sig_123_4
  );

  cmpswp_126_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_101_4,
    Y => sig_124_4,
    MIN => sig_126_5,
    MAX => sig_125_5
  );

  cmpswp_128_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_3,
    Y => sig_30_3,
    MIN => sig_128_4,
    MAX => sig_127_4
  );

  cmpswp_136_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_33_5,
    Y => sig_126_5,
    MIN => sig_136_6,
    MAX => sig_135_6
  );

  cmpswp_145_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_135_6,
    Y => sig_106_6,
    MIN => sig_145_7,
    MAX => sig_146_7
  );

  reg_146_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_7,
    Q => sig_146_8
  );

  cmpswp_167_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_125_5,
    Y => sig_122_5,
    MIN => sig_167_6,
    MAX => sig_168_6
  );

  reg_167_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_167_6,
    Q => sig_167_7
  );

  cmpswp_183_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_91_2,
    Y => sig_46_2,
    MIN => sig_183_3,
    MAX => sig_184_3
  );

  reg_184_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_3,
    Q => sig_184_4
  );

  cmpswp_192_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_119_4,
    Y => sig_102_4,
    MIN => sig_192_5,
    MAX => sig_191_5
  );

  reg_191_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_191_5,
    Q => sig_191_6
  );

  cmpswp_195_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_184_4,
    Y => sig_127_4,
    MIN => sig_195_5,
    MAX => sig_196_5
  );

  reg_196_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_196_5,
    Q => sig_196_6
  );

  reg_196_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_196_6,
    Q => sig_196_7
  );

  reg_196_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_196_7,
    Q => sig_196_8
  );

  cmpswp_199_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_195_5,
    Y => sig_192_5,
    MIN => sig_199_6,
    MAX => sig_200_6
  );

  reg_199_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_6,
    Q => sig_199_7
  );

  reg_199_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_7,
    Q => sig_199_8
  );

  reg_199_8: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_8,
    Q => sig_199_9
  );

  reg_199_9: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_199_9,
    Q => sig_199_10
  );

  cmpswp_205_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_200_6,
    Y => sig_191_6,
    MIN => sig_205_7,
    MAX => sig_206_7
  );

  cmpswp_211_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_205_7,
    Y => sig_167_7,
    MIN => sig_211_8,
    MAX => sig_212_8
  );

  cmpswp_216_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_196_8,
    Y => sig_212_8,
    MIN => sig_216_9,
    MAX => sig_215_9
  );

  cmpswp_218_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_146_8,
    Y => sig_211_8,
    MIN => sig_218_9,
    MAX => sig_217_9
  );

  cmpswp_219_10: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_216_9,
    Y => sig_217_9,
    MIN => sig_219_10,
    MAX => sig_220_10
  );

  cmpswp_221_11: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_219_10,
    Y => sig_199_10,
    MIN => sig_221_11,
    MAX => sig_222_11
  );

  sig_out_med <= sig_222_11;
end generated;
