

// Instruction Register which holds a 16bit data from RAM.

//input 16bit Inst from RAM
//input 1bit Id  from State Machine
//input 1bit Clk from clock generate
//output 16bit IRout to State Machine

//basically 16 of a set of a mux and a D flip flop.
//Id = 1 -> take a 16bit data from Instruction Memory
//Id = 0 -> holding the 16bit data

//how do we get I[PC]? - do we need to make a module I which has inputs of ROM and PC, and output as ROM[PC]?
`timescale 1 ps / 1 ps
module IR(Inst,Clk,Id,IRout);
	input [15:0]Inst;
	input Clk,Id;
	output logic [15:0] IRout;

	
	always_ff @(posedge Clk) begin

		if(Id) IRout <= Inst;	//Mux 2-1 when Id =1
		else IRout <= IRout;		//Mux 2-1 when Id =0
	end	
endmodule


module IR_tb(); 
  
  	logic [15:0]Inst;
	logic Clk,Id;
	logic [15:0] IRout;
	
	always begin  // 50 MHz Clock
	  Clk = 0; #10;
	  Clk = 1'b1; #10;
	end
  
   //active high reset  
	//continuous 1s will be detected
   IR DUT(Inst,Clk,Id,IRout);
  
  initial begin
   #33;  Id=1;Inst=16'b0010_0000_0001_0000; #20; Id=0; #70;
		Inst=16'b0011_0101_0010_0000; Id=1; #20; Id = 0; #100;
					Id =1;#60; Id =0;

	 

    $stop;

  end
  
  
endmodule