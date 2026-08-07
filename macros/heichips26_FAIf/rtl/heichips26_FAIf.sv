// SPDX-FileCopyrightText: © 2026 XXX Authors
// SPDX-License-Identifier: Apache-2.0

// Adapted from the Tiny Tapeout template

`default_nettype none

module heichips26_FAIf (
`ifdef USE_POWER_PINS
    inout  wire VPWR,
    inout  wire VGND,
`endif
    
    input  logic [7:0] ui_in,    // Dedicated inputs
    output logic [7:0] uo_out,   // Dedicated outputs
    input  logic [7:0] uio_in,   // IOs: Input path
    output logic [7:0] uio_out,  // IOs: Output path
    output logic [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  logic       ena,      // always 1 when the design is powered, so you can ignore it
    input  logic       clk,      // clock
    input  logic       rst_n,     // reset_n - low to reset

    // Analogue dedicated outputs
    output wire analog_0, analog_1, analog_2
);

    // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_in[4:3]};


    logic adc_clear, adc_ena, adc_start;
    logic adc_done, adc_tick;
    logic adc_hold;
    logic [7:0] adc_value;
    logic [7:0] adc_ref_out;
    logic adc_comp;

    logic [7:0] dac_in;
    logic dac_sel, dac_load;
    logic [15:0] dac_out;

    logic load_config;

    // Instanciate the DAC Register
    dac_reg dac_reg_instance (
        .clk(clk),
        .reset_n(rst_n),
        .dac_in(dac_in),
        .dac_sel(dac_sel),
        .dac_load(dac_load),
        .dac_out(dac_out)
    );

    sar sar_instance (
        .clk(clk),
        .rst_n(rst_n),
        .clear(adc_clear),
        .ena(adc_ena),
        .start(adc_start),
        .done(adc_done),
        .tick(adc_tick),
        .value(adc_value),
        .hold(adc_hold),
        .ref_out(adc_ref_out),
        .comp(adc_comp)
    );

    analogue_interface analogue_interface_instance (
        .adc_ref(adc_ref_out),
        .adc_hold(adc_hold),
        .adc_comp(adc_comp),
        .dac_out(dac_out),
        .analog_0(analog_0),
        .analog_1(analog_1),
        .analog_2(analog_2)
    );

    assign adc_clear = uio_in[0];
    assign adc_ena = uio_in[1];
    assign adc_start = uio_in[2];
    
    assign uio_out[3] = adc_done;
    assign uio_out[4] = adc_tick;
    assign uo_out = adc_value;
    
    assign dac_in = ui_in;
    assign dac_sel = uio_in[5];
    assign dac_load = uio_in[6];
    assign load_config = uio_in[7];

    assign uio_oe  = 8'b00011000;

endmodule
