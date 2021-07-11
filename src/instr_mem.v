module instr_mem #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 8)
	(input clk,
	input wire [3:0] we,
	input wire[(2*DATA_WIDTH-1):0] w_instr1, w_instr2, w_instr3, w_instr4,
	input wire[(ADDR_WIDTH-1):0] w_addr1, r_addr1, w_addr2, r_addr2, w_addr3, r_addr3, w_addr4, r_addr4,
	output wire[(DATA_WIDTH-1):0] r_instr1, r_instr2, r_instr3, r_instr4);


	//signal declaration
	reg[DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0]; //2D-array for storage
	reg[DATA_WIDTH-1:0] data_reg1, data_reg2, data_reg3, data_reg4;

	// //RAM initialization from an output file
	// initial
	// 	$readmemh("initialRAM.txt",mem);
		
	parameter LDACI = 8'd0;
	parameter LDAC = 8'd1;
	parameter LDARR1 = 8'd2;
	parameter LDARR2 = 8'd3;
	parameter MVAC = 8'd4;
	parameter MVACRi = 8'd5;
	parameter MVACRj = 8'd6;
	parameter MVACRk = 8'd7;
	parameter MVACR1 = 8'd8;
	parameter MVACR2 = 8'd9;
	parameter ADDTR = 8'd10;
	parameter ADDR1 = 8'd11;
	parameter ADDR2 = 8'd12;
	parameter STACI = 8'd13;
	parameter STTR = 8'd14;
	parameter MULT = 8'd15;
	parameter MULTRi = 8'd16;
	parameter MULTRj = 8'd17;
	parameter MULTRk = 8'd18;
	parameter SUB = 8'd19;
	parameter SUBRi = 8'd20;
	parameter SUBRj = 8'd21;
	parameter SUBRk = 8'd22;
	parameter CLRR = 8'd23;
	parameter CLRAC = 8'd24;
	parameter CLRTR = 8'd25;
	parameter INAC = 8'd26;
	parameter JPNZ = 8'd27;
	parameter ENDOP = 8'd28;
	parameter LDACRi = 8'd29;
	parameter LDACRj = 8'd30;
	parameter LDACRk = 8'd31;
	parameter LDACR3 = 8'd32;
	parameter MVACR3 = 8'd33;
	parameter LDACRa = 8'd34;
	parameter LDACRb = 8'd35;
	parameter MVACRa = 8'd36;
	parameter MVACRb = 8'd37;
	parameter CLRR1 = 8'd38;
	parameter CLRR2 = 8'd39;
	parameter LDACRc = 8'd40;
	parameter LDACRx = 8'd41;
	parameter ADDRx = 8'd42;
	parameter MVACRx = 8'd43;
	parameter SUBRx = 8'd44;
	parameter INTDIVRx = 8'd45;
	parameter MODRx = 8'd46;
	parameter JMPZ = 8'd47;
	parameter NOP = 8'd48;
		
		
	// MultiCore Instruction set to be executed
	initial begin
	mem[0] = LDACI;
	mem[1] = 8'd0; //m
	mem[2] = MVAC;
	mem[3] = LDACI;
	mem[4] = 8'd1; //n
	mem[5] = MULT;
	mem[6] = MVACR3;

	mem[7] = LDACI;	//calculate x
	mem[8] = 8'd3;	//N
	mem[9] = MVACRi;
	mem[10] = LDACI;
	mem[11] = 8'd4; //p
	mem[12] = MULTRi;

	mem[13] = MVACRx;
	mem[14] = LDACRc;
	mem[15] = ADDRx;

	//new conditional statement
	mem[16] = LDACI;	
	mem[17] = 8'd0; //m
	mem[18] = MVAC;
	mem[19] = LDACI;
	mem[20] = 8'd2; //l
	mem[21] = MULT; 
	mem[22] = SUBRx;
	mem[23] = JMPZ;
	mem[24] = 8'd121;

	mem[25] = LDACI;	//calculate x	inner loop p
	mem[26] = 8'd3;	//N
	mem[27] = MVACRi;
	mem[28] = LDACI;
	mem[29] = 8'd4; //p
	mem[30] = MULTRi;

	mem[31] = MVACRx;
	mem[32] = LDACRc;
	mem[33] = ADDRx;

	mem[34] = LDACI;	//calculate i
	mem[35] = 8'd2;	//l
	mem[36] = INTDIVRx;
	mem[37] = MVACRi;
	mem[38] = LDACI;
	mem[39] = 8'd1;	//	n
	mem[40] = MULTRi;
	mem[41] = MVACRa;
	
	mem[42] = LDACI;	//calculate j
	mem[43] = 8'd2;	//l
	mem[44] = MODRx;
	mem[45] = MVACRj;
	mem[46] = LDACI;
	mem[47] = 8'd1;	//	n
	mem[48] = MULTRj;
	mem[49] = MVACRb;

	mem[50] = CLRAC;
	mem[51] = STACI;
	mem[52] = 8'd6;	//k

	mem[53] = LDACRa;	//loop3
	mem[54] = MVACR1;	
	mem[55] = LDACRb;	
	mem[56] = MVACR2;	
	mem[57] = LDACI;
	mem[58] = 8'd6; //k
	mem[59] = MVACRk;
	mem[60] = ADDR1;
	mem[61] = LDACRk;
	mem[62] = ADDR2;
	mem[63] = LDACI;
	mem[64] = 8'd8; //val1 loc
	mem[65] = ADDR1;
	mem[66] = LDARR1;
	mem[67] = LDAC;
	mem[68] = MVAC;	
	mem[69] = LDACI;
	mem[70] = 8'd8; //val1 loc
	mem[71] = ADDR2;
	mem[72] = LDACR3;
	mem[73] = ADDR2;
	mem[74] = LDARR2;
	mem[75] = LDAC;
	mem[76] = MULT;
	mem[77] = ADDTR;
	mem[78] = LDACRk;	
	mem[79] = INAC;
	mem[80] = MVACRk;
	mem[81] = STACI;
	mem[82] = 8'd6; //k
	mem[83] = LDACI;
	mem[84] = 8'd1; //n
	mem[85] = CLRR;
	mem[86] = SUBRk;
	mem[87] = JPNZ;	
	mem[88] = 8'd53; //inner loop ends here				//SHOULD CHANGE THIS
	mem[89] = LDACRj;
	mem[90] = MVACR1;
	mem[91] = LDACI;
	mem[92] = 8'd9; // st val1 loc
	mem[93] = ADDR1;
	mem[94] = LDACRi;
	mem[95] = MVAC;
	mem[96] = LDACI;
	mem[97] = 8'd2;	//l
	mem[98] = MULT;
	mem[99] = ADDR1;
	mem[100] = ADDR1;
	mem[101] = LDARR1;
	mem[102] = STTR;
	mem[103] = CLRTR;

	mem[104] = LDACI;
	mem[105] = 8'd4; //p
	mem[106] = INAC;
	mem[107] = STACI;
	mem[108] = 8'd4; //p
	mem[109] = LDACI; 
	mem[110] = 8'd3; //N
	mem[111] = ADDRx; 
	mem[112] = LDACI;	
	mem[113] = 8'd0; //m
	mem[114] = MVAC;
	mem[115] = LDACI;
	mem[116] = 8'd2; //l
	mem[117] = MULT; 
	mem[118] = SUBRx;
	mem[119] = JPNZ;
	mem[120] = 8'd25; // loop p	

	mem[121] = ENDOP;
		
	end


	always@(posedge clk)
		begin
			if(we[0])
				begin
				mem[w_addr1] <= w_instr1[7:0];
				mem[w_addr1+1'b1] <= w_instr1[15:8];
				end
			else if(!we[0])
				begin
				data_reg1 <= mem[r_addr1];
				end
			if(we[1])
				begin
				mem[w_addr2] <= w_instr2[7:0];
				mem[w_addr2+1'b1] <= w_instr2[15:8];
				end
			else if(!we[1])
				begin
				data_reg2 <= mem[r_addr2];
				end
			if(we[2])
				begin
				mem[w_addr3] <= w_instr3[7:0];
				mem[w_addr3+1'b1] <= w_instr3[15:8];
				end
			else if(!we[2])
				begin
				data_reg3 <= mem[r_addr3];
				end
			if(we[3])
				begin
				mem[w_addr4] <= w_instr4[7:0];
				mem[w_addr4+1'b1] <= w_instr4[15:8];
				end
			else if(!we[3])
				begin
				data_reg4 <= mem[r_addr4];
				end
		end
		
		//read operation
		assign r_instr1 = data_reg1;
		assign r_instr2 = data_reg2;
		assign r_instr3 = data_reg3;
		assign r_instr4 = data_reg4;

endmodule
