`timescale 1ns / 1ps

module tb_div_8b;

    // Entradas
    reg clk;
    reg rst;
    reg inicio;
    reg [7:0] A, B;

    // Saídas
    wire [7:0] quociente;
    wire fim;
    wire [15:0] resto_out;

    // Instância do módulo
    div_8b uut (
        .clk(clk),
        .rst(rst),
        .inicio(inicio),
        .A(A),
        .B(B),
        .quociente(quociente),
        .fim(fim),
        .resto_out(resto_out)
    );

    // Clock: 100 MHz
    always #5 clk = ~clk;

    initial begin
        $display("Início dos testes");
        clk = 0;
        rst = 1;
        inicio = 0;
        A = 0;
        B = 0;
        #20 rst = 0;

        // Teste 1: 7 / 2 = 3 resto 1
        A = 8'd7;
        B = 8'd2;
        inicio = 1;
        #10 inicio = 0;

        wait(fim);
        #10;
        if (quociente == 8'd3 && resto_out == 16'd1)
            $display("Teste 1 OK: 7 / 2 = %d resto %d", quociente, resto_out);
        else
            $display("Teste 1 FALHOU: esperado 3 / 1, obtido %d / %d", quociente, resto_out);

        // Teste 2: 200 / 10 = 20 resto 0
        rst = 1; #10; rst = 0;
        A = 8'd200;
        B = 8'd10;
        inicio = 1;
        #10 inicio = 0;

        wait(fim);
        #10;
        if (quociente == 8'd20 && resto_out== 16'd0)
            $display("Teste 2 OK: 200 / 10 = %d resto %d", quociente, resto_out);
        else
            $display("Teste 2 FALHOU: esperado 20 / 0, obtido %d / %d", quociente, resto_out);
		  
        // Teste 3: 32 / 7 = 4 resto 4
        rst = 1; #10; rst = 0;
        A = 8'd32;
        B = 8'd7;
        inicio = 1;
        #10 inicio = 0;

        wait(fim);
        #10;
        if (quociente == 8'd4 && resto_out == 16'd4)
            $display("Teste 3 OK: 32 / 7 = %d resto %d", quociente, resto_out);
        else
            $display("Teste 3 FALHOU: esperado 4 / 4, obtido %d / %d", quociente, resto_out);

        $display("Fim dos testes");
		  
        $finish;
    end

endmodule
