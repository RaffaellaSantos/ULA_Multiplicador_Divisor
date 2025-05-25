module ULA_8b(
	input [7:0] A, B,
	input x, y,
	output [3:0] flag,
	output [7:0] saida
);
	
	// Operações como signed
	wire signed [7:0] As = A, Bs = B;
	wire signed [8:0] soma_ext;  // bit extra para carry
	wire [7:0] w0, w1, w2, w3, s;

	assign soma_ext = As + Bs;
	assign w0 = soma_ext[7:0];

	assign w1 = A & B;
	assign w2 = A | B;
	assign w3 = ~A;

	mux_4x1 muxout(
		.i0(w0), .i1(w1), .i2(w2), .i3(w3), .s1(x), .s0(y), .f(s)
	);

	assign saida = s;

	// Flags
	wire is_soma = ~x & ~y;
	assign flag[1] = (s == 8'b0);                  // Zero
	assign flag[0] = s[7];                         // Negativo (bit de sinal)
	assign flag[3] = is_soma ? soma_ext[8] : 1'b0; // Carry
	assign flag[2] = is_soma ? (As[7] == Bs[7] && s[7] != As[7]) : 1'b0; // Overflow

endmodule
