module processor
(
input clk,
output reg [7:0] ins1,
output reg [7:0] ins2,
output reg [7:0] ins3,
output reg [7:0] ins4
);

wire [7:0] dm_out1, dm_out2, dm_out3, dm_out4;
wire [7:0] im_out1, im_out2, im_out3, im_out4;
wire [7:0] addr_out_im1, addr_out_im2, addr_out_im3, addr_out_im4, addr_out_dm1, addr_out_dm2, addr_out_dm3, addr_out_dm4;
wire [15:0] mem_in1, mem_in2, mem_in3, mem_in4;
wire [3:0] dm_we, im_we;

reg [7:0] core_id1 = 8'd0;
reg [7:0] core_id2 = 8'd1;
reg [7:0] core_id3 = 8'd2;
reg [7:0] core_id4 = 8'd3;

core core1(
.dm_in(dm_out1),
.im_in(im_out1),
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
.im_in(im_out2),
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
.im_in(im_out3),
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
.im_in(im_out4),
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
.r_addr4(addr_out_dm4)
);

instr_mem instr_mem1(
.clk(clk),
.we(im_we),
.w_instr1(mem_in1),
.w_instr2(mem_in2),
.w_instr3(mem_in3),
.w_instr4(mem_in4),
.r_instr1(im_out1),
.r_instr2(im_out2),
.r_instr3(im_out3),
.r_instr4(im_out4),
.w_addr1(addr_out_im1),
.w_addr2(addr_out_im2),
.w_addr3(addr_out_im3),
.w_addr4(addr_out_im4),
.r_addr1(addr_out_im1),
.r_addr2(addr_out_im2),
.r_addr3(addr_out_im3),
.r_addr4(addr_out_im4)
);

always @ (posedge clk)
begin
ins1 <= im_out1;
ins2 <= im_out2;
ins3 <= im_out3;
ins4 <= im_out4;
end

endmodule 