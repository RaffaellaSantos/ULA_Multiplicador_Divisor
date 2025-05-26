module tb_multi_8b;
  reg clk;
  reg rst;
  reg inicio;
  reg [15:0] multiplicando;
  reg [7:0] multiplicador;
  wire [15:0] produto;
  wire fim;

  // Instancia o módulo
  multi_8b uut (
    .clk(clk),
    .rst(rst),
    .inicio(inicio),
    .multiplicando(multiplicando),
    .multiplicador(multiplicador),
    .produto(produto),
    .fim(fim)
  );

  // Clock 10ns
  always #5 clk = ~clk;

  initial begin
    // Inicialização
    clk = 0;
    rst = 1;
    inicio = 0;
    multiplicando = 0;
    multiplicador = 0;
    #10;
    rst = 0;

    // Teste 1: 25 x 12
    multiplicando = 16'd25;
    multiplicador = 8'd12;
    inicio = 1;
    #10;
    inicio = 0;
    wait (fim == 1);
    #10;
    $display("Teste 1: 25 x 12 = %d", produto);
    if (produto !== 16'd300)
      $display("Erro: Esperado 300");
    else
      $display("Sucesso!");

    // Reset entre testes
    rst = 1;
    #10;
    rst = 0;

    // Teste 2: 10 x 12
    multiplicando = 16'd10;
    multiplicador = 8'd12;
    inicio = 1;
    #10;
    inicio = 0;
    wait (fim == 1);
    #10;
    $display("Teste 2: 10 x 12 = %d", produto);
    if (produto !== 16'd120)
      $display("Erro: Esperado 120");
    else
      $display("Sucesso!");

    #20;
    $finish;
  end
endmodule
