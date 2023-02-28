//TCES 330
// Project
//May 25,2022
//Harry

module RF( clk, RF_W_en, RF_W_Addr, wrData, rdAddrA, rdAddrB, rdDataA, rdDataB );

	input clk, RF_W_en;
	
	// write data to specified register
	input [3:0] RF_W_Addr;
	
	// data to be written to register
	input [15:0] wrData;
	
	// register A 4-bit address
	input [3:0] rdAddrA;
	
	// register B 4-bit address
   	input [3:0] rdAddrB;

	output [15:0] rdDataA;
	output [15:0] rdDataB;
	
	//  2-D definition of register
	logic [15:0] regfile [0:15];
	
	// read the registers
	
	assign rdDataA = regfile[rdAddrA];
	assign rdDataB = regfile[rdAddrB];
	
	always_ff @(posedge clk) begin
		
		
		 if(RF_W_en) regfile[RF_W_Addr] <= wrData;
		 //else regfile <= regfile;
		
	end
	
endmodule

module RF_tb();


	logic clk, writeEn;
	
	logic [3:0] wrAddr;
	
	logic [15:0] wrData;
	
	logic [3:0] rdAddrA;
	

   logic [3:0] rdAddrB;

	logic [15:0] rdDataA;
	logic [15:0] rdDataB;
	
	
	RF DUT (clk, writeEn, wrAddr, wrData, rdAddrA, rdAddrB, rdDataA, rdDataB);
	
	always begin 
		clk=1'd0; #10;
		clk=1'd1; #10;
		end
		
		initial begin
		writeEn =1; #3;wrAddr =4'd0; wrData = 16'd10; rdAddrB=4'd1; #20;
		wrAddr =4'd1; wrData = 16'd30;#20;
		writeEn =0; #1;rdAddrA = 4'b0; rdAddrB=4'd1; #20;
		
		$stop;
		end
		endmodule 