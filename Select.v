module select(w, s, ss, sw, op1);
input w, s, ss, sw;
output reg [1:0]op1;

always @(*) begin
	if ((s && ss) || (w && sw))
	op1 <= {s, w};
	else op1 <= 2'b0;
end

endmodule