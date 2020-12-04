//Controller 
module Controller_FSM(
output wire LoadIR,
output wire IncPC,
output wire SelPC,
output wire LoadPC,
output wire LoadReg,
output wire LoadAcc,
output wire [1:0] SelAcc,
output wire [3:0] SelALU, //First 2 bits will be ALU_sel, next will be load shift

input wire Z,
input wire C,
input wire [3:0] Opcode,

input wire clk,
input wire CLB,
);

//reg [11:0] instr;

always @(posedge clk or CLB) 
begin
    case(Opcode)
        4'b0000: //DO NOTHING

	4'b0001: SelALU <= 4'b1000; //ADD 
		 SelAcc <= 2'b00;
		 LoadAcc <= 1'b1;
		 LoadReg <= 1'b0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR will be taken care of in Micro.v

	4'b0010: SelALU <= 4'b1100; //SUB 
		 SelAcc <= 2'b00;
		 LoadAcc <= 1'b1;
		 LoadReg <= 1'b0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR will be taken care of in Micro.v

	4'b0011: SelALU <= 4'b0100; //NOR 
		 SelAcc <= 2'b00;
		 LoadAcc <= 1'b1;
		 LoadReg <= 1'b0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR will be taken care of in Micro.v

	4'b0100: SelALU <= 4'b0000; // Move rs 
		 SelAcc <= 2'b01;
		 LoadAcc <= 1'b1;
		 LoadReg <= 1'b0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR

	4'b0101: SelALU <= 4'b0000;// Move rd
		 SelAcc <= 2'b00;
		 LoadAcc <= 1'b0;
		 LoadReg <= 1'b1;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR

	4'b0110: if(Z == 1'b1) begin // Jump if zero to reg value
		 	SelALU <= 4'b0000;
		 	SelAcc <= 2'b00;
		 	LoadAcc <= 1'b0;
		 	LoadReg <= 1'b0;
		 	LoadPC <= 1'b1;
		 	SelPC <= 1'b1;
		 	IncPC <= 1'b0;
		 	//LoadIR
		 end

	4'b0111: if(Z == 1'b1) begin // Jump if zero to immediate
		 	SelALU <= 4'b0000;
		 	SelAcc <= 2'b00;
		 	LoadAcc <= 1'b0;
		 	LoadReg <= 1'b0;
		 	LoadPC <= 1'b1;
		 	SelPC <= 1'b0;
		 	IncPC <= 1'b0;
		 	//LoadIR
		 end

	4'b1000: if(C == 1'b1) begin // Jump if Carry to reg value
		 	SelALU <= 4'b0000;
		 	SelAcc <= 2'b00;
		 	LoadAcc <= 1'b0;
		 	LoadReg <= 1'b0;
		 	LoadPC <= 1'b1;
		 	SelPC <= 1'b1;
		 	IncPC <= 1'b0;
		 	//LoadIR
		 end

	4'b1001: // NO CONTENT

	4'b1010: if(C == 1'b1) begin // Jump if carry to immediate
		 	SelALU <= 4'b0000;
		 	SelAcc <= 2'b00;
		 	LoadAcc <= 1'b0;
		 	LoadReg <= 1'b0;
		 	LoadPC <= 1'b1;
		 	SelPC <= 1'b0;
		 	IncPC <= 1'b0;
		 	//LoadIR
		 end


	4'b1011: SelALU <= 4'b0001; // Shift left
		 SelAcc <= 2'b00;
		 LoadAcc <= 1'b1;
		 LoadReg <= 1'b0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR will be taken care of in Micro.v

	4'b1100: SelALU <= 4'b0011; // Shift right
		 SelAcc <= 2'b00;
		 LoadAcc <= 1'b1;
		 LoadReg <= 1'b0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR will be taken care of in Micro.v

	4'b1101: SelALU <= 4'b0000; // Load immediate to accumulator
		 SelAcc <= 2'b10;
		 LoadAcc <= 1'b1;
		 LoadReg <= 1'0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b1;
		 //LoadIR

	4'b1110: // NO CONTENT

	4'b1111: SelALU <= 4'b0000; // HALT
		 SelAcc <= 2'b00;
		 LoadAcc <= 1'b0;
		 LoadReg <= 1'b0;
		 LoadPC <= 1'b0;
		 SelPC <= 1'b0;
		 IncPC <= 1'b0;
		 //LoadIR will be taken care of in Micro.v
    end case
end
endmodule

//reg [7:0] memory[15:0];
//integer i;
//
//always @(posedge clk or CLB)
//begin
//	if(CLB == 1'b0) begin
//		for(i = 0; i < 15; i = i + 1) memory[i][7:0] = 0;
//	end
//	else begin
//		if (LoadReg == 1'b1) memory[RegAddr] <= reg_in;
//	end	
//end
//
//assign reg_out = memory[RegAddr];
