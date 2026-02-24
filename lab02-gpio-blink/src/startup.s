.equ CM_PER_GPIO1_CLKCTRL,     0x44E000AC
.equ GPIO1_BASE,               0x4804C000
.equ GPIO1_OE,                 0x4804C134
.equ GPIO1_SETDATAOUT,         0x4804C194
.equ GPIO1_CLEARDATAOUT,       0x4804C190
.equ GPIO1_DATAIN,             0x4804C138

.global _start

_start:
    @ --- Configura modo supervisor ---
    mrs r0, cpsr
    bic r0, r0, #0x1F
    orr r0, r0, #0x13
    orr r0, r0, #0xC0
    msr cpsr_c, r0

    bl gpio_setup

    mov r5, #0          @ r5 = modo (0 = internos, 1 = externo)

main_loop:
    cmp r5, #0
    beq leds_internos
    bne led_externo

leds_internos:
    @ --- Sequência dos LEDs internos ---
    bl clear_all_leds

    @ LED 21
    ldr r0, =GPIO1_SETDATAOUT
    ldr r1, =0x00200000
    str r1, [r0]
    bl delay
    bl clear_all_leds

    @ LED 22
    ldr r0, =GPIO1_SETDATAOUT
    ldr r1, =0x00400000
    str r1, [r0]
    bl delay
    bl clear_all_leds

    @ LED 23
    ldr r0, =GPIO1_SETDATAOUT
    ldr r1, =0x00800000
    str r1, [r0]
    bl delay
    bl clear_all_leds

    @ LED 24
    ldr r0, =GPIO1_SETDATAOUT
    ldr r1, =0x01000000
    str r1, [r0]
    bl delay
    bl clear_all_leds

    bl check_button_toggle
    b main_loop

led_externo:
    @ --- Pisca LED externo (GPIO1_16) ---
    bl clear_all_leds
    ldr r0, =GPIO1_SETDATAOUT
    ldr r1, =0x00010000
    str r1, [r0]
    bl delay
    bl clear_all_leds
    bl delay

    bl check_button_toggle
    b main_loop

@ ------------------------
@ Função: limpa todos os LEDs
@ ------------------------
clear_all_leds:
    ldr r0, =GPIO1_CLEARDATAOUT
    ldr r1, =0x01F10000   @ soma dos LEDs (16, 21, 22, 23, 24)
    str r1, [r0]
    bx lr

@ ------------------------
@ Configuração dos GPIOs
@ ------------------------
gpio_setup:
    ldr r0, =CM_PER_GPIO1_CLKCTRL
    mov r1, #0x2
    str r1, [r0]

    ldr r0, =GPIO1_OE
    ldr r1, [r0]

    @ LEDs internos + LED externo -> saída
    bic r1, r1, #(1 << 16)
    bic r1, r1, #(1 << 21)
    bic r1, r1, #(1 << 22)
    bic r1, r1, #(1 << 23)
    bic r1, r1, #(1 << 24)

    @ Botão (entrada)
    orr r1, r1, #(1 << 28)

    str r1, [r0]
    bx lr

@ ------------------------
@ Espera botão pressionado e alterna modo
@ ------------------------
check_button_toggle:
    ldr r0, =GPIO1_DATAIN
    ldr r1, =0x10000000  @ botão -> GPIO1_28
wait_press:
    ldr r2, [r0]
    tst r2, r1
    beq wait_press           @ espera pressionar (nível alto)

    @ --- alterna modo ---
    eor r5, r5, #1           @ alterna 0 <-> 1

wait_release:
    ldr r2, [r0]
    tst r2, r1
    bne wait_release         @ espera soltar botão
    bx lr

@ ------------------------
@ Delay simples
@ ------------------------
delay:
    ldr r2, =0x6FFFFFF                 
delay_loop:
    subs r2, r2, #1
    bne delay_loop
    bx lr
    