module mux_4x1(i0, i1, i2, i3, s1, s0, f);
	input [7:0] i0, i1, i2, i3;
	input s1, s0;
	output [7:0] f;

	assign f[7] = ~s1&(~s0)&i0[7] | ~s1&(s0)&i1[7] | s1&(~s0)&i2[7] | s1&(s0)&i3[7];
	assign f[6] = ~s1&(~s0)&i0[6] | ~s1&(s0)&i1[6] | s1&(~s0)&i2[6] | s1&(s0)&i3[6];
	assign f[5] = ~s1&(~s0)&i0[5] | ~s1&(s0)&i1[5] | s1&(~s0)&i2[5] | s1&(s0)&i3[5];
	assign f[4] = ~s1&(~s0)&i0[4] | ~s1&(s0)&i1[4] | s1&(~s0)&i2[4] | s1&(s0)&i3[4];
	assign f[3] = ~s1&(~s0)&i0[3] | ~s1&(s0)&i1[3] | s1&(~s0)&i2[3] | s1&(s0)&i3[3];
	assign f[2] = ~s1&(~s0)&i0[2] | ~s1&(s0)&i1[2] | s1&(~s0)&i2[2] | s1&(s0)&i3[2];
	assign f[1] = ~s1&(~s0)&i0[1] | ~s1&(s0)&i1[1] | s1&(~s0)&i2[1] | s1&(s0)&i3[1];
	assign f[0] = ~s1&(~s0)&i0[0] | ~s1&(s0)&i1[0] | s1&(~s0)&i2[0] | s1&(s0)&i3[0];

endmodule