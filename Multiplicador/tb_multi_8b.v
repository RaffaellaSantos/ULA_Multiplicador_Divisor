module tb_multi_8b;
  reg clk;
  reg rst;
  reg inicio;
  reg [15:0] multiplicando;
  reg [7:0] multiplicador;
  wire [15:0] produto;
  wire fim;

  multi_8b uut (
    .clk(clk),
    .rst(rst),
    .inicio(inicio),
    .multiplicando(multiplicando),
    .multiplicador(multiplicador),
    .produto(produto),
    .fim(fim)
  );

  // Clock de 10 ns
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    inicio = 0;
    multiplicando = 0;
    multiplicador = 0;
    #20;
    rst = 0;

    // === Teste 1 ===
    multiplicando = 16'd25;
    multiplicador = 8'd12;
    @(negedge clk); inicio = 1;
    @(negedge clk); inicio = 0;

    // Espera fim com timeout
    repeat (100) @(posedge clk);
    if (fim) begin
      $display("Teste 1: 25 x 12 = %d", produto);
      if (produto !== 16'd300)
        $display("Erro: Esperado 300");
      else
        $display("Sucesso!");
    end else begin
      $display("Erro: timeout no Teste 1");
    end

    // Reset
    rst = 1; @(negedge clk); rst = 0;

    // === Teste 2 ===
    multiplicando = 16'd10;
    multiplicador = 8'd12;
    @(negedge clk); inicio = 1;
    @(negedge clk); inicio = 0;

    repeat (100) @(posedge clk);
    if (fim) begin
      $display("Teste 2: 10 x 12 = %d", produto);
      if (produto !== 16'd120)
        $display("Erro: Esperado 120");
      else
        $display("Sucesso!");
    end else begin
      $display("Erro: timeout no Teste 2");
    end

    #20;
    $finish;
  end
endmodule
