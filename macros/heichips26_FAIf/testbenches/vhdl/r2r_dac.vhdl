-------------------------------------------------------------------------------
-- Title      : R-2R Digital-to-Analogue Converter (DAC)
-- Project    : FABulous Analogue Interface (FAIf) for HeiChips 2026
-------------------------------------------------------------------------------
-- File       : r2r_dac.vhdl
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
-- 2026-08-07  1.0      maehne	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity r2r_dac is
  
  generic (
    NBITS : positive := 8;              -- DAC resolution / bit
    V_DD  : real     := 3.3);           -- supply voltage / V

  port (
    value : in  std_logic_vector(NBITS-1 downto 0);  -- digital input value
    a_out : out real);                               -- output voltage / V

end entity r2r_dac;

architecture bhv of r2r_dac is
  constant N_STEP  : integer := 2**NBITS;       -- number of voltage steps
  constant DV_STEP : real    := V_DD / real(N_STEP + 1);  -- DAC voltage step / V
  constant V_LOW   : real    := DV_STEP / 2.0;  -- lowest output voltage / V
begin  -- architecture bhv

  -- purpose: calculate output voltage
  -- type   : combinational
  -- inputs : value
  -- outputs: a_out
  v_out: process (value) is
  begin  -- process v_out
    a_out <= DV_STEP * real(to_integer(unsigned(value))) + V_LOW;
  end process v_out;

end architecture bhv;
