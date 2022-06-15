module change(op1, op2, i1, i2, i5, wo, so, o1, o2, o5);
input [1:0]op1, op2;
input [3:0]i1, i2, i5;
output reg wo, so;
output reg [3:0]o1, o2, o5;
reg [3:0]pri, in;

always @(*) begin
	case (op1)
		2'b01: pri = 7; //gan lai gia
		2'b10: pri = 9;
	endcase
	if ((op1 == 2'b00) || op2[1] || (op2[0] == 0)) begin
		o1 <= i1;
		o2 <= i2;
		o5 <= i5;
		wo <= 0;
		so <= 0;
	end
	else if (op2[0]) begin
		in = i1 + i2*2 + i5*5 - pri;
		o5 <= in/5;
		o2 <= in%5/2;
		o1 <= in%5%2;
		{so, wo} <= op1;
	end
end

endmodule