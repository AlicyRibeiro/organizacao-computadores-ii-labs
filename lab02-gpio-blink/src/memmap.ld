/* memmap.ld - mínimo para LED blink bare-metal */

ENTRY(_start)

MEMORY
{
    RAM (rx) : ORIGIN = 0x80000000, LENGTH = 0x10000
}

SECTIONS
{
    /* Código de inicialização e main loop */
    .text : {
        *(.text*)
    } > RAM

    /* Dados podem ser inicializados manualmente, não incluímos .data/.bss */
}
