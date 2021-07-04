module bus(input [4:0] read_en,
 input [7:0] r,
 input [7:0] dr,
 input [15:0] tr,
 input [7:0] pc,
 input [15:0] ac,
 input [7:0] dm,
 input [7:0] im,
 input [7:0] r1,
 input [7:0] r2,
 input [7:0] ri,
 input [7:0] rj,
 input [7:0] rk,
 input [7:0] r3,
 input [7:0] ra,
 input [7:0] rb,
 input [7:0] rc,
 input [7:0] rx,
 
 output [15:0] out ) ;

 reg [15:0] busout;
 assign out = busout;
 
 always @( *)
	begin
	 case(read_en)
	 5'd0: busout <= im ;
	 5'd1: busout <= dm + 8'd0 ;
	 5'd2: busout <= pc;
	 5'd3: busout <= dr;
	 5'd4: busout <= r;
	 5'd5: busout <= ac;
	 5'd6: busout <= tr;
	 5'd7: busout <= r1;
	 5'd8: busout <= r2;
	 5'd9: busout <= ri;
	 5'd10: busout <= rj;
	 5'd11: busout <= rk;
	 5'd12:busout <= r3;
	 5'd13:busout <= ra;
	 5'd14:busout <= rb;
	 5'd15:busout <= rc;
	 5'd16:busout <= rx;
	 default: busout <= 8'd0;
	 endcase
	end
endmodule
