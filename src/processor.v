module processor
(
input clk,
output reg [7:0] ins
);

wire [7:0] dm_out1, dm_out2, dm_out3, dm_out4;
wire [7:0] im_out;
wire [7:0] addr_out_im, addr_out_im2, addr_out_im3, addr_out_im4, addr_out_dm1, addr_out_dm2, addr_out_dm3, addr_out_dm4;
wire [15:0] mem_in1, mem_in2, mem_in3, mem_in4;
wire [3:0] dm_we, im_we;

reg core_id1 = 5'd0;
reg core_id2 = 5'd1;
reg core_id3 = 5'd2;
reg core_id4 = 5'd3;


core core1(
.dm_in(dm_out1),
.im_in(im_out),
.clk(clk),
.core_id(core_id1),
.addr_im(addr_out_im1),
.addr_dm(addr_out_dm1),
.dm_wr(dm_we[0]),
.im_wr(im_we[0]),
.to_mem(mem_in1)
);

core core2(
.dm_in(dm_out2),
.im_in(im_out),
.clk(clk),
.core_id(core_id2),
.addr_im(addr_out_im2),
.addr_dm(addr_out_dm2),
.dm_wr(dm_we[1]),
.im_wr(im_we[1]),
.to_mem(mem_in2)
);

core core3(
.dm_in(dm_out3),
.im_in(im_out),
.clk(clk),
.core_id(core_id3),
.addr_im(addr_out_im3),
.addr_dm(addr_out_dm3),
.dm_wr(dm_we[2]),
.im_wr(im_we[2]),
.to_mem(mem_in3)
);

core core4(
.dm_in(dm_out4),
.im_in(im_out),
.clk(clk),
.core_id(core_id4),
.addr_im(addr_out_im4),
.addr_dm(addr_out_dm4),
.dm_wr(dm_we[3]),
.im_wr(im_we[3]),
.to_mem(mem_in4)
);

data_mem data_mem1(
.clk(clk),
.we(dm_we),
.w_data1(mem_in1),
.w_data2(mem_in2),
.w_data3(mem_in3),
.w_data4(mem_in4),
.r_data1(dm_out1),
.r_data2(dm_out2),
.r_data3(dm_out3),
.r_data4(dm_out4),
.w_addr1(addr_out_dm1),
.w_addr2(addr_out_dm2),
.w_addr3(addr_out_dm3),
.w_addr4(addr_out_dm4),
.r_addr1(addr_out_dm1),
.r_addr2(addr_out_dm2),
.r_addr3(addr_out_dm3),
.r_addr4(addr_out_dm4),
);

instr_mem instr_mem1(
.clk(clk),
.we(im_we),
.w_instr(mem_in),
.r_instr(im_out),
.w_addr(addr_out_im),
.r_addr(addr_out_im)
);

always @ (posedge clk)
begin
ins <= im_out;
end

endmodule 