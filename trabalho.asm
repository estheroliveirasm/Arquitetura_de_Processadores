#Beatriz Pereira Goulart (25205466)
#Esther de Oliveira (25205467)
#Kauan Kila (25202753)

# SEÇÃO DE DADOS 
.data
    prompt: .asciiz "Digite um valor para n (0 a 1000): "
    msg_final: .asciiz "O resultado de A(n) e: "
    resultado: .word 0     # Espaço de 4 bytes na memória RAM para armazenar o valor final

# SEÇÃO DE CÓDIGO E PONTO DE ENTRADA 
.text                      # Informa ao simulador que as linhas abaixo contêm instruções executáveis
.globl main                # Torna o rótulo "main" visível externamente para o sistema do simulador

main:                      # Demarca o endereço de memória onde a execução do programa deve iniciar
    #EXIBIÇÃO DE TEXTO
    li $v0, 4              # Carrega o código do sistema para impressão de texto
    la $a0, prompt         # Carrega o endereço de memória onde o texto está armazenado
    syscall                # Executa a chamada do sistema para exibir o texto na tela

    #LEITURA DO NÚMERO
    li $v0, 5              # Carrega o código do sistema para ler um número inteiro
    syscall                # Executa a leitura e o valor digitado é colocado no registrador $v0
    move $a0, $v0          # Copia o valor do registrador $v0 para o registrador $a0

    # CHAMADA DA FUNÇÃO
    jal calcular_A         # Salva o endereço da próxima linha em $ra e redireciona para o rótulo "calcular_A"

    #ARMAZENAMENTO E EXIBIÇÃO DO VALOR FINAL
    la $t0, resultado      # Carrega o endereço de memória da variável "resultado" no registrador $t0
    sw $v0, 0($t0)         # Grava o valor contido em $v0 no endereço armazenado em $t0

    move $a0, $v0          # Copia o valor de $v0 para $a0 para permitir a impressão
    li $v0, 1              # Carrega o código do sistema para impressão de número inteiro
    syscall                # Executa a chamada do sistema para exibir o número na tela

    #FINALIZAÇÃO DO PROGRAMA
    li $v0, 10             # Carrega o código do sistema para encerrar a execução
    syscall                # Finaliza o programa

# FUNÇÃO: calcular_A
calcular_A:
    #RESERVA DE ESPAÇO NA MEMÓRIA PILHA
    # Subtrai 12 unidades do registrador $sp para alocar espaço de 3 palavras (4 bytes cada)
    subu $sp, $sp, 12
    sw $ra, 8($sp)         # Armazena o endereço de retorno ($ra) na memória pilha
    sw $a0, 4($sp)         # Armazena o valor do argumento atual ($a0) na memória pilha

    #VERIFICAÇÃO DO CASO BASE
    bne $a0, $zero, passo_recursivo  # Se $a0 for diferente de 0, desvia para "passo_recursivo"
    li $v0, 1                        # Se $a0 for igual a 0, define o registrador de retorno $v0 como 1
    addu $sp, $sp, 12                # Adiciona 12 ao registrador $sp para liberar o espaço alocado
    jr $ra                           # Transfere a execução para o endereço contido em $ra

passo_recursivo:
    #PRIMEIRA PARTE
    lw $t0, 4($sp)         # Copia o valor original de 'n' salvo na pilha para o registrador $t0
    li $t1, 2              # Armazena o valor inteiro 2 no registrador $t1
    divu $t0, $t1          # Divide o valor de $t0 por $t1 (divisão inteira sem sinal)
    mflo $a0               # Copia o quociente inteiro da divisão do registrador LO para $a0
    jal calcular_A         # Executa uma nova chamada da função com o novo argumento
    sw $v0, 0($sp)         # Armazena o resultado retornado em $v0 no espaço reservado na pilha

    #SEGUNDA PARTE
    lw $t0, 4($sp)         # Copia novamente o valor original de 'n' da pilha para o registrador $t0
    li $t1, 3              # Armazena o valor inteiro 3 no registrador $t1
    divu $t0, $t1          # Divide o valor de $t0 por $t1 (divisão inteira sem sinal)
    mflo $a0               # Copia o quociente inteiro da divisão do registrador LO para $a0
    jal calcular_A         # Executa uma nova chamada da função com o novo argumento

    #SOMA DOS RESULTADOS
    lw $t0, 0($sp)         # Lê o resultado da primeira chamada armazenado na pilha e coloca em $t0
    addu $v0, $t0, $v0     # Soma os valores de $t0 e $v0, armazenando a soma no próprio registrador $v0

    #RESTAURAÇÃO DA MEMÓRIA PILHA E RETORNO
    lw $ra, 8($sp)         # Recupera o endereço de retorno original para o registrador $ra
    addu $sp, $sp, 12      # Adiciona 12 ao registrador $sp para restaurar seu valor inicial
    jr $ra                 # Transfere a execução para o endereço contido em $ra
