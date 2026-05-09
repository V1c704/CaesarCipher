`timescale 1ns / 1ps


module Caesar(
            input logic [7:0]  data_in,
            input logic [7:0]  shift,
            output logic [7:0] data_out
    );
    
    assign data_out = data_in + shift > 8'd90 ?
                      data_in + shift - 8'd26 :
                      data_in + shift;
                      
endmodule
