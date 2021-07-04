`timescale 1ns/1ps  // time-unit = 1 ns, precision = 1 ps

module control_unit_tb();

    reg [7:0] dm__in;
    reg [7:0] im_in;
    reg clk;

    wire [15:0] addr; wire dm_wr; wire im_wr;
    wire [15:0] to_mem;

    always
        begin
            #10 clk = 1'd1;
            #10 clk = 1'd0;
        end

    localparam period = 20; 

    processor dut(
        .clk(clk),
        .dm_in(dm_in),
        .im_in(im_in),
        .addr(addr),
        .dm_wr(dm_wr),
        .im_wr(im_wr),
        .to_mem(to_mem)
    );

    initial 
        begin
            #120

            
        end

endmodule


