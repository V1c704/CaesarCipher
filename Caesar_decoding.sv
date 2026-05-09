`timescale 1ns / 1ps

module Caesar_decoding(
                input logic [7:0]  data_sent,
                output logic [7:0] data_received
    );
    
    logic [7:0] data_encoded;
    
    Caesar encoder(
            .data_in(data_sent), 
            .shift(shift_code),   
            .data_out(data_encoded) 
    );
    
    Caesar decoder(
            .data_in(data_encoded), 
            .shift(shift_decode),   
            .data_out(data_received) 
    );
    
    assign shift_decode = 26 - shift_code;
    
endmodule
