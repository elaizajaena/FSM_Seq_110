/*============================================
             SEQUENCE 110
==============================================
Description:
This moore FSM detects the overlapping
sequence 110, assuming the input stream arrives LSB-first.

Designer Engineer:
Jaena,Elaiza B.

Date: 
14 April 2026
===============================================*/

 module seq_110(out,state,in,clk,rst_in);
 //ports
		input in;
		input clk;
		input rst_in;
		output reg out;
		output reg [1:0] state;
		 	 
//state assignment	
	localparam [1:0] S0 = 2'b00;
	localparam [1:0] S1 = 2'b01;
	localparam [1:0] S2 = 2'b10;
	localparam [1:0] S3 = 2'b11;
	reg [1:0] nxt;
	reg [1:0] pre;
// input block
	always @(in,pre)begin
		case(pre)
			S0: nxt = in? S0: S1;
			S1: nxt = in? S2: S1;
			S2: nxt = in? S3: S1;
			S3: nxt = in? S0: S1;
			default: nxt = S0;
		endcase
	end
// sequential block
		always @(posedge clk, negedge rst_in)begin
			if(!rst_in) pre = S0;
			else pre = nxt;
		end
//output block
	always@(pre)begin
		case(pre)
			S0: begin 
				out = 0;
				state = S0;
			end
			S1: begin
				out = 0;
				state = S1;
			end
			S2: begin
				 out = 0;
				state = S2;
			end
			S3: begin
				out = 1;
				state = S3;
			end
			default: begin
				out = 0;
				state = S0;
			end
		endcase
	end
 endmodule