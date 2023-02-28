//TCES 330
//May 30, 2022
//Harry J.

`timescale 1ns/100ps
module testRAM();

 logic Clk, Wren;
 logic [15:0]Din;
 logic [15:0]Dout;
 logic [7:0]Addr;

myRAM1 dut(
	.address(Addr),
	.clock(Clk),
	.data(Din),
	.wren(Wren),
	.q(Dout));
	 
	always begin
	
	 Clk = 0; #10;
	 Clk = 1; #10;
	
	end

	initial begin
	 #1;
	 Addr = 16'h1A;
	 Wren = 1'b1;
	 //Din = 8'd33;
	 #60;
	Addr = 16'h2B;
	 Wren = 1'b1;
	 //Din = 8'd33;
	 #60;
	Addr = 16'h3C;
	 Wren = 1'b1;
	 //Din = 8'd33;
	 #60;
	Addr = 16'h4D;
	 Wren = 1'b1;
	 //Din = 8'd33;
	 #60;
 $stop;
	end
	
	
	 
	 initial $monitor($time,,,Addr,,,Wren,,,Din,,,Dout);
	 
	
endmodule