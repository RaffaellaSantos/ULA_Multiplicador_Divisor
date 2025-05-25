`timescale 1ns/100ps

module tb_ULA_8b;
	
	reg [7:0] A_tb, B_tb;
	reg x_tb, y_tb;
	wire [3:0] flag_tb;
	wire [7:0] saida_tb;
	
	ULA_8b uut (
		.A(A_tb), .B(B_tb), .x(x_tb), .y(y_tb), .flag(flag_tb), .saida(saida_tb)
	);
	
	initial begin
		// Teste 1: 1 + 3 = 4 Flag = 0000
		#10
		A_tb = 8'b00000001;
		B_tb = 8'b00000011;
		x_tb = 0; y_tb = 0;
		#1;
		$display("Teste 1: 1 + 3 = %d | Flag = %b", saida_tb, flag_tb);
		if (saida_tb !== 8'd4)
			$display("Erro: Esperado 4");
		else
			$display("Sucesso!");

		// Teste 2: 1 - 1 = 0 (1 + -1) Flag = 0010
		#10
		A_tb = 8'b00000001;
		B_tb = 8'b11111111; // -1
		x_tb = 0; y_tb = 0;
		#1;
		$display("Teste 2: 1 + (-1) = %d | Flag = %b", saida_tb, flag_tb);
		if (saida_tb !== 8'd0)
			$display("Erro: Esperado 0");
		else
			$display("Sucesso!");

		// Teste 3: 127 + 127 = -2 (Overflow esperado) Flag = 0101
		#10
		A_tb = 8'b01111111;
		B_tb = 8'b01111111;
		x_tb = 0; y_tb = 0;
		#1;
		$display("Teste 3: 127 + 127 = %d | Flag = %b", $signed(saida_tb), flag_tb);
		if (saida_tb !== 8'b11111110)
			$display("Erro: Esperado -2 (overflow)");
		else
			$display("Sucesso!");

		// Teste 4: -3 + 1 = -2 Flag = 1001
		#10
		A_tb = 8'b11111101; // -3
		B_tb = 8'b00000001; // 1
		x_tb = 0; y_tb = 0;
		#1;
		$display("Teste 4: -3 + 1 = %d | Flag = %b", $signed(saida_tb), flag_tb);
		if (saida_tb !== 8'b11111110)
			$display("Erro: Esperado -2");
		else
			$display("Sucesso!");

		// Teste 5: A & B = 00000001 Flag = 0000
		#10
		A_tb = 8'b00000001;
		B_tb = 8'b00000011;
		x_tb = 0; y_tb = 1;
		#1;
		$display("Teste 5: A & B = %b | Flag = %b", saida_tb, flag_tb);
		if (saida_tb !== 8'b00000001)
			$display("Erro: Esperado 00000001");
		else
			$display("Sucesso!");

		// Teste 6: A | B = 00000011 Flag = 0000
		#10
		A_tb = 8'b00000001;
		B_tb = 8'b00000010;
		x_tb = 1; y_tb = 0;
		#1;
		$display("Teste 6: A | B = %b | Flag = %b", saida_tb, flag_tb);
		if (saida_tb !== 8'b00000011)
			$display("Erro: Esperado 00000011");
		else
			$display("Sucesso!");

		// Teste 7: ~A = 11111110 Flag = 0001
		#10
		A_tb = 8'b00000001;
		x_tb = 1; y_tb = 1;
		#1;
		$display("Teste 7: ~A = %b | Flag = %b", saida_tb, flag_tb);
		if (saida_tb !== 8'b11111110)
			$display("Erro: Esperado 11111110");
		else
			$display("Sucesso!");
	end
	
endmodule
