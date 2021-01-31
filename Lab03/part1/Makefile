# This is the Makefile for Lab 03

# G++ is for the GCC compiler for C++
PP := g++

# CFLAGS are the compiler flages for when we compile C code in this course
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm
CXXFLAGS := -m64 -std=c++11 $(FLAGS)

# Folder Variables
SRC := src
INC := inc
OBJ := objects
EXE := executables


# Initialize the folders for the objects and executables
initialize:
	mkdir $(OBJ) $(EXE)
	
	
# Fibonacci Object File List - You will modify the next line
$(OBJ)/fib.o: $(SRC)/fib.cpp
	$(PP) $(GTEST_LOC) $(CXXFLAGS) -c $(SRC)/fib.cpp $(GTEST_FLAG) -o $@
	
$(OBJ)/test.o: test.cpp
	$(PP) $(GTEST_LOC) $(CXXFLAGS) -c test.cpp $(GTEST_FLAG) -o $@
	
	
# Object File Variable
fibObjs := $(OBJ)/fib.o $(OBJ)/test.o


# Executable
fib: $(fibObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/fib $(fibObjs)
	$(EXE)/./fib
	
	
# Make clean
clean:
	rm -rf $(OBJ)/* $(EXE)/*
	
	
# Make all
all: fib