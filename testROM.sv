//TCES330 Spring 2022
//Week 8 Thursday
//example testing 1-port ROM module
//from the IP-catalog

`timescale 1ns/1ns
module testROM();

	logic [6:0]addr;
	logic Clk;
	logic [15:0]Dout;

myROM1 unit0 (
	.address(addr),
	.clock(Clk),
	.q(Dout));

	
	always begin
	  Clk = 0; #10;
	  Clk = 1; #10;
	end
	
	initial begin
	  for (int k=0; k<6; k++) begin
		addr = k; 
	        #20; //notice I use #20 here so the change happens at the falling edge of clk 
		$display($time,,,Dout);
		end
		$stop;
	end
	
	// this segment of the code as testing
	// can verify how many clock cycles 
	// it will take to read the instruction
	// memory
	/*initial begin
		@(negedge Clk)
			addr = 7'd0;
		@(posedge Clk)
		   $display($time,,,Dout);
		@(posedge Clk)
		   $display($time,,,Dout);
		@(posedge Clk)
		   $display($time,,,Dout);
	$stop;
	end
	*/
	

endmodule
