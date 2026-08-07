// SPDX-FileCopyrightText: 2026 XXX
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Description: SystemVerilog testbench for the heichips26_FAIf module.

`timescale 1ns / 1ps

module heichips26_FAIf_tb;
  // Parameters
  parameter  real CLK_FREQ      = 50.0e6;
  parameter  int  CTR_WIDTH     = 8;
  parameter  int  CTR_MAX       = 2**CTR_WIDTH-1;
  localparam real CLK_PERIOD_NS = 1e9 / CLK_FREQ;

  // Signals
  logic         clk           = 1'b0;
  logic         rst_n         = 1'b1; // active-low reset
  logic         adc_clear     = 1'b0;
  logic         adc_ena       = 1'b0;
  logic         adc_start     = 1'b0;
  logic         adc_done, adc_tick;
  //logic         adc_hold;
  logic [7:0]   adc_value;
  logic [7:0]   adc_ref_out;
  //logic         adc_comp;

  logic [7:0]   dac_in        = 8'b0;
  logic         dac_sel       = 1'b0;
  logic         dac_load      = 1'b0;
  logic [15:0]  dac_out;

  logic         load_config   = 1'b0;

  // Stadard port names
  logic [7:0] ui_in;
  logic [7:0] uo_out;
  logic [7:0] uio_in;
  logic [7:0] uio_out; 
  logic [7:0] uio_oe;

  wire analog_0, analog_1, analog_2;

  assign uio_in[0] = adc_clear;
  assign uio_in[1] = adc_ena;
  assign uio_in[2] = adc_start;
  
  assign adc_done = uio_out[3];
  assign adc_tick = uio_out[4];
  assign adc_value = uo_out;
  
  assign ui_in = dac_in;
  assign uio_in[5] = dac_sel;
  assign uio_in[6] = dac_load;
  assign uio_in[7] = load_config;

  // DUT
  heichips26_FAIf dut_heichips26_FAIf (
    .clk      (clk),
    .rst_n    (rst_n),
    .ena      (1'b1),
    .ui_in    (ui_in),
    .uo_out   (uo_out),
    .uio_in   (uio_in),
    .uio_out  (uio_out),
    .uio_oe   (uio_oe),
    .analog_0 (analog_0),
    .analog_1 (analog_1),
    .analog_2 (analog_2)
  );

  // Clock generation
  /* verilator lint_off STMTDLY */
  always #(CLK_PERIOD_NS / 2) clk = ~clk;
  /* verilator lint_on STMTDLY */

  // Self-checking stimulus
  initial begin
    $dumpfile("heichips26_FAIf_tb.fst");
    $dumpvars;

    // Reset pulse (2 clock cycles)
    rst_n = 1'b0;
    #(2 * CLK_PERIOD_NS);
    rst_n = 1'b1;
    #(CLK_PERIOD_NS);

    // Check that values are 0 after reset
    if (dut_heichips26_FAIf.dac_out !== '0)
      $fatal(1, "FAIL: dac_out not zero after reset (got %0d)", dac_out);

    if (dut_heichips26_FAIf.adc_ref_out !== '0)
      $fatal(1, "FAIL: adc_ref_out not zero after reset (got %0d)", adc_ref_out);
    
    if (adc_value !== '0)
      $fatal(1, "FAIL: adc_value not zero after reset (got %0d)", adc_value);

    // Hold disabled for a few cycles; values must not change
    #(5 * CLK_PERIOD_NS);
    if (dut_heichips26_FAIf.dac_out !== '0)
      $fatal(1, "FAIL: dac_out changed when it should not (got %0d)", dac_out);

    if (dut_heichips26_FAIf.adc_ref_out !== '0)
      $fatal(1, "FAIL: adc_ref_out changed when it should not (got %0d)", adc_ref_out);
    
    if (adc_value !== '0)
      $fatal(1, "FAIL: adc_value changed when it should not (got %0d)", adc_value);

    // Let's load some data dac_reg
    #(5 * CLK_PERIOD_NS);
    dac_in = 8'b00001111;
    dac_load = 1'b1;
    
    #(2 * CLK_PERIOD_NS);
    dac_load = 1'b0;

    #(2 * CLK_PERIOD_NS);
    dac_sel = 1'b1;
    dac_in = 8'b11110000;
    dac_load = 1'b1;

    #(2 * CLK_PERIOD_NS);
    if (dut_heichips26_FAIf.dac_out !== 16'b1111000000001111)
      $fatal(1, "FAIL: dac_out not what we expected (got %0d)", dac_out);

    // Check the SAR

    $display("PASS: simulation complete.");
    $finish;
  end
endmodule // heichips26_FAIf_tb
