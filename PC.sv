

//PC counter. input PC_up = 1 -> addressI = addressI +1
//output addressI : 0~127 counter.

//input PC_up and PC_clr from the State Machine.
//input clk is from clock generator
//output PC to I

//PC_clr\PC_up 	: 0 		1
//.........................
//   0		: PC=PC		PC=PC+1
//   1		: PC=0		x (it shouldn't happen but if it happens PC =0)



//extra credit, add a jumping port (8'b) from the State Machine(similiar to lab6 part2)
`timescale 1 ps / 1 ps
module PC(PC_up,PC_clr,Clk,PCout);
	input PC_up,PC_clr,Clk;
	output reg [6:0]PCout;

	always_ff @(posedge Clk) begin
	
		if(PC_clr)PCout <=0;
		else if(PC_up && (PCout < 7'd127)) PCout <= PCout+7'd1;
		else if(PC_up && (PCout == 7'd127)) PCout <=0;
		else PCout <= PCout;

	end
endmodule

module PC_tb();

	logic PC_up,PC_clr,Clk;
	logic [6:0] PCout;
	
	always begin  // 50 MHz Clock
	  Clk = 0; #10;
	  Clk = 1'b1; #10;
	end

	PC DUT(PC_up,PC_clr,Clk,PCout);

 initial begin
	#20;
    PC_clr = 1; #33; PC_clr=0;  PC_up = 1;#100;
	PC_up = 0; #100;
	PC_up = 1; #4000;
	PC_clr = 1; #20;
	PC_clr=0;  PC_up = 1;#100;


	 

    $stop;
  end

  
endmodule