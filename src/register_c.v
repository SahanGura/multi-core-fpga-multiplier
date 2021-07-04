module register_c#(parameter data_width = 8)
(input clk,
input [data_width-1:0] data_in, 
output reg[data_width-1:0] data_out);

// initial begin 
// 	data_out = 8'd0;
// end
 
always @(posedge clk)
	begin
		data_out <= data_in;
	end
endmodule