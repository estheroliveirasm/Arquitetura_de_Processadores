# MIPS Recursive Function - A(n)

Uma implementação eficiente em Assembly MIPS de uma função recursiva baseada em divisão inteira, desenvolvida para a disciplina de **Organização e Arquitetura de Computadores I (DEC7123-02655)** do curso de Engenharia da Computação na **UFSC (Campus Araranguá)**.

## 📋 Descrição do Projeto

O programa calcula de forma recursiva o valor da função matemática $A(n)$, definida pelas seguintes regras:

- **Caso Base:** $A(0) = 1$
- **Caso Geral:** $A(n) = A(\lfloor n/2 \rfloor) + A(\lfloor n/3 \rfloor)$, para $n \ge 1$

O código adota a convenção de chamadas de procedimento do MIPS, utilizando a pilha (`$sp`) para armazenar o endereço de retorno (`$ra`), o argumento corrente e o resultado parcial.

## 📂 Relatório Completo Disponível

> 📄 **Nota:** Este projeto possui um **relatório técnico completo em formato PDF** arquivado na pasta do repositório (refira-se à pasta `/relatorio` ou à raiz). O documento contém a fundamentação teórica, a análise detalhada do comportamento da pilha (`$sp`) na 3ª chamada aninhada, o endereçamento da variável de resultado e os prints de validação no MARS.

## 🚀 Como Executar

1. Baixe o simulador **MARS (MIPS Assembler and Runtime Simulator)**.
2. Abra o arquivo `trabalho.asm` no MARS.
3. Monte (Assemble) o código usando o atalho `F3` ou o ícone de ferramenta.
4. Execute (Run) pressionando `F5`.
5. Insira um valor inteiro entre 0 e 1000 no console quando solicitado.

## 🎓 Informações Acadêmicas
- **Instituição:** Universidade Federal de Santa Catarina (UFSC) - Campus Araranguá
- **Disciplina:** DEC7123-02655 — Organização e Arquitetura de Computadores I (2026/1)
- **Professor:** Prof. Dr. Rodrigo V. M. Pereira

## 👥 Autores
- Beatriz Goulart
- Esther Oliveira
- Kauân Kila
