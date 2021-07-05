`timescale 1ns/1ps  // time-unit = 1 ns, precision = 1 ps

module processor_tb();
    reg clk = 1'b1;
    wire [7:0] ins1;
    wire [7:0] ins2;
    wire [7:0] ins3;
    wire [7:0] ins4;


    always
        begin
            #10 clk = 1'b0;
            #10 clk = 1'b1;
        end

    always @ (posedge clk)
	    if (ins1 == 8'd122 && ins2 == 8'd122 && ins3 == 8'd122 && ins4 == 8'd122)
		begin
		    $display("ENDOP Triggered for all cores");
            #100;
            $stop;
		end

    localparam period = 20; 

    processor dut(
        .clk(clk),
        .ins1(ins1),
        .ins2(ins2),
        .ins3(ins3),
        .ins4(ins4)
    );

    // initial 
    //     begin
    //         #period;

    //         #2000000;
    //         $stop;
    //     end

endmodule


