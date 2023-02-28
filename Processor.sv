


module Processor( Clk, Reset, IR_Out, PC_Out, State, NextState, ALU_A, ALU_B, ALU_Out ); 
 
	input Clk;              // processor clock 
	input Reset;            // system reset
	
	output [15:0] IR_Out;   // Instruction register 
	output [6:0] PC_Out;    // Program counter 
	output [3:0] State;     // FSM current state 
	output [3:0] NextState; // FSM next state 
	output [15:0] ALU_A;    // ALU A-Side Input 
	output [15:0] ALU_B;    // ALU B-Side Input 
	output [15:0] ALU_Out;  // ALU current output
	
	wire [2:0] ALUSelect;	
	wire [7:0] DAddr;
	wire DWrite;
	wire [3:0] RFAReadAddr;
	wire [3:0] RFBReadAddr;
	wire RFSelect;
	wire [3:0] RFWriteAddr;
	wire RFWriteEnable;
	

	
	// Controller     (Clk,  Rst,   PC_out,IR_out,OutState,NextState, D_addr, D_wr,   RF_s,    RF_W_addr,    RF_W_en,     RF_Ra_addr,   RF_Rb_addr,    Alu_s0);
	
	Controller unit01( Clk, Reset, PC_Out, IR_Out, State, NextState, DAddr, DWrite, RFSelect, RFWriteAddr, RFWriteEnable, RFAReadAddr, RFBReadAddr, ALUSelect );
	
	//module Datapath(ALUSelect, DAddr, Clk, ReadAddrA,   RFSelect, ReadAddrB,   WriteAddr,     RF_W_En,     RAM_En, ALUOut, ALUAIn, ALUBIn );
	
	Datapath unit11 ( ALUSelect, DAddr, Clk, RFAReadAddr, RFSelect, RFBReadAddr, RFWriteAddr, RFWriteEnable, DWrite , ALU_Out, ALU_A, ALU_B );
	
endmodule
	