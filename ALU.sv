





module ALU ( A, B, s, Q );

	input [2:0] s;
	input [15:0] A, B;
	
	output logic [15:0] Q;
	
		always @*
			case(s)
				0: Q = 16'd0;
				1: Q = (A + B);
				2: if (A < B)
						Q = (B - A); // works
					else
						Q = (A - B);
				3: Q = A;
				4: Q = (A ^ B);
				5: Q = (A | B); // works
				6: Q = (A & B);
				7: Q = (A + 16'd1);
			endcase
			
endmodule

module ALU_tb();

	logic [2:0] s;
	logic [15:0] A, B;
	logic [15:0] Q;

	ALU DUT ( A, B, s, Q );
	
	initial begin

		//integer i;
		A = 16'd10; B = 16'd11; s = 3'd0; #30;
		A = 16'd10; B = 16'd11; s = 3'd1; #30;
		A = 16'd10; B = 16'd11; s = 3'd2; #30;
		A = 16'd10; B = 16'd11; s = 3'd3; #30;
		A = 16'd10; B = 16'd11; s = 3'd4; #30;
		A = 16'd10; B = 16'd11; s = 3'd5; #30;
		A = 16'd10; B = 16'd11; s = 3'd6; #30;
		A = 16'd10; B = 16'd11; s = 3'd7; #30;
		

/*
		for(i = 0; i < 8; i++) begin
	
		   {A, B, s} = $random;
		   #10;
		
		end

	end
	*/
	end
	initial
    	$monitor($time,,,A,,,B,,,s,,,Q);

endmodule