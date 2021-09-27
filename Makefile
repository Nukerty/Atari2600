INC=-I./includes/

BIN=cart.bin
LNM=cart.log

OTP=-o$(BIN)
LST=-l$(LNM)

# -f3 is required to read raw text binary for the atari2600

listing:
	dasm ./src/*.asm -f3 -R $(INC) $(OTP) $(LST)

debug:
	dasm ./src/*.asm -v5 -E2 -R $(INC) $(OTP)

clean:
	rm ./$(BIN)
	rm ./$(LNM)

testfile:
	dasm ./src/test.asm -f3 -v5 $(INC) $(OTP)

all:
	dasm ./src/*.asm -f3 $(INC) $(OTP)

run:
	stella $(BIN)
