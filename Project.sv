

module Project(SW,KEY,LEDG,CLOCK_50, LEDR, HEX7,HEX6,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);

	input [17:15]SW;
	input [2:1]KEY;
	input CLOCK_50;
	output [2:1]LEDG;
	output [17:15]LEDR;
	output [0:6] HEX3,HEX2,HEX1,HEX0;
	output  [0:6] HEX7,HEX6,HEX5,HEX4;

	wire Clk;
	wire Bo;
	wire Strobe;	
	wire [15:0]IR_out;
	wire [6:0]PC_out;
	wire [3:0]State;
	wire [3:0]NextState;
	wire [15:0]ALU_A;
	wire [15:0]ALU_B;
	wire [15:0]ALU_out;

	
	wire [15:0] DispOut;

	assign LEDG[2]=!KEY[2];
	assign LEDG[1]=!KEY[1];
	assign LEDR=SW;

 
	//module ButtonSync( Clk, Bis, Bo );	
	ButtonSync BS (CLOCK_50, !(KEY[2]),Bo);

//module KeyFilter(Clk, In,Out,Strobe);
	KeyFilter Filter(CLOCK_50, Bo,Clk,Strobe);

//module Processor( Clk, Reset, IR_Out, PC_Out, State, NextState, ALU_A, ALU_B, ALU_Out ); 
	Processor SimpleProcessor( Clk, !(KEY[1]), IR_out, PC_out, State, NextState, ALU_A, ALU_B, ALU_out ); 

//module Decoder(Num,Seg);input[3:0]Num;output logic [0:6]Seg;
	Decoder HexIR3(IR_out[15:12],HEX3);
	Decoder HexIR2(IR_out[11:8],HEX2);
	Decoder HexIR1(IR_out[7:4],HEX1);
	Decoder HexIR0(IR_out[3:0],HEX0);


	//module Mux_8_to_1(f,S,W0,W1,W2,W3,W4,W5,W6,W7);
	Mux_8_to_1 Muxunit0(DispOut,SW,{1'h0,PC_out,4'h0,State},ALU_A,ALU_B,ALU_out,{12'h0,NextState},16'h0,16'h0,16'h0);
	
	Decoder HexDisp7 (DispOut[15:12],HEX7);
	Decoder HexDisp6 (DispOut[11:8],HEX6);
	Decoder HexDisp5 (DispOut[7:4],HEX5);
	Decoder HexDisp4 (DispOut[3:0],HEX4);	
	
	

		
		endmodule
