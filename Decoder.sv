

module Decoder(Num,Seg);

	input [3:0]Num;
	output logic [0:6]Seg;
	
	always @ (Num)
		case (Num) // a logic 0 is the segment is on and a logic 1 means the segment is off
		0: Seg=7'b0000001;	//display 0
		1: Seg=7'b1001111;	//display 1
		2: Seg=7'b0010010;	//display 2
		3: Seg=7'b0000110;	//display 3
		4: Seg=7'b1001100;	//display 4
		5: Seg=7'b0100100;	//display 5
		6: Seg=7'b0100000;	//display 6
		7: Seg=7'b0001111;	//display 7
		8: Seg=7'b0000000;	//display 8
		9: Seg=7'b0000100;	//display 9
		10: Seg=7'b0001000;	//display A
		11: Seg=7'b1100000;	//display B
		12: Seg=7'b0110001;	//display C
		13: Seg=7'b1000010;	//display D 
		14: Seg=7'b0110000;	//display E 
		15: Seg=7'b0111000;	//display F
		default: Seg = 7'b1111111; //Default case: all segments are off
		endcase
endmodule
	