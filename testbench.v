// 8-bit microprocessor testbench
module testbench
();

reg [31:0] Imemory[25:0];
reg [31:0] Ememory[25:0];
reg clk;
reg [4:0] address;
wire [7:0] PC,
wire [7:0] ACC,

initial
begin
	$readmemh("testbench.txt",memory);
	clk = 0;
	address = 0;
	#500 $stop;
end

always begin
	#5 clk = ~clk;
end

always @(posedge clk) begin
	address <= address + 1;
	if(expected !== {PC, ACC} || expected === 16'bx)
		$error("INST = %h, expected = %h, recieved = %h\n", INST, expected, {PC, ACC});
	else
		$display($time, " correct results INST = %h, result = %h", INST, {PC, ACC});
end

Micro dut(
	// Outputs
	.PC (PC),
	.ACC (ACC),
	// Inputs
	.INST (),
	.clk (clk),
	.CLB (),
);

endmodule
