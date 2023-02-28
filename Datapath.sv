

module Datapath( ALUSelect, DAddr, Clk, ReadAddrA, RFSelect, ReadAddrB, WriteAddr, RF_W_En, RAM_En, ALUOut, ALUAIn, ALUBIn );

	input [2:0] ALUSelect;	// ALU select bit
	input [7:0] DAddr; 		// to RAM
	input Clk;					//clock
	input [3:0] ReadAddrA;  //RF address A
	input RFSelect;			//Mux select
	input [3:0] ReadAddrB;	//RF address B
	input [3:0] WriteAddr;	// RF address to write
	input RF_W_En;				//RF write enable
	input RAM_En;				//RAM write data
	output [15:0] ALUOut;	//ALU result
	output [15:0] ALUAIn;	//ALU input A
	output [15:0] ALUBIn;	//ALU input B
	
	wire [15:0] q;
	wire [15:0] WriteData;
	wire [15:0] RDataA;
	wire [15:0] RDataB;
	wire [15:0] Write_RData;
	wire [15:0] RDataOut; // RAM output
	
	assign ALUOut = q;
	assign ALUAIn = RDataA;
	assign ALUBIn = RDataB;
	
     //module myRAM1(address,clock,data,   wren,  q);
	myRAM1 unit0( DAddr, Clk, RDataA, RAM_En, RDataOut );
	
	//module Mux_16w_2_to_1(M, S, X, Y);
	Mux_16w_2_to_1 mxunit0( WriteData, RFSelect, RDataOut, q );

//	module RF( clk, RF_W_en, RF_W_Addr, wrData, rdAddrA, rdAddrB, rdDataA, rdDataB );

	RF unit2 ( Clk, RF_W_En, WriteAddr, WriteData, ReadAddrA, ReadAddrB, RDataA, RDataB ); 

	
	//module ALU ( A, B, s, Q );
	ALU unit3 ( RDataA, RDataB, ALUSelect, q );

	

endmodule

`timescale 1ps/1ps
module Datapath_tb();

	
	logic [2:0] ALUSelect;
	logic [7:0] DAddr; // to RAM
	logic Clk;
	logic [3:0] ReadAddrA;
	logic RFSelect;
	logic [3:0] ReadAddrB;
	logic [3:0] WriteAddr;
	logic RF_En, Write_En;
	
	logic [15:0] ALUOut;
	logic [15:0] ALUAIn;
	logic [15:0] ALUBIn;
	
	Datapath DUT ( ALUSelect, DAddr, Clk, ReadAddrA, RFSelect, ReadAddrB, WriteAddr, RF_En, Write_En, ALUOut, ALUAIn, ALUBIn );
	
	always begin
		
		Clk = 0; #10;
		Clk = 1; #10;
		
	end
	
	initial begin
	
	/*
		ALUSelect = 0;
		RFSelect = 1;
		DAddr = 8'h1A;
		ReadAddrA = 0;
		ReadAddrB = 1;
		WriteAddr = 0;
		Write_En = 0;
		#20;
		RF_En = 1;
		#110;
		
		DAddr = 1;
		WriteAddr = 1;
		#100;
		
		ALUSelect = 1;	logic [2:0] ALUSelect;
	logic [7:0] DAddr; // to RAM
	logic Clk;
	logic [3:0] ReadAddrA;
	logic RFSelect;
	logic [3:0] ReadAddrB;
	logic [3:0] WriteAddr;
	logic RF_En, Write_En;
	
	logic [15:0] ALUOut;
	logic [15:0] ALUAIn;
	logic [15:0] ALUBIn;
	
		RFSelect = 0;
		WriteAddr = 2;
		#100;
		ALUSelect = 0;
		DAddr = 9;
		Write_En = 1;
		RF_En = 0;
		ReadAddrA = 2;
		ReadAddrB = 0;
		WriteAddr = 0;
		#100;
		
*/

	ALUSelect=0;
	DAddr=0; 
	Clk=0;
	ReadAddrA=0;
	RFSelect=0;
	ReadAddrB=0;
	WriteAddr=0;
	RF_En =0;
	Write_En=0;
	
	ALUOut=0;
	ALUAIn=0;
	ALUBIn=0;
	
		#3;
		// LoadA
		DAddr = 8'h1A;
		RFSelect = 1;
		WriteAddr = 4'h0;
		#20;

		//LoadB
		RF_En = 1;
		#20;

		//LoadA (part 2) with another address in RAM
		DAddr = 8'h2B;
		RFSelect = 1;
		WriteAddr = 4'h1;
		#20;

		//LoadB (part 2)
		RF_En = 1;
		#20;
		
		//Add
		ReadAddrA = 4'h0;
		ReadAddrB = 4'h1;
		WriteAddr = 4'h2;
		Write_En = 1;
		ALUSelect = 3'b1;
		RFSelect = 0;
		#20;
		//sub
		ReadAddrA = 4'h0;
		ReadAddrB = 4'h1;
		WriteAddr = 4'h3;
		Write_En = 1;
		ALUSelect = 3'd2;
		RFSelect = 0;
		#20;
		//Store
		DAddr = 8'h1;
		Write_En = 1;
		ReadAddrA = 4'h3;
		#20;
		
		
		$stop;
	end
	
	initial
		$monitor($time,,,"ALUOut = %d\t ALUAIn = %d \t ALUBIn = %d", ALUOut, ALUAIn, ALUBIn);
		
endmodule
	
