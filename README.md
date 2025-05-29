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

* A ULA implementada neste projeto é básica e só realiza quatro operações. Para mais informações acesse o arquivo *Unidade_Lógico_Aritmética.pdf*.

* **Operações**: Soma, AND, OR, NOT.
* **Entradas**: Dois operandos de 8 bits e código da operação (x, y).
* **Saídas**: Resultado de 8 bits e flags de carry|overflow|zero|negativo.

### Multiplicador

* O multiplicador foi implementado com uma ULA completa, mas em abordagem comportamental. Para mais informações acesse o arquivo *Multiplicador_8bits.pdf*.

* **Operação**: Multiplicação de dois operandos de 8 bits.
* **Saída**: Resultado de 16 bits.

> *Se tiver curiosidade, a branch multiplicador_ula possui um multiplicador sem a implementação de uma ULA.*

### Divisor
* Para mais informações acesse o arquivo *Divisor_8bits.pdf*.

* **Operação**: Divisão de dois operandos de 8 bits.
* **Saídas**: Quociente (8bits) e resto(16bits).

## 🧪 Testes

Cada módulo possui um testbench correspondente:

* `tb_ULA_8b.v`
* `tb_multi_8b.v.v`
* `tb_div_8b.v`

Para simular:

1. Utilize uma ferramenta de simulação compatível com Verilog, como ModelSim ou Icarus Verilog. Neste projeto foi utilizado o ModelSim com o Quartus Lite 20.1.
2. Compile o módulo e seu testbench.
3. Execute a simulação.
