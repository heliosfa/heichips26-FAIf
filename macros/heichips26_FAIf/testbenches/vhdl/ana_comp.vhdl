-------------------------------------------------------------------------------
-- Title      : Analogue comparator
-- Project    : FABulous Analogue Interface (FAIf) for HeiChips 2026
-------------------------------------------------------------------------------
-- File       : ana_comp.vhdl
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
-- 2026-08-07  1.0      maehne	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ana_comp is
  
  port (
    a_in  : in  real;                   -- analogue input
    a_ref : in  real;                   -- analogue reference input
    comp  : out std_logic);             -- comparison result

end entity ana_comp;

architecture bhv of ana_comp is
  constant INFINITY : real := real'right;
begin  -- architecture bhv

  comp <= 'X' when a_in = INFINITY else
          '1' when a_in >= a_ref else
          '0';

end architecture bhv;
