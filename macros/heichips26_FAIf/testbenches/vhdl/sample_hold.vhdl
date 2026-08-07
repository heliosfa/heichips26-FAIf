-------------------------------------------------------------------------------
-- Title      : Sample and hold
-- Project    : FABulous Analogue Interface (FAIf) for HeiChips 2026
-------------------------------------------------------------------------------
-- File       : sample_hold.vhdl
-- Author     : Torsten Maehne  <torsten.maehne@bfh.ch>
-- Company    : BFH-EIT
-- Created    : 2026-08-07
-- Last update: 2026-08-07
-- Platform   : GHDL
-- Standard   : VHDL'93/02, Math Packages
-------------------------------------------------------------------------------
-- Description:
--
-- The analogue output follows the analogue input if the hold
-- signal is low. Once hold transitions to high, the analogue input gets
-- sampled and hold for the duration hold stays high.
-------------------------------------------------------------------------------
-- Copyright (c) 2026 HeiChips 2026 FAIf team
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2026-08-07  1.0      maehne	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity sample_hold is
  
  port (
    a_in  : in real;                    -- analogue voltage input / V
    hold  : in std_logic;               -- high-active control input to sample
                                        -- and hold the analogue input
    a_out : out real);                  -- analogue voltage output / V

end entity sample_hold;

architecture bhv of sample_hold is

begin  -- architecture bhv

  a_out <= a_in when hold = '0';

end architecture bhv;
