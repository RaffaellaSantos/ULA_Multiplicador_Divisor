//Adicionar a ULA para fazer as somas e o shift
//Atualmente funciona

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
        produto <= produto + B;
      end
      B <= B << 1;
      A <= A >> 1;
      count <= count - 1;
      if (count == 1)
        fim <= 1;
    end
  end
endmodule
