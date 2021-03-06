module processor
(
input clk,
input [2:0] core_sel,
output reg [7:0] ins1,
output reg [7:0] ins2,
output reg [7:0] ins3,
output reg [7:0] ins4,
output [3:0] end_op
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
reg [3:0] core_en = 4'b1111;



core core1(
.dm_in(dm_out1),
.im_in(im_out1),
.clk(clk),
.en(core_en[0]),
.core_id(core_id1),
.addr_im(addr_out_im1),
.addr_dm(addr_out_dm1),
.dm_wr(dm_we[0]),
.im_wr(im_we[0]),
.to_mem(mem_in1),
.end_op(end_op[0])
);

core core2(
.dm_in(dm_out2),
.im_in(im_out2),
.clk(clk),
.en(core_en[1]),
.core_id(core_id2),
.addr_im(addr_out_im2),
.addr_dm(addr_out_dm2),
.dm_wr(dm_we[1]),
.im_wr(im_we[1]),
.to_mem(mem_in2),
.end_op(end_op[1])
);

core core3(
.dm_in(dm_out3),
.im_in(im_out3),
.clk(clk),
.en(core_en[2]),
.core_id(core_id3),
.addr_im(addr_out_im3),
.addr_dm(addr_out_dm3),
.dm_wr(dm_we[2]),
.im_wr(im_we[2]),
.to_mem(mem_in3),
.end_op(end_op[2])
);

core core4(
.dm_in(dm_out4),
.im_in(im_out4),
.clk(clk),
.en(core_en[3]),
.core_id(core_id4),
.addr_im(addr_out_im4),
.addr_dm(addr_out_dm4),
.dm_wr(dm_we[3]),
.im_wr(im_we[3]),
.to_mem(mem_in4),
.end_op(end_op[3])
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
ins1 <= addr_out_im1;
ins2 <= addr_out_im2;
ins3 <= addr_out_im3;
ins4 <= addr_out_im4;

case(core_sel[2:0])
    3'd1:
        begin
        core_en = 4'b0001;
        end
    3'd2:
        begin
        core_en = 4'b0011;
        end
    3'd3:
        begin
        core_en = 4'b0111;
        end
    default:
        begin
        core_en = 4'b1111;
        end
endcase
end


endmodule 