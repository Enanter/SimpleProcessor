

module KeyFilter(Clk, In,Out,Strobe);
	input Clk;
	input In;
	output reg Out;
	output reg Strobe;

	localparam DUR = 5_000_000-1;
	reg [32:0] Countdown = 0;

	always @ (posedge Clk) begin
		Out <= 0 ;	
		Strobe <= 0;
		if (Countdown == 0 ) begin
			Strobe <=0;
			if(In) begin
				Out <= 1;
				Countdown <= DUR;
			end
		end
		else begin
			Countdown <= Countdown -1;
		end
	end
endmodule
	