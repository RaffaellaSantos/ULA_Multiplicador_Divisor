module multi_8b(
  input clk,
  input rst,
  input inicio,
  input [15:0] multiplicando, 
  input [7:0] multiplicador,  
  output reg [15:0] produto,
  output reg fim
);
  
  reg [7:0] A;
  reg [15:0] B;
  reg [3:0] count;
  wire [15:0] w_soma, w_shiftB;
  wire [7:0] w_shiftA;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      produto <= 0;
      A <= 0;
      B <= 0;
      count <= 0;
      fim <= 0;
    end else if (inicio) begin
      A <= multiplicador;
      B <= multiplicando;
      count <= 8;
      produto <= 0;
      fim <= 0;
    end else if (count > 0) begin
      if (A[0] == 1) begin
        produto <= w_soma;
      end
      B <= w_shiftB;
      A <= w_shiftA;
      count <= count - 1;
      if (count == 1)
        fim <= 1;
    end
  end
  
  mux8x1_16b mux_soma (.a(produto), .b(B), .x(1'b0), .y(1'b0), .z(1'b0), .s(w_soma));
  mux8x1_16b mux_shiftB (.a(B), .b(16'b1), .x(1'b0), .y(1'b1), .z(1'b0), .s(w_shiftB));
  mux8x1_8b mux_shiftA (.a(A), .b(8'b1), .x(1'b0), .y(1'b1), .z(1'b1), .s(w_shiftA));
  
endmodule
