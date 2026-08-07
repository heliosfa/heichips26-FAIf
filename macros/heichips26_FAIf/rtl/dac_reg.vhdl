-------------------------------------------------------------------------------
-- Title      : DAC register
-- Project    : FABulous Analogue Interface (FAIf) for HeiChips 2026
-------------------------------------------------------------------------------
-- File       : dac_reg.vhdl
-- Author     : Graeme Bragg  <gmb@ecs.soton.ac.uk>
-- Company    : University of Southampton
-- Created    : 2026-08-06
-- Last update: 2026-08-07
-- Platform   : GHDL + Yosys
-- Standard   : VHDL'93/02, Math Packages
-------------------------------------------------------------------------------
-- Description:
--
-- This module implements a DAC register frontend, which takes two 8-bit
-- transfers to produce a 16-bit output to drive a resistor DAC.
-- The module consists of two registers - an 8-bit register for the LSB and a
-- 16-bit register for the combined output (dac_in:dac_lsb)
--
-- When !dac_sel & dac_load, dac_in loaded into the LSB register on rising clk.
-- When dac_sel & dac_load, dac_in is into the upper 8-bits of the 16-bit
-- register and the output of the LSB register is loaded into the lower 8-bits
-- of the 16-bit register on rising clk.
--
-------------------------------------------------------------------------------
-- Copyright (c) 2026 HeiChips 2026 FAIf team
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author    Description
-- 2026-08-06  1.0      heliosfa	Created
-- 2026-08-07  1.0.1    heliosfa	Updated comments 
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity dac_reg is
    port (
      clk          : in  std_logic;                     -- clock
      reset_n      : in  std_logic;                     -- async n_reset
  
      dac_in       : in  std_logic_vector(7 downto 0);  -- 8-bit input
      dac_sel      : in  std_logic;                     -- low/high select
      dac_load     : in  std_logic;                     -- trigger load

      dac_out      : out std_logic_vector(15 downto 0)  -- 16-bit output
    );
end entity dac_reg;

architecture rtl of dac_reg is

    signal dac_rg     : std_logic_vector(15 downto 0);  -- 16-bit register output
    signal dac_lsb    : std_logic_vector(7 downto 0);   -- 8-bit register output (LSB)

begin

  dac_out <= dac_rg;

  REGOUT : process (reset_n, clk) begin
    if reset_n = '0' then
      -- async reset, active low
      dac_rg <= (others => '0');
      dac_lsb <= (others => '0');
    elsif rising_edge(clk) then
        if dac_load = '1' then
          -- Load data into MSB or LSB depending on dac_sel
          if dac_sel = '1' then
            dac_rg <= dac_in & dac_lsb;
          else
            dac_lsb <= dac_in;
          end if;
      end if;
    end if;
  end process;

end architecture;