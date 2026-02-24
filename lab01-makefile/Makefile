CHAIN=arm-none-eabi
CFLAGS=-std=c99 -Wall
IPATH=-Iinc/
SRC=src/
OBJ=obj/
BIN=bin/

all: app

app: startup.o print_Hello.o
	$(CHAIN)-ld $(OBJ)startup.o $(OBJ)print_Hello.o -T $(SRC)memmap.ld -o $(OBJ)startup.elf
	$(CHAIN)-objcopy $(OBJ)startup.elf $(BIN)startup.bin -O binary
	$(CHAIN)-objdump -D -b binary -marm $(BIN)startup.bin > $(BIN)startup.lst
	cp $(BIN)startup.bin /tftpboot/startup.bin

startup.o: $(SRC)startup.c
	$(CHAIN)-gcc $(CFLAGS) $(IPATH) -c $(SRC)startup.c -o $(OBJ)startup.o

print_Hello.o: $(SRC)print_Hello.c
	$(CHAIN)-gcc $(CFLAGS) $(IPATH) -c $(SRC)print_Hello.c -o $(OBJ)print_Hello.o

clean:
	rm -rf $(OBJ)*.o $(OBJ)*.elf $(BIN)*.bin $(BIN)*.lst

dump:
	$(CHAIN)-objdump -D $(OBJ)startup.elf
