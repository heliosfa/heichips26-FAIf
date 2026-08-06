library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- 16-Bit DAC register frontend, which takes two 8-bit transfers to produce a 16-bit output.

-- When !dac_sel & dac_load, dac_in is loaded into the LSB register on rising clock.
-- When dac_sel & dac_load, dac_in is into the MSB of dac_out and the LSB register is loaded into the LSB of dac_out on rising clock.

entity dac_reg is
    port (
      clk          : in  std_logic;
      reset_n      : in  std_logic;
  
      dac_in       : in  std_logic_vector(7 downto 0); -- 8-bit input
      dac_sel      : in  std_logic;
      dac_load     : in  std_logic;

      dac_out      : out std_logic_vector(15 downto 0); -- 16-bit output
    );
end entity dac_reg;

architecture rtl of dac_reg is

    signal dac_reg    : std_logic_vector(15 downto 0);
    signal dac_lsb    : std_logic_vector(7 downto 0);

begin

  dac_out <= dac_reg;

  REGOUT : process (reset_n, clk) begin
    if reset_n = '0' then
      -- async reset, active low
      dac_reg <= (others => '0');
      dac_lsb <= (others => '0');
    elsif rising_edge(clk) then
        if dac_load = '1' then
          if dac_sel = '1' then
            dac_reg <= dac_in & dac_lsb;
          else
            dac_lsb <= dac_in;
          end if;
      end if;
    end if;
  end process;

end architecture;