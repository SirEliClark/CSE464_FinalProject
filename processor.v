// 8bit Microprocessor file
module processor(
output wire [7:0] PC,
output wire [7:0] ACC,

input wire [7:0] INST,
input wire clk,
input wire CLB,

);


wire wLoadIR;
wire wIncPC;
wire wSelPC;
wire wLoadPC;
wire wLoadReg;
wire wLoadAcc;
wire [1:0] wSelAcc;
wire [3:0] wSelALU;
wire [7:0] wI;
wire [7:0] wReg;
wire wZ;
wire wC;
wire [7:0] wALU_out;
wire [7:0] wAcc_out;

controller dut(
	// Outputs
	.LoadIR (wLoadIR),
	.IncPC (wIncPC),
	.SelPC (wSelPC),
	.LoadPC (wLoadPC),
	.LoadReg (wLoadReg),
	.LoadAcc (wLoadAcc),
	.SelAcc (wSelAcc),
	.SelALU (wSelALU),
	// Inputs
	.Z (wZ),
	.C (wC),
	.Opcode (wI[7:4]),
	.clk (clk),
	.CLB (CLB),
);

IR dut(
	// Output
	.I (wI),
	// Inputs
	.clk (clk),
	.CLB (CLB),
	.LoadIR (wLoadIR),
	.Instruction (INST),
);

program_counter dut(
	// Output
	.address (PC),
	// Inputs
	.regIn (wReg),
	.imm (wI[3:0]), //?? 
	.CLB (CLB),
	.clk (clk),
	.IncPC (wIncPC),
	.LoadPC (wLoadPC),
	.selPC (wSelPC),
);

ACC dut(
	//Output
	.acc_out(wAcc_out),

	//Inputs
	.ALU(wALU_out),
	.reg_file(wReg),
	.imm(wI[3:0]),
	.SelAcc(wSelAcc),
	.loadAcc(wLoadAcc),
	.clk(clk),
	.CLB(CLB)
);

ALU dut(
	//Inputs
	.a(wAcc_out),
	.b(wReg),
	.ALU_sel(wSelALU[3:2]),
	.load_shift(wSelALU[1:0]),
	//Outputs
	.result(wALU_out),
	.cout(wC),
	.zout(wZ)

);

reg_file dut(
	// Output
	.reg_out (wReg),
	// Inputs
	.reg_in (wAcc_out),
	.RegAddr (wI[3:0]),
	.clk (clk),
	.CLB (CLB),
	.LoadReg (wLoadReg),
);

endmodule
