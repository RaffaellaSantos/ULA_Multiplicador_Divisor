module div_8b (
	input clk, rst, inicio,
	input [7:0] A, B, //Entradas dividendo e divisor
	output reg [7:0] quociente,
	output reg fim,
	output reg [15:0] resto_out
);
	
	reg [15:0] divisor;
	reg [15:0] resto;
	reg [3:0] count;
	reg busy; //indica que a divis~ao esta em andamento

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			resto <= 0;
			divisor <= 0;
			quociente <= 0;
			resto_out <= 0;
			count <= 0;
			fim <= 0;
			busy <= 0;
		end else if (inicio && !busy) begin
			resto <= {8'd0, A};
			divisor <= {B, 8'd0};
			count <= 8;
			fim <= 0;
			busy <= 1;
			
		end else if (busy && count > 0) begin
			resto = resto << 1;

			if (resto[15:8] >= (divisor >> 8)) begin
				resto[15:8] = resto[15:8] - (divisor >> 8);
				resto[0] = 1'b1;
			end else begin
				resto[0] = 1'b0;
			end

			count <= count - 1;

			if (count == 1) begin
				quociente <= resto[7:0];
				resto_out <= resto[15:8]; // agora sim, valor final e atualizado
				fim <= 1;
				busy <= 0;
			end
		end
	end

endmodule
