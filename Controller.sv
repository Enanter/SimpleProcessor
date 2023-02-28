

//controller module which contains a instruction memory, instruction register, state machine, and program counter module.
//it takes clock and reset inputs from outside of the proccessor top level module.
//PC_out is out put for the top level module from the program counter module
//State outputs, the opcode, current state, and next state, are for the top level module which show the state info from the state machine module.
//the outputs for datapath module connection are D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0 from the state machine module.



module Controller(Clk,Rst,PC_out,IR_out,OutState,NextState,D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0);
	

	input Clk, Rst;
	
	//current instruction memory address output
	output [6:0]PC_out;	//what address of Inst Mem
	
	//state output
	output logic [15:0] IR_out;	//value of current instruction
	output logic [3:0] NextState;	//opcode of next operation state
	output logic [3:0] OutState;	//opcode of current operation state

	//for datapath module
	output logic [7:0] D_addr;
	output logic D_wr,RF_s,RF_W_en;
	output logic [3:0] RF_W_addr,RF_Ra_addr,RF_Rb_addr;
	output logic [2:0] Alu_s0;

	//internal wires
	wire [6:0]PCaddress; //since PC_out is output, we need a wire.
	wire [15:0]Inst;
	wire [15:0]IRdata;
	wire Id;
	wire PC_up;
	wire PC_clr;


		assign PC_out = PCaddress;
    	assign IR_out = IRdata;

	//module myROM1 (address,clock,q);
	myROM1 IMrom (PCaddress,Clk,Inst);

	//IR(Inst,Clk,Id,IRout);
	IR InstrReg(Inst,Clk,Id,IRdata);

	//module SM(IRdata,Reset,Clk,Id,PC_up,PC_clr,outNextState,OutState,D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0);
		SM FSM(IRdata, Rst, Clk, Id, PC_up, PC_clr,NextState,OutState,  D_addr , D_wr , RF_s, RF_W_addr, RF_W_en, RF_Ra_addr, RF_Rb_addr, Alu_s0);

	//module PC(PC_up,PC_clr,Clk,PCout);
	PC CTR( PC_up, PC_clr, Clk, PCaddress);

endmodule

`timescale 1ns/1ns
module Controller_tb();
	
	reg Clk, Rst;
	
	//current instruction memory address output
	reg [6:0]PC_out;	//what address of Inst Mem
	
	//state output
	reg [15:0] IR_out;	//value of current instruction
	reg [3:0] NextState;	//opcode of next operation state
	reg [3:0] OutState;	//opcode of current operation state

	//for datapath module
	reg [7:0] D_addr;
	reg D_wr,RF_s,RF_W_en;
	reg [3:0] RF_W_addr,RF_Ra_addr,RF_Rb_addr;
	reg [2:0] Alu_s0;

	always begin  // 50 MHz Clock
	  Clk = 0; #10;
	  Clk = 1'b1; #10;
	end

//module Controller(Clk,Rst,PC_out,IR_out,OutState,NextState,D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0);
	Controller DUT(Clk,Rst,PC_out,IR_out,OutState,NextState,D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0);




  initial begin
#3;Rst =0; #20
      Rst =1; #1000;

    Rst = 0; #60;

	 

    $stop;
  end

  
endmodule