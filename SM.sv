

//output Id =1 , IR takes a new data

module SM(IRdata,Reset,Clk,Id,PC_up,PC_clr,outNextState,OutState,D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0);
	input [15:0]IRdata;
	input Clk,Reset;
	
	//output [15:0] IR_out;
	output [3:0] OutState;
	output [3:0] outNextState;

	output logic Id,PC_up,PC_clr;
	output logic [7:0] D_addr;
	output logic D_wr,RF_s,RF_W_en;
	output logic [3:0] RF_W_addr,RF_Ra_addr,RF_Rb_addr;
	output logic [2:0] Alu_s0;

	localparam 	Init  = 4'd0,
			Fetch = 4'd1,
			Decode = 4'd2,

			//decode states
				NOOP  = 4'd3,
				Store = 4'd4,
				LoadA = 4'd5,
				LoadB = 4'd6,
				Add   = 4'd7,
				Sub   = 4'd8,
				HALT  = 4'd9;

	logic [3:0] OpCode;
	logic [3:0] CurrentState;
	logic [3:0] NextState;

	//Set a 4'b wire with 4'b opcode from the 16'b instruction to determine the next state after fetch.

	//assign IR_out =  IRdata[15:0];
	assign OpCode = IRdata[15:12];
	assign OutState = CurrentState;
	assign outNextState = NextState;


	always_comb begin

					D_addr=0;
			D_wr=0;
			RF_s=0;
			RF_W_en=0;
			RF_W_addr=0;
			RF_Ra_addr=0;
			RF_Rb_addr=0;
	 		Alu_s0=0;
			PC_up= 0;
			Id =0;
			PC_clr =0;	
		case(CurrentState)


			Init: 	begin
				PC_clr = 1;

				NextState = Fetch;
			end
			Fetch: begin
				PC_up =1;
				Id=1;

				NextState = Decode;
			end
			Decode:	begin

				if(OpCode == 4'd0) NextState = NOOP;
				else if (OpCode ==4'd1)NextState = Store;
				else if (OpCode ==4'd2)NextState = LoadA;//Load A-> Load B
				else if (OpCode ==4'd3)NextState = Add;
				else if (OpCode ==4'd4)NextState = Sub;
				else if (OpCode ==4'd5)NextState = HALT;
				else NextState = Fetch;

				end

			NOOP:	NextState = Fetch;

			Store:	begin
				D_addr     = IRdata[7:0];	//[7:0] = the address for the Data memory data
				D_wr       = 1'b1;			//enable select bit to set D{d7,d6,d5,d4,d3,d2,d1,d0} = RF{s3,s2,s1,s0}.
				RF_Ra_addr = IRdata[11:8];	//[11:8] = the address for the RF data
				PC_up = 0;
				Id=0;

				NextState  = Fetch;
			end
			
			LoadA:	begin
				D_addr    = IRdata[11:4];	//[11:4] = the address for Data memory data
				RF_s      = 1;		//to set the Datapath 16'b 2x1 mux take data from the DataPath RAM
				RF_W_addr = IRdata[3:0]; 	//[3:0] = the address for the RF data.

				NextState = LoadB;
			end
			LoadB:	begin
				D_addr    = IRdata[11:4];	//[11:4] = the address for Data memory data
				RF_s      = 1;		//to set the Datapath 16'b 2x1 mux take data from the DataPath RAM
				RF_W_addr = IRdata[3:0];
				RF_W_en =1'b1;

				NextState = Fetch;
			end
			Add:	begin
				RF_Ra_addr= IRdata[11:8];	//[11:8] = address of source data A in the register file
				RF_Rb_addr= IRdata[7:4];	//[11:8] = address of source data B in the register file
				RF_W_addr = IRdata[3:0];	//[11:8] = address of destination C in the register file
				RF_W_en	  = 1'd1;		//enable the register file to write
				Alu_s0 	  = 3'd1;		//select adding function in alu function 
				RF_s 	  = 1'd0;		//select data in the register file.

				NextState = Fetch;
				end
			
			Sub: begin	
				RF_Ra_addr= IRdata[11:8];	//[11:8] = address of source data A in the register file
				RF_Rb_addr= IRdata[7:4];	//[11:8] = address of source data B in the register file
				RF_W_addr = IRdata[3:0];	//[11:8] = address of destination C in the register file
				RF_W_en	  = 1'd1;		//enable the register file to write
				Alu_s0 	  = 3'd2;		//select adding function in alu function
				RF_s 	  = 1'd0;		//select data in the register file.

				NextState = Fetch;
				end
				
			HALT:	NextState = HALT;


			default: begin 
				NextState = Init;

				D_addr=0;
				D_wr=0;
				RF_s=0;
				RF_W_en=0;
				RF_W_addr=0;
				RF_Ra_addr=0;
				RF_Rb_addr=0;
	 			Alu_s0=0;
				PC_up= 0;
				Id =0;
				PC_clr =0;

			end
		endcase		
	end


  	always_ff @(posedge Clk) begin
      		if (!Reset)	CurrentState <= Init;
     		else 		CurrentState <= NextState;

  	end  

	//assign PC_up 	= !(NextState == Fetch) &&(CurrentState == Fetch);
	//assign Id 	= (CurrentState == Fetch);


	

endmodule
	

module SM_tb(); 
  


	logic [15:0]IRdata;
	logic Clk,Reset;
	
	//output [15:0] IR_out;
	logic [3:0] OutState;
	logic [3:0] outNextState;

	 logic Id,PC_up,PC_clr;
	 logic [7:0] D_addr;
	 logic D_wr,RF_s,RF_W_en;
	 logic [3:0] RF_W_addr,RF_Ra_addr,RF_Rb_addr;
	 logic [2:0] Alu_s0;
	always begin  // 50 MHz Clock
	  Clk = 0; #10;
	  Clk = 1'b1; #10;
	end
//module SM(IRdata,Reset,Clk,Id,PC_up,PC_clr,outNextState,OutState,D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0);
     SM DUT(IRdata,Reset,Clk,Id,PC_up,PC_clr,outNextState,OutState,D_addr,D_wr,RF_s,RF_W_addr,RF_W_en,RF_Ra_addr,RF_Rb_addr,Alu_s0);
  
   
  initial begin
    Reset = 0; #40;  Reset =1;
	//IRdata=16'b0010_0000_0001_0000; #100;
	//IRdata=16'b0011_0101_0010_0000; #100;
	IRdata= 16'h 0000; #100;
	IRdata= 16'h 21A2;#100;
	IRdata= 16'h 22B4;#100;
	IRdata= 16'h 4246;#100;
	IRdata= 16'h 23C8;#100;
	IRdata= 16'h 368A;#100;
	IRdata= 16'h 24DC;#100;
	IRdata= 16'h 4ACE;#100;
	IRdata= 16'h 1E01;#100;
	IRdata= 16'h 5000;#100;
    Reset = 1; #60;

	 

    $stop;
  end

  
endmodule
