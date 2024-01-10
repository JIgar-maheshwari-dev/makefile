CC=gcc
INC= -I /home/jigar/makefile/ew/header -I /home/jigar/makefile/ew/libs
LIB_INC= -L /home/jigar/makefile/ew/libs/lib_my.a
CSRC=/home/jigar/makefile/ew/cf
OSRC=
ODST=/home/jigar/makefile/ew/build
BDST=/home/jigar/makefile/ew/out

CFILES=$(foreach D,$(CSRC),$(wildcard $(D)/*.c)) main.c 
OBJ3=$(foreach D,$(ODST),$(wildcard $(D)/*.o)) 

OBJ=$(patsubst %.c,%.o,$(CFILES)) main.o
OBJ2=$(patsubst %/cf,%/build,$(OBJ)) 

DEPS=$(patsubst %.c,%.d,$(CFILES))
BIN=main

all:$(BIN)

$(BIN):$(OBJ) 
	$(CC) -o $@ $(OBJ3) $(INC) $(LIB_INC)
	mv $@ $(BDST)

$(OBJ):$(CFILES) 
	$(CC) -c $? $(INC)
	mv *.o $(ODST)

clear:
	rm *.o main
	
pritf:
	$(info $(OBJ3))
