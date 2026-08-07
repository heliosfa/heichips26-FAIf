// Placeholder module for a the FAIf analogue interface.

module analogue_interface (
    input  logic [7:0]  adc_ref,    // ADC Reference
    input  logic        adc_hold,   // ADC Hold
    output logic        adc_comp,   // ADC Comparitor output

    output logic [15:0] dac_out     // DAC output
);

endmodule