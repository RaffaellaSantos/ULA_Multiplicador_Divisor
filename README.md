# ULA\_Multiplicador\_Divisor

Implementação em Verilog de:

* **ULA (Unidade Lógica e Aritmética) de 8 bits**
* **Multiplicador de 8 bits**
* **Divisor de 8 bits**

## 📁 Estrutura do Projeto

```
ULA_Multiplicador_Divisor/
├── ULA_8bits/
│   ├── ULA_8b.v
│   ├── mux_4x1.v
│   ├── tb_ULA_8b.v
|   └── Unidade_Lógico_Aritmética.pdf
├── Multiplicador/
│   ├── multi_8b.v
│   ├── mux8x1_16b.v
│   ├── tb_multi_8b.v
|   └── Multiplicador_8bits.pdf
├── Divisor/
│   ├── div_8b.v
│   ├── tb_div_8b.v
|   └── Divisor_8bits.pdf
└── README.md
```

## ⚙️ Descrição dos Módulos

### ULA (Unidade Lógica e Aritmética)

* A ULA implementada neste projeto é básica e só realiza quatro operações. Para mais informações acesse o arquivo **[Unidade_Lógico_Aritmética.pdf](https://github.com/RaffaellaSantos/ULA_Multiplicador_Divisor/blob/main/ULA_8bits/Unidade_Lógico_Aritmética.pdf)**.

* **Operações**: Soma, AND, OR, NOT.
* **Entradas**: Dois operandos de 8 bits e código da operação (x, y).
* **Saídas**: Resultado de 8 bits e flags de carry|overflow|zero|negativo.

### Multiplicador

* O multiplicador foi implementado com uma ULA completa, mas em abordagem comportamental. Para mais informações acesse o arquivo **[Multiplicador_8bits.pdf](https://github.com/RaffaellaSantos/ULA_Multiplicador_Divisor/blob/main/Multiplicador/Multiplicador_8bits.pdf)**.

* **Operação**: Multiplicação de dois operandos de 8 bits.
* **Saída**: Resultado de 16 bits.

> *Se tiver curiosidade, a branch multiplicador_ula possui um multiplicador sem a implementação de uma ULA.*

### Divisor
* O divisor foi implementada de forma "crua", contendo apenas o próprio divisor. Para mais informações acesse o arquivo **[Divisor_8bits.pdf](https://github.com/RaffaellaSantos/ULA_Multiplicador_Divisor/blob/main/Divisor/Divisor_8bits.pdf)**.

* **Operação**: Divisão de dois operandos de 8 bits.
* **Saídas**: Quociente (8bits) e resto(16bits).

## 🧪 Testes

Cada módulo possui um testbench correspondente:

* `tb_ULA_8b.v`
* `tb_multi_8b.v.v`
* `tb_div_8b.v`

Para simular foi utilizado o ModelSim com o Quartus Lite 20.1:

1. Abra o arquivo .qpf no Quartus.
2. Vá em *Assignments* --> *Settings* --> *Simulation* --> *Compile test bench* --> Escolha o arquivo de teste.
3. Compile o módulo e seu testbench.
4. Execute a simulação no ModelSim clicando em *Run --> Run Simulation Tool --> RTL Simulation*
