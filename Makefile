INC=-I./includes/
BIN=cart.bin
OTP=-o $(BIN)

all:
	dasm ./src/*.asm -f3 -v0 $(INC) $(OTP)

run:
	stella $(BIN)
