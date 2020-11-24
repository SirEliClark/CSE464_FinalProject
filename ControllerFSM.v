//register file
module reg_file(
output wire LoadIR,
output wire IncPC,
output wire SelPC,
output wire LoadPC,
output wire LoadReg,
output wire LoadAcc,
output wire [1:0] SelAcc,
output wire [3:0] SelALU,


input wire Z,
input wire C,
input wire [3:0] Opcode,

input wire clk,
input wire CLB,
);

reg [11:0] instr;

always @(posedge clk or CLB) 
begin
    case(Opcode)
        4'b0000:
	4'b0001:
	4'b0010:
	4'b0011:
	4'b0100:
	4'b0101:
	4'b0110:
	4'b0111:
	4'b1000:
	4'b1001:
	4'b1010:
	4'b1011:
	4'b1100:
	4'b1101:
	4'b1110:
	4'b1111:
    end case
end

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

endmodule