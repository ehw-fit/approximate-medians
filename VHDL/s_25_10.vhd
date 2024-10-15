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
  signal sig_16_0, sig_17_0, sig_18_0, sig_18_1, sig_19_0, sig_20_0, sig_21_0, sig_22_0 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_23_0, sig_24_0, sig_25_1, sig_26_1, sig_28_1, sig_27_1, sig_30_1, sig_29_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_32_1, sig_31_1, sig_33_1, sig_34_1, sig_36_1, sig_35_1, sig_39_1, sig_40_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_42_2, sig_41_2, sig_44_2, sig_43_2, sig_45_3, sig_46_3, sig_45_4, sig_48_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_47_1, sig_49_1, sig_50_1, sig_53_2, sig_54_2, sig_58_1, sig_57_1, sig_60_2 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_59_2, sig_62_2, sig_61_2, sig_64_1, sig_63_1, sig_64_2, sig_63_2, sig_63_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_68_1, sig_67_1, sig_67_2, sig_70_3, sig_69_3, sig_71_2, sig_72_2, sig_77_3 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_78_3, sig_78_4, sig_88_3, sig_87_3, sig_90_4, sig_89_4, sig_89_5, sig_112_5 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_111_5, sig_124_4, sig_123_4, sig_124_5, sig_133_4, sig_134_4, sig_133_5, sig_133_6 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_140_5, sig_139_5, sig_142_6, sig_141_6, sig_142_7, sig_144_6, sig_143_6, sig_144_7 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal sig_144_8, sig_164_7, sig_163_7, sig_185_8, sig_186_8, sig_221_9, sig_222_9 : std_logic_vector(DATA_WIDTH-1 downto 0);
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
  reg_18_0: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_0,
    Q => sig_18_1
  );

  cmpswp_25_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_8_0,
    Y => sig_17_0,
    MIN => sig_25_1,
    MAX => sig_26_1
  );

  cmpswp_28_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_19_0,
    Y => sig_24_0,
    MIN => sig_28_1,
    MAX => sig_27_1
  );

  cmpswp_30_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_10_0,
    Y => sig_20_0,
    MIN => sig_30_1,
    MAX => sig_29_1
  );

  cmpswp_32_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_22_0,
    Y => sig_12_0,
    MIN => sig_32_1,
    MAX => sig_31_1
  );

  cmpswp_33_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_1_0,
    Y => sig_23_0,
    MIN => sig_33_1,
    MAX => sig_34_1
  );

  cmpswp_36_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_21_0,
    Y => sig_7_0,
    MIN => sig_36_1,
    MAX => sig_35_1
  );

  cmpswp_39_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_5_0,
    Y => sig_14_0,
    MIN => sig_39_1,
    MAX => sig_40_1
  );

  cmpswp_42_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_32_1,
    Y => sig_28_1,
    MIN => sig_42_2,
    MAX => sig_41_2
  );

  cmpswp_44_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_39_1,
    Y => sig_30_1,
    MIN => sig_44_2,
    MAX => sig_43_2
  );

  cmpswp_45_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_41_2,
    Y => sig_43_2,
    MIN => sig_45_3,
    MAX => sig_46_3
  );

  reg_45_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_45_3,
    Q => sig_45_4
  );

  cmpswp_48_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_0_0,
    Y => sig_4_0,
    MIN => sig_48_1,
    MAX => sig_47_1
  );

  cmpswp_49_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_6_0,
    Y => sig_13_0,
    MIN => sig_49_1,
    MAX => sig_50_1
  );

  cmpswp_53_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_18_1,
    Y => sig_34_1,
    MIN => sig_53_2,
    MAX => sig_54_2
  );

  cmpswp_58_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_16_0,
    Y => sig_11_0,
    MIN => sig_58_1,
    MAX => sig_57_1
  );

  cmpswp_60_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_25_1,
    Y => sig_49_1,
    MIN => sig_60_2,
    MAX => sig_59_2
  );

  cmpswp_62_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_57_1,
    Y => sig_35_1,
    MIN => sig_62_2,
    MAX => sig_61_2
  );

  cmpswp_64_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_2_0,
    Y => sig_9_0,
    MIN => sig_64_1,
    MAX => sig_63_1
  );

  reg_64_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_1,
    Q => sig_64_2
  );

  reg_63_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_1,
    Q => sig_63_2
  );

  reg_63_2: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_2,
    Q => sig_63_3
  );

  cmpswp_68_1: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_15_0,
    Y => sig_3_0,
    MIN => sig_68_1,
    MAX => sig_67_1
  );

  reg_67_1: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_67_1,
    Q => sig_67_2
  );

  cmpswp_70_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_64_2,
    Y => sig_53_2,
    MIN => sig_70_3,
    MAX => sig_69_3
  );

  cmpswp_71_2: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_48_1,
    Y => sig_33_1,
    MIN => sig_71_2,
    MAX => sig_72_2
  );

  cmpswp_77_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_62_2,
    Y => sig_67_2,
    MIN => sig_77_3,
    MAX => sig_78_3
  );

  reg_78_3: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_3,
    Q => sig_78_4
  );

  cmpswp_88_3: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_72_2,
    Y => sig_59_2,
    MIN => sig_88_3,
    MAX => sig_87_3
  );

  cmpswp_90_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_77_3,
    Y => sig_87_3,
    MIN => sig_90_4,
    MAX => sig_89_4
  );

  reg_89_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_89_4,
    Q => sig_89_5
  );

  cmpswp_112_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_90_4,
    Y => sig_45_4,
    MIN => sig_112_5,
    MAX => sig_111_5
  );

  cmpswp_124_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_63_3,
    Y => sig_69_3,
    MIN => sig_124_4,
    MAX => sig_123_4
  );

  reg_124_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_4,
    Q => sig_124_5
  );

  cmpswp_133_4: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_46_3,
    Y => sig_88_3,
    MIN => sig_133_4,
    MAX => sig_134_4
  );

  reg_133_4: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_4,
    Q => sig_133_5
  );

  reg_133_5: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_5,
    Q => sig_133_6
  );

  cmpswp_140_5: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_78_4,
    Y => sig_134_4,
    MIN => sig_140_5,
    MAX => sig_139_5
  );

  cmpswp_142_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_140_5,
    Y => sig_89_5,
    MIN => sig_142_6,
    MAX => sig_141_6
  );

  reg_142_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_142_6,
    Q => sig_142_7
  );

  cmpswp_144_6: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_124_5,
    Y => sig_111_5,
    MIN => sig_144_6,
    MAX => sig_143_6
  );

  reg_144_6: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_6,
    Q => sig_144_7
  );

  reg_144_7: entity work.reg generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_144_7,
    Q => sig_144_8
  );

  cmpswp_164_7: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_133_6,
    Y => sig_143_6,
    MIN => sig_164_7,
    MAX => sig_163_7
  );

  cmpswp_185_8: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_163_7,
    Y => sig_142_7,
    MIN => sig_185_8,
    MAX => sig_186_8
  );

  cmpswp_221_9: entity work.med_swp generic map(DATA_WIDTH  => DATA_WIDTH) port map(
    RESET => RESET,
    CLK   => CLK,
    X => sig_185_8,
    Y => sig_144_8,
    MIN => sig_221_9,
    MAX => sig_222_9
  );

  sig_out_med <= sig_222_9;
end generated;
