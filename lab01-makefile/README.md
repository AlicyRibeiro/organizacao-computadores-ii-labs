# Lab 01 — Desenvolvimento de Makefile

## Descrição

Neste laboratório foi desenvolvido o primeiro projeto da disciplina, com o objetivo de configurar um ambiente de build utilizando Makefile, organizando o código em módulos e automatizando o processo de compilação.

A prática consiste em criar um programa que exibe uma mensagem de inicialização (ex.: conexão com servidor TFTP), aplicando conceitos de organização de projeto em sistemas embarcados.

---

# Objetivos de Aprendizagem

- Entender a estrutura de um projeto embarcado
- Automatizar compilação com Makefile
- Trabalhar com código modular (src + include)
- Gerar arquivos objeto, binário e listagem

---

# Estrutura da prática

```
lab01-makefile/
│
├── src/
│   └── startup.c
│   └── print_Hello.c
│
├── inc/
│   └── print_Hello.h
│
└── Makefile

```

---

# Processo de build

O Makefile executa as seguintes etapas:

1. Compilação do código fonte
2. Geração do arquivo objeto (`.o`)
3. Conversão para binário (`.bin`)
4. Geração da listagem (`.lst`)

---

# Como compilar

---

# Resultado esperado

O programa deve executar corretamente e gerar os arquivos de saída do build, indicando que o ambiente de compilação está configurado corretamente.

---

# Demonstração da prática

![Execução do Lab 01](../images/lab01-funcionando.png)

---

# Aprendizados

- Importância da automação de build
- Organização de projetos embarcados
- Fluxo de geração de binários
- Primeiros passos no ambiente bare-metal

---

# Observações

Este laboratório serve como base para todas as práticas seguintes, pois estabelece o fluxo padrão de compilação utilizado ao longo da disciplina.
