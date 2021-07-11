module data_mem #(parameter DATA_WIDTH = 8, ADDR_WIDTH = 8)
	(input wire clk,
	input wire [3:0] we,
	input wire[(2*DATA_WIDTH-1):0] w_data1, w_data2, w_data3, w_data4,
	input wire[(ADDR_WIDTH-1):0] w_addr1, r_addr1, w_addr2, r_addr2, w_addr3, r_addr3, w_addr4, r_addr4,
	output wire[(DATA_WIDTH-1):0] r_data1, r_data2, r_data3, r_data4);

	//signal declaration
	reg[DATA_WIDTH-1:0] mem [2**ADDR_WIDTH-1:0]; //2D-array for storage
	reg[DATA_WIDTH-1:0] data_reg1, data_reg2, data_reg3, data_reg4; //read output register

//	RAM initialization from an output file
    initial begin
        $display("Loading rom.");
        $readmemh("initial_files/data_mem.txt", mem);
//		  $readmemh("simulation/modelsim/initial_files/data_mem.txt", mem); //if in quartus
    end

	// initial begin
	// 	mem[0] = 8'd4;	//m			15 14 13 12 11 10 9     7 6 5 4 3 2 1 0
	// 	mem[1] = 8'd2;	//n			15 14 13 12 11 10 9     7 6 5 4 3 2 1 0
	// 	mem[2] = 8'd5;	//l
	// 	mem[3] = 8'd1;	//N
	// 	mem[4] = 8'd0;	//p
	// 	mem[5] = 8'd0;	//p
	// 	mem[6] = 8'd0;	//k
	// 	mem[7] = 8'd0;	//k
	// 	mem[8] = 8'd10;	//start
	// 	mem[9] = 8'd70;	//save
	// 	mem[10] = 8'd10;	//val1
	// 	mem[11] = 8'd2;		
	// 	mem[12] = 8'd3;
	// 	mem[13] = 8'd4;
	// 	mem[14] = 8'd5;
	// 	mem[15] = 8'd6;	
	// 	mem[16] = 8'd1;
	// 	mem[17] = 8'd2;
	// 	mem[18] = 8'd3; //val2
	// 	mem[19] = 8'd4;
	// 	mem[20] = 8'd5;
	// 	mem[21] = 8'd6; 
	// 	mem[22] = 8'd7;
	// 	mem[23] = 8'd8;
	// 	mem[24] = 8'd9;
	// 	mem[25] = 8'd10;
	// 	mem[26] = 8'd11;
	// 	mem[27] = 8'd12;
	// 	mem[27] = 8'd0;
	// 	mem[28] = 8'd9;
	// 	mem[29] = 8'd7;
	// 	mem[30] = 8'd3; //val2
	// 	mem[31] = 8'd8;
	// 	mem[32] = 8'd2;
	// 	mem[33] = 8'd3;
	// 	mem[34] = 8'd5;
	// 	mem[35] = 8'd4;
	// 	mem[36] = 8'd0;
	// 	mem[37] = 8'd9;
	// 	mem[38] = 8'd3;
	// 	mem[39] = 8'd9;
	// 	mem[40] = 8'd1;
	// 	mem[41] = 8'd4;
//	end
		
	//body
	//write operation
	always@(posedge clk)
		begin
			if(we[0])
				begin
				mem[w_addr1] <= w_data1[7:0];
				mem[w_addr1+1'b1] <= w_data1[15:8];
				end
			else if(!we[0])
				begin
				data_reg1 <= mem[r_addr1];
				end
			if(we[1])
				begin
				mem[w_addr2] <= w_data2[7:0];
				mem[w_addr2+1'b1] <= w_data2[15:8];
				end
			else if(!we[1])
				begin
				data_reg2 <= mem[r_addr2];
				end
			if(we[2])
				begin
				mem[w_addr3] <= w_data3[7:0];
				mem[w_addr3+1'b1] <= w_data3[15:8];
				end
			else if(!we[2])
				begin
				data_reg3 <= mem[r_addr3];
				end
			if(we[3])
				begin
				mem[w_addr4] <= w_data4[7:0];
				mem[w_addr4+1'b1] <= w_data4[15:8];
				end
			else if(!we[3])
				begin
				data_reg4 <= mem[r_addr4];
				end
		end
		
		//read operation
		assign r_data1 = data_reg1;
		assign r_data2 = data_reg2;
		assign r_data3 = data_reg3;
		assign r_data4 = data_reg4;
endmodule
