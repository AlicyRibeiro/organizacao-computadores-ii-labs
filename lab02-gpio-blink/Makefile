CROSS_COMPILE ?= arm-none-eabi-

all: src/startup.s
	$(CROSS_COMPILE)as src/startup.s -o obj/startup.o
	$(CROSS_COMPILE)objcopy obj/startup.o bin/startup.bin -O binary
	$(CROSS_COMPILE)objdump -D -b binary -marm bin/startup.bin > startup.lst
	cp bin/*.bin /tftpboot

clean:
	rm -rf obj/* bin/*
