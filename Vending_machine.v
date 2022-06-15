module vending_machine(w, s, ss, sw, cr, i1, i2, i5, wo, so, o1, o2, o5);
input w, s, ss, sw, cr;
input [3:0]i1, i2, i5;
output wo, so;
output [3:0]o1, o2, o5;
wire [1:0]op1, op2;

select sl(w, s, ss, sw, op1);
pay p(w, s, cr, i1, i2, i5, op2);
change c(op1, op2, i1, i2, i5, wo, so, o1, o2, o5);

endmodule

module tb;
reg w, s, ss, sw, cr;
reg [3:0]i1, i2, i5;
wire wo, so;
wire [3:0]o1, o2, o5;

vending_machine vm(w, s, ss, sw, cr, i1, i2, i5, wo, so, o1, o2, o5);

initial begin
cr = 1; w = 0; s = 1; ss = 0; sw = 1;
i1 = 3; i2 = 1; i5 = 1;
#100
cr = 0; w = 1; s = 0; ss = 1; sw = 0;
i1 = 0; i2 = 1; i5 = 1;
#100
cr = 0; w = 0; s = 1; ss = 0; sw = 1;
i1 = 1; i2 = 0; i5 = 0;
#100
cr = 0; w = 0; s = 1; ss = 1; sw = 1;
i1 = 3; i2 = 0; i5 = 0;
#100
cr = 0; w = 0; s = 1; ss = 1; sw = 1;
i1 = 1; i2 = 1; i5 = 2;

end

endmodule