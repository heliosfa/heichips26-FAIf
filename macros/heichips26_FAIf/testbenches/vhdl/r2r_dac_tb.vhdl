-------------------------------------------------------------------------------
-- Title      : Test bench for the R-2R Digital-to-Analogue Converter (DAC)
-- Project    : FABulous Analogue Interface (FAIf) for HeiChips 2026
-------------------------------------------------------------------------------
-- File       : r2r_dac_tb.vhdl
-- Author     : Torsten Maehne  <torsten.maehne@bfh.ch>
-- Company    : BFH-EIT
-- Created    : 2026-08-07
-- Last update: 2026-08-07
-- Platform   : GHDL
-- Standard   : VHDL-2008
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2026 HeiChips 2026 FAIf team
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2026-08-07  1.0      maehne  Created
-------------------------------------------------------------------------------

use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity r2r_dac_tb is

end entity r2r_dac_tb;

-------------------------------------------------------------------------------

architecture bench of r2r_dac_tb is
  
  -- component generics
  constant NBITS : positive := 8;
  constant V_DD  : real     := 3.3;

  -- stimuli parameters
  constant CLK_PERIOD : delay_length := 10 ns;  -- clock period
  constant T_SIM : delay_length := 2 * 2**NBITS * CLK_PERIOD;  -- time to be simulated

  -- component ports
  signal value : std_logic_vector(NBITS-1 downto 0) := (others => '0');
  signal a_out : real;

begin  -- architecture bench

  duv : entity work.r2r_dac
    generic map (
      NBITS => NBITS,
      V_DD  => V_DD)
    port map (
      value => value,
      a_out => a_out);

  stimuli : process
  begin
    wait for CLK_PERIOD;
    value <= std_logic_vector(unsigned(value) + 1);
  end process stimuli;

  end_sim : process
  begin
    wait for T_SIM;
    finish;
  end process end_sim;
  
end architecture bench;

-------------------------------------------------------------------------------
