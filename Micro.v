// 8bit Microprocessor file
module Micro(
output wire [7:0] PC,
output wire [7:0] ACC,

input wire [7:0] INST,
input wire clk,
input wire CLB,
);

ControllerFSM dut(
	// Inputs
	.LoadIR (),
	.IncPC (),
	.SelPC (),
	.LoadPC (),
	.LoadReg (),
	.LoadAcc (),
	.SelAcc (),
	.SelALU (),
	// Outputs
	.Z (),
	.C (),
	.Opcode (),
	.clk (clk),
	.CLB (),
);

IR dut(
	// Output
	.I (),
	// Inputs
	.clk (clk),
	.CLB (),
	.LoadIR (),
	.Instruction (),
);

program_counter dut(
	// Output
	.address (),
	// Inputs
	.regIn (),
	.imm (),
	.CLB (),
	.clk (clk),
	.IncPC (),
	.LoadPC (),
	.selPC (),
);

reg_file dut(
	// Output
	.reg_out (),
	// Inputs
	.reg_in (),
	.RegAddr (),
	.clk (clk),
	.CLB (),
	.LadReg (),
);

endmodule
