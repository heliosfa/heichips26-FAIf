-------------------------------------------------------------------------------
-- Title      : Test bench for the analogue comparator
-- Project    : FABulous Analogue Interface (FAIf) for HeiChips 2026
-------------------------------------------------------------------------------
-- File       : ana_comp_tb.vhdl
-- Author     : Torsten Maehne  <torsten.maehne@bfh.ch>
-- Company    : BFH-EIT
-- Created    : 2026-08-07
-- Last update: 2026-08-07
-- Platform   : Intel Quartus Prime 18.1
-- Standard   : VHDL'93/02, Math Packages
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
use ieee.math_real.all;

-------------------------------------------------------------------------------

entity ana_comp_tb is

end entity ana_comp_tb;

-------------------------------------------------------------------------------

architecture bench of ana_comp_tb is

  -- Stimuli parameters
  constant V_DD : real := 3.3;          -- supply voltage / V

  -- Input voltage source
  constant V_IN_AMP  : real         := V_DD / 2.0;     -- amplitude / V
  constant V_IN_OFF  : real         := V_DD / 2.0;     -- offset / V
  constant FREQ_IN   : real         := 100.0e3;        -- frequency / Hz
  constant PERIOD_IN : real         := 1.0 / FREQ_IN;  -- period / s
  constant PHI_IN    : real         := 0.0;            -- phase / °
  constant DT_IN     : delay_length := (PERIOD_IN / 20.0) * 1 sec;  -- input wave time step

  -- Reference voltage source
  constant N_REF       : integer      := 2**4;  -- number of voltage steps
  constant DV_REF      : real         := V_DD / real(N_REF + 1);  -- reference voltage step / V
  constant V_REF_START : real         := DV_REF / 2.0;  -- start voltage / V
  constant V_REF_STOP  : real         := V_DD - V_REF_START;  -- stop voltage / V
  constant DT_REF_STEP : delay_length := PERIOD_IN * 1 sec;  -- time per step / s

  -- component ports
  signal v_in  : real;
  signal v_ref : real;
  signal comp  : std_logic;

begin  -- architecture bench

  duv : entity work.ana_comp
    port map (
      a_in  => v_in,
      a_ref => v_ref,
      comp  => comp);

  -- Stimuli generation
  v_in_gen : process
    variable t : real;                  -- current time / s
  begin
    t := real(now / 1 ns) * 1.0e-9;
    v_in <= V_IN_AMP * sin(MATH_2_PI * FREQ_IN * t + (MATH_2_PI * (PHI_IN / 360.0))) + V_IN_OFF;
    wait for DT_IN;
  end process v_in_gen;

  v_ref_gen : process
  begin
    v_ref <= V_REF_START;
    for i in 2 to N_REF loop
      wait for DT_REF_STEP;
      v_ref <= v_ref + DV_REF;
    end loop;  -- i
    wait for DT_REF_STEP;
    finish;
  end process v_ref_gen;

end architecture bench;

-------------------------------------------------------------------------------
