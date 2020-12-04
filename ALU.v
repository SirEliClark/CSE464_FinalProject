
module ALU (
input [7:0] a, b;
input [1:0] ALU_sel, load_shift;

output[7:0] result;
output cout, zout;
);

wire cout, zout;
reg [8:0] r;
reg rC;
reg rZ;

always @(a or b or ALU_sel or load_shift) begin
	case(ALU_sel) 
		2'b10: r <= a + b; //ADD
		2'b11: r <= a - b; //SUB
		2'b01: r <= ~(a | b); //NOR
		2'b00: begin
			case(load_shift)
				2'b11: r <= a >> 1; //SHR
				2'b01: r <= a << 1; //SHL
				2'b10: r <= a; //LD
				2'b00: r <= 0; //RST
			endcase
		end
		/****Complete the code here*****/
	endcase
	rC <= r[8];
	zC <= (r[7:0] == 0) ? 1:0;

end

assign cout = rC;//r[8];
assign result = r[7:0]; /*Complete the code here***/
assign zout = zC; //(r[7:0] == 0) ? 1:0; /*Complete the code here*/

endmodule

