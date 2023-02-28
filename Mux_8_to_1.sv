


module Mux_8_to_1(f,S,W0,W1,W2,W3,W4,W5,W6,W7);//Data input [2:0]W0,W1,W2,W3,W4,W5,W6,W7; select input S2,S1,S0; output [2:0]f;
	input [2:0]S;
	input  [15:0]W0,W1,W2,W3,W4,W5,W6,W7;
	output reg [15:0] f;
	
	
	always @* begin
		case(S)
		3'b000:f=W0;
		3'b001:f=W1;
		3'b010:f=W2;
		3'b011:f=W3;
		3'b100:f=W4;
		3'b101:f=W5;
		3'b110:f=W6;
		3'b111:f=W7;
		

		endcase
	end

endmodule

/*
module Mux_3w_8_to_1_tb;
	logic [2:0]S;
	logic [2:0]W0,W1,W2,W3,W4,W5,W6,W7;
	logic [2:0] f;
	//module Mux_3w_8_to_1(f,S,W0,W1,W2,W3,W4,W5,W6,W7);Data input [23:0]W:[0:2]W0[0:2];[3:5]W1;[6:8]W2;[9:11]W3;[12:14]W4;[15:17]W5;[18:20]W6;[21:23]W7; select input [2:0]W; output [2:0]M;
	Mux_3w_8_to_1 DUT(f,S,W0,W1,W2,W3,W4,W5,W6,W7);

	initial begin
		
		W0=0;
		W1=1;
		W2=2;
		W3=3;
		W4=4;
		W5=5;
		W6=6;
		W7=7;
		
		for(int i=0; i<8;i++) begin
		S=i;#10;
		end
	end
endmodule */