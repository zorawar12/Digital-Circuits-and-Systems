`timescale 100ns/100ns
module RisingEdge_DFlipFlop(D,clk,Q);
	input signed [7:0] D; 
	input clk; 
	output reg signed [7:0] Q; 
	always @(posedge clk) 
	begin
		Q <= D;
	end 
endmodule
module tb_DFF();
	reg [7:0] D;
	reg clk;
	wire [7:0] #1500 q1;
	wire [7:0] #1500 q2;
	wire [7:0] #1500 q3;
	wire [7:0] #1500 q4;
	wire [7:0] #1500 q5;
	wire [7:0] #1500 q6;
	wire [7:0] #1500 Q;
	wire [7:0] sin;

	//Initialize clock
	initial begin
		clk=0;
		forever #5 clk = ~clk; //1MHz clock
	end 
	always @ (posedge clk) begin 
		D <= 0;
		#3620;
		D <= 0.5;
		#3620;
		D <= 0.7071067;
		#3620;
		D <= 1;
		#3620;
		D <= 0.7071067;
		#3620;
		D <= 0.5;
		#3620;
		D <= 0;
		#3620;
		D <= -0.5;
		#3620;
		D <= -0.7071067;
		#3620;
		D <= -1;
		#3620;
		D <= -0.7071067;
		#3620;
		D <= -0.5;
		#3620;
		D <= 0;
	end 
	RisingEdge_DFlipFlop FF0(D,clk,q1);
	RisingEdge_DFlipFlop FF1(q1,clk,q2);
	RisingEdge_DFlipFlop FF2(q2,clk,q3);
	RisingEdge_DFlipFlop FF3(q3,clk,q4);
	RisingEdge_DFlipFlop FF4(q4,clk,q5);
	RisingEdge_DFlipFlop FF5(q5,clk,q6);
	RisingEdge_DFlipFlop FF6(q6,clk,Q);

	assign sin = D+q1+q2+q3+q4+q5+q6+Q;
endmodule
