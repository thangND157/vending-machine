module pay(w, s, cr, i1, i2, i5, op2);
input w, s, cr;
input [3:0]i1, i2, i5;
output reg [1:0]op2;
reg [3:0]pri, in;

always @(*) begin
	if (w == 1) //gan gia cho loai nuoc duoc chon
	pri = 7;
	else if (s == 1)
	pri = 9;
	in = i1 + i2*2 + i5*5;
	if (in >= pri)
	op2 = {cr, 1'b1};
	else op2 = {cr, 1'b0};
end

endmodule