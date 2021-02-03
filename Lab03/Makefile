# This is the Makefile for Lab 03

# G++ is for the GCC compiler for C++
PP := g++

# CFLAGS are the compiler flages for when we compile C code in this course
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm
CXXFLAGS := -m64 -std=c++11 $(FLAGS)

# Folder Variables
SRC := src
INC := include
OBJ := objects
EXE := executables


# Initialize the folders for the objects and executables
initialize:
	mkdir $(OBJ) $(EXE)
	
	
# Order Object File List - You will modify the next line
$(OBJ)/order.o: $(SRC)/order.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/order.cpp -o $@
	
$(OBJ)/main.o: main.cpp
	$(PP) $(CXXFLAGS) -c main.cpp -o $@
	
	
# Object File Variable
mainObjs := $(OBJ)/order.o $(OBJ)/main.o


# Executable
main: $(mainObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/main $(mainObjs)
	$(EXE)/./main
	
	
# Make clean
clean:
	rm -rf $(OBJ)/* $(EXE)/*
