CROSS_COMPILE ?= arm-none-eabi-

all:
	mkdir -p obj bin
	$(CROSS_COMPILE)as -mcpu=cortex-a8 src/startup.s -o obj/startup.o
	$(CROSS_COMPILE)ld -T src/memmap.ld -o obj/startup.elf obj/startup.o
	$(CROSS_COMPILE)objcopy -O binary obj/startup.elf bin/startup.bin
	cp bin/startup.bin /tftpboot/

clean:
	rm -rf obj bin
