# Lab 02 — GPIO Blink (Piscar LED)

## Descrição

Neste laboratório foi desenvolvido o primeiro programa embarcado com interação direta com hardware, utilizando o periférico GPIO para controlar LEDs da placa.

A prática consiste em configurar registradores do sistema para alternar o estado de um LED, criando o clássico programa “blink”, equivalente ao Hello World em sistemas embarcados.

---

# Objetivos de Aprendizagem

- Compreender o funcionamento do periférico GPIO
- Configurar registradores de clock e controle
- Definir direção de pinos (entrada/saída)
- Manipular registradores de dados (SET e CLEAR)
- Entender a estrutura de um programa bare-metal

---

# Conceitos abordados

- Inicialização do módulo de clock do GPIO
- Configuração de multiplexação de pinos
- Controle de direção com registrador GPIO_OE
- Escrita nos registradores:
    - GPIO_SETDATAOUT
    - GPIO_CLEARDATAOUT
 
---

# Plataforma utilizada

- Linguagem C (bare-metal)
- Toolchain ARM
- Makefile
- Placa BeagleBone Black

---

# Estrutura da prática

``` 
lab02-gpio-blink/
│
├── bin/
│   └── startup.bin
│
├── inc/
│   └── hw_types.h
│   └── soc_AM335x.h
│
├── obj/
│   └── startup.o
│
├── src/
│   └── memmap.ld
│   └── startup.s
├── Makefile
└── startup.lst

```

---

# Funcionamento do programa

O programa executa um loop infinito que:

1. Alterna o estado do LED
2. Escreve no registrador de saída
3. Aguarda um tempo de delay
4. Repete continuamente

Isso resulta no LED piscando em uma frequência definida pelo tempo de espera.

---

# Como compilar

---

# Resultado esperado

O LED da placa deve piscar continuamente, indicando que o controle do periférico GPIO foi realizado com sucesso.

---

# Demonstração da prática


![LED piscando](../images/lab02-blink.gif)

---

# Aprendizados

- Interação direta com hardware
- Importância da configuração de registradores
- Controle de temporização em sistemas embarcados
- Estrutura básica de firmware

---


# Possíveis extensões

- Piscar múltiplos LEDs
- Alterar frequência dinamicamente
- Criar sequências de iluminação
