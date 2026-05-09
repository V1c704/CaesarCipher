`timescale 1ns / 1ps

module Testbench();

    logic [7:0] data_sent;
    logic [7:0] data_encoded;
    logic [7:0] data_received;
    
    
Caesar encoder(
            .data_in  (data_sent),
            .shift    (8'd13),
            .data_out (data_encoded)
);

Caesar decoder(
            .data_in  (data_encoded),
            .shift    (8'd26 - 8'd13),
            .data_out (data_received)
);

initial begin
    #0 data_sent = "C";
    #1 data_sent = "O";
    #1 data_sent = "M";
    #1 data_sent = "B";
    #1 data_sent = "I";
    #1 data_sent = "N";
    #1 data_sent = "A";
    #1 data_sent = "T";
    #1 data_sent = "I";
    #1 data_sent = "O";
    #1 data_sent = "N";
    #1 data_sent = "A";
    #1 data_sent = "L";
    #1 $stop;
end

endmodule
