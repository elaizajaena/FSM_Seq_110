// testbench for seq_101
module testbench;
//tbh signals
		reg in;
		reg clk;
		reg rst_in;
		wire out;
		wire [1:0] state;


// instantiate seq_101
seq_110 dut (
	.out	  (out),
	.state  (state),
	.in	  (in),
	.clk	  (clk),
	.rst_in  (rst_in)
);

// apply stimuli
		initial clk = 0;
		always #1 clk= ~clk;
		
	initial begin
	 rst_in = 0;
	 repeat (3) @(negedge clk);
	 rst_in = 1;
	 in =0; @(negedge clk);
	 in =1; @(negedge clk);
	 in =1; @(negedge clk);
	 in =0; @(negedge clk);
	 in =1; @(negedge clk);
	 in =1; @(negedge clk);
	 in =1; @(negedge clk);
	 in =0; @(negedge clk);
	 
		
		
	end
endmodule