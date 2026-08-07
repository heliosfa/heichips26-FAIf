-------------------------------------------------------------------------------
-- Title      : Testbench for design "sample_hold"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : sample_hold_tb.vhdl
-- Author     : Torsten Maehne  <torsten.maehne@bfh.ch>
-- Company    : BFH-EIT
-- Created    : 2026-08-07
-- Last update: 2026-08-07
-- Platform   : Intel Quartus Prime 18.1
-- Standard   : VHDL'93/02, Math Packages
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2026 BFH-EIT
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2026-08-07  1.0      maehne  Created
-------------------------------------------------------------------------------

use std.env.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.math_real.all;

-------------------------------------------------------------------------------

entity sample_hold_tb is

end entity sample_hold_tb;

-------------------------------------------------------------------------------

architecture bench of sample_hold_tb is

  -- Stimuli parameters
  constant V_DD : real := 3.3;          -- supply voltage / V

  -- Input voltage source
  constant V_IN_AMP  : real         := V_DD / 2.0;     -- amplitude / V
  constant V_IN_OFF  : real         := V_DD / 2.0;     -- offset / V
  constant FREQ_IN   : real         := 100.0e3;        -- frequency / Hz
  constant PERIOD_IN : real         := 1.0 / FREQ_IN;  -- period / s
  constant PHI_IN    : real         := 0.0;            -- phase / °
  constant DT_IN     : delay_length := (PERIOD_IN / 1000.0) * 1 sec;  -- input wave time step

  -- Conversion
  constant CLK_PERIOD : delay_length := 10 ns;
  constant SAMPLING_PERIOD : positive := 10;  -- sampling period / clock cycles
  constant CONVERSION_DURATION : positive := 8;  -- conversion duration / clock cycles
  constant N_CONVERSION : positive := 256;  -- Number of conversions to simulate
  -- Component ports
  signal a_in  : real;
  signal hold  : std_logic := '0';
  signal a_out : real;

begin  -- architecture bench

  -- component instantiation
  DUT : entity work.sample_hold
    port map (
      a_in  => a_in,
      hold  => hold,
      a_out => a_out);

  -- Stimuli generation
  v_in_gen : process
    variable t : real;                  -- current time / s
  begin
    t := real(now / 1 ns) * 1.0e-9;
    a_in <= V_IN_AMP * sin(MATH_2_PI * FREQ_IN * t + (MATH_2_PI * (PHI_IN / 360.0))) + V_IN_OFF;
    wait for DT_IN;
  end process v_in_gen;

  hold_gen : process
  begin
    for i in 1 to N_CONVERSION loop
      hold <= '0';
      wait for 1 * CLK_PERIOD;
      hold <= '1';
      wait for CONVERSION_DURATION * CLK_PERIOD;
      hold <= '0';
      wait for 1 * CLK_PERIOD;
    end loop;  -- i in 1 to N_CONVERSION
    finish;
  end process hold_gen;

end architecture bench;

-------------------------------------------------------------------------------
