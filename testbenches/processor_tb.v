`timescale 1ns/1ps  // time-unit = 1 ns, precision = 1 ps


module processor_tb();
    realtime capture = 0.0;
    reg clk = 1'b1;
    reg [2:0] core_sel = 3'd3;
    wire [7:0] ins1;
    wire [7:0] ins2;
    wire [7:0] ins3;
    wire [7:0] ins4;
    wire [3:0] endop;


    always
        begin
            #10 clk = 1'b0;
            #10 clk = 1'b1;
        end

    always @ (posedge clk)
	    if (endop == 4'd15)
		begin
		    $display("ENDOP Triggered for all cores");
            #100;
            $stop;
            $display("%t", capture);
		end

    localparam period = 20; 

    processor dut(
        .clk(clk),
        .core_sel(core_sel),
        .ins1(ins1),
        .ins2(ins2),
        .ins3(ins3),
        .ins4(ins4),
        .end_op(endop)
    );

    // initial 
    //     begin
    //         #period;

    //         #2000000;
    //         $stop;
    //     end

endmodule


