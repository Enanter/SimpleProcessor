


module Mux_16w_2_to_1 (M, S, X, Y);

	input S; // mux select line in
	input [15:0] X, Y; // mux inputs
	output [15:0] M; // mux output
	
	
	assign M = S ? X : Y; // when S=1, M = X; S=0, M=Y

endmodule


module Mux_16w_2_to_1_tb(); // notice: no inputs or outputs

	// you can use whatever names you want for these signals:
	logic S; // mux select line
	logic [15:0] X, Y; // mux inputs
	logic [15:0] M; // mux output

	// instance the mux under testing:
	Mux_16w_2_to_1 DUT( M, S, X, Y );

	initial begin
	X = 0; // all zeros
	Y = 16'hF; // all ones
	S = 0;
	#50; 
	S = 1; // wait 50 time units then change SE to 1
	#50;

	X = 0;
	Y = 16'hF;
	S = 1;
	#50; 
	S = 0;
	#50;

	X = 16'hF;
	Y = 0;
	S = 0;
	#50; 
	S = 1;
	#50;
	
	X = 16'hF;
	Y = 0;
	S = 1;
	#50; 
	S = 0;
	#50;

	//integer k;

   	for (int k=0; k<50; k++) begin
          {X,Y,S} = $random; 
          #50;
	
	end // end for loop
	end //end initial block

	initial begin
	$monitor( X,,, Y,,, S,,, M ); // extra commas cause spaces
	// you can use printf-type format E, M );
	// notice that
	// %b calls for binary output
	// \t is a tab character (whitespace)
	//$monitor( "%b\t%b\t%b\t%b", XIN, YIN, SE, MO );

	end

endmodule