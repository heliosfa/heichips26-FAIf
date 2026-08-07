-------------------------------------------------------------------------------
-- Title      : Test bench for the Successive Approximation Register
-- Project    : FABulous Analogue Interface (FAIf) for HeiChips 2026
-------------------------------------------------------------------------------
-- File       : sar_tb.vhdl
-- Author     : Torsten Maehne  <torsten.maehne@bfh.ch>
-- Company    : BFH-EIT
-- Created    : 2026-08-06
-- Last update: 2026-08-06
-- Platform   : GHDL
-- Standard   : VHDL-1993
-------------------------------------------------------------------------------
-- Description:
-------------------------------------------------------------------------------
-- Copyright (c) 2026 HeiChips 2026 FAIf team
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2026-08-06  1.0      maehne  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity sar_tb is

end entity sar_tb;

-------------------------------------------------------------------------------

architecture bench of sar_tb is

  -- stimuli parameters
  constant CLK_PERIOD : delay_length := 10 ns;  -- clock period

  -- component generics
  constant NBITS : positive := 8;

  -- component ports
  signal clk   : std_logic := '1';
  signal rst_n : std_logic;
  signal clear : std_logic;
  signal ena   : std_logic;
  signal start : std_logic;
  signal done  : std_logic;
  signal tick  : std_logic;
  signal value : std_logic_vector(NBITS-1 downto 0);
  signal hold  : std_logic;
  signal ref   : std_logic_vector(NBITS-1 downto 0);
  signal comp  : std_logic;

  -- test bench signals
  signal tb_finished : boolean;         -- flag end of tests

begin  -- architecture bench

  duv : entity work.sar(rtl)
    generic map (
      NBITS => NBITS)
    port map (
      clk   => clk,
      rst_n => rst_n,
      clear => clear,
      ena   => ena,
      start => start,
      done  => done,
      tick  => tick,
      value => value,
      hold  => hold,
      ref   => ref,
      comp  => comp);

  -- Clock and reset generation
  clk <= not clk after 10 ns when not tb_finished;
  rst_n <= '1', '0' after 1.25 * CLK_PERIOD, '1' after 1.75 * CLK_PERIOD;

  -- Stimuli generation
  STIM : process
  begin
    -- Wait for reset
    wait until rst_n = '0';
    clear <= '0';
    ena <= '0';
    start <= '0';
    comp <= '0';
    wait until rst_n = '1';
    -- Wait in idle
    wait for 5 * CLK_PERIOD;
    wait until rising_edge(clk);
    -- Start conversion during which `comp` stays always '0'
    ena <= '1';
    start <= '1';
    comp <= '0';
    wait until rising_edge(clk);
    start <= '0';
    wait until done = '1' for NBITS * 10 * CLK_PERIOD;
    wait for 10 * CLK_PERIOD;
    wait until rising_edge(clk);
    -- Start conversion during which `comp` stays always '1'
    ena <= '1';
    start <= '1';
    comp <= '1';
    wait until rising_edge(clk);
    start <= '0';
    wait until done = '1' for NBITS * 10 * CLK_PERIOD;
    wait for 5 * CLK_PERIOD;
    wait until rising_edge(clk);
    -- Disable SAR and try to start conversion
    ena <= '0';
    start <= '1';
    wait for 5 * CLK_PERIOD;
    wait until rising_edge(clk);
    start <= '0';
    -- Clear SAR
    clear <= '1';
    wait until rising_edge(clk);
    clear <= '0';
    wait for 5 * CLK_PERIOD;
    wait until rising_edge(clk);
    -- End of tests
    tb_finished <= true;
    wait;
  end process STIM;

end architecture bench;

-------------------------------------------------------------------------------
