ENTRY(_start)

MEMORY
{
    ram (rxw) : ORIGIN = 0x80000000, LENGTH = 0x0000F000  /* até antes da pilha IRQ (0x8000F000) */
}

SECTIONS
{
    .text : {
        *(.vectors*)      /* vetor de exceções usado pelo VBAR/IVT */
        *(.text*)         /* restante do código */
        *(.rodata*)
    } > ram

    .data : {
        *(.data*)
    } > ram

    .bss : {
        *(.bss*)
        *(COMMON)
    } > ram
}
