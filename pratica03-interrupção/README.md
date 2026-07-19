# Lab 03 — GPIO Interrupção (Piscar LED com Botão)

## Descrição

Neste laboratório, foi desenvolvida a configuração e o tratamento de interrupções via hardware, utilizando um botão físico (GPIO) para sinalizar eventos ao processador.

A prática consiste em configurar o Controlador de Interrupções (INTC) e a Tabela de Vetores de Interrupção (IVT) para pausar a execução principal e atender ao evento assíncrono do botão, alternando a lógica de funcionamento dos LEDs.

---

# Objetivos de Aprendizagem

- Compreender o funcionamento do Controlador de Interrupções (INTC)
- Configurar a Tabela de Vetores de Interrupção (IVT) no processador
- Manipular máscaras e prioridades de interrupção (INTC_MIR_CLEAR)
- Detectar eventos de borda no pino GPIO (RISINGDETECT)
- Realizar a troca de contexto entre os modos do processador (SVC e IRQ)

---

# Conceitos abordados

- Inicialização e mascaramento no módulo INTC
- Escrita no endereço da Tabela de Vetores de Exceção
- Salvamento de registradores de estado (CPSR e SPSR) e empilhamento (Stack Pointer)
- Rotina de Serviço de Interrupção (ISR)
- Reconhecimento da interrupção (ACK) e limpeza de flags (IRQSTATUS)
 
---

# Plataforma utilizada

- Linguagem Assembly (bare-metal)
- Toolchain ARM
- Makefile
- Placa BeagleBone Black
- Componentes Eletrônicos: Botão (Push button) e Resistor de pull-down

---

# Estrutura da prática

``` 
lab03-gpio-interrupt/
│
├── bin/
│   └── startup.bin
│
├── src/
│   └── memmap.ld
│   └── pratica1.s
│
├── Makefile
└── startup.lst
```

---

# Funcionamento do programa

O programa executa o seguinte fluxo:

1. Configura os pinos de saída (LEDs) e o pino de entrada (botão no expansor P8/P9).
2. Entra em um loop infinito que aciona e apaga os LEDs internos em sequência.
3. Quando o botão é pressionado, o evento de borda de subida gera uma interrupção de hardware (IRQ).
4. O processador pausa a sequência atual, salva o contexto e invoca o manipulador da interrupção (`_irq_handler`).
5. O manipulador altera uma variável de estado na memória, reconhece a IRQ e limpa a flag no módulo GPIO.
6. A execução principal é retomada, alterando o fluxo para piscar um LED externo.

---

# Como compilar

Para compilar o código fonte e gerar o arquivo binário:

```bash
make
```

---

# Resultado esperado

A placa deve exibir uma sequência de LEDs piscando. Ao pressionar o botão mecânico na protoboard, a interrupção será processada de forma assíncrona, fazendo com que o padrão mude imediatamente para o LED externo, comprovando a eficácia da Rotina de Serviço de Interrupção (ISR).

---



# Aprendizados

- Separação de operações críticas e não críticas por meio de concorrência baseada em hardware
- Mecanismos de salvamento e restauração de registradores (`stmfd`, `ldmfd`)
- Utilização de resistores de pull-down para criar circuitos funcionais de botões
- O mapeamento lógico para identificar qual interrupção foi ativada (INTC_SIR_IRQ)

---

# Possíveis extensões

- Implementar interrupção utilizando o módulo de temporizador (RTC) com rotinas IRQ, FIQ e SWI
- Adicionar debouncing por software ou habilitar o GPIO_DEBOUNCENABLE
- Mapear múltiplos botões ativando interrupções em pinos e módulos de GPIO diferentes
