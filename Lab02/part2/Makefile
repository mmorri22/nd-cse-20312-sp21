# Author: Matthew Morrison
# E-mail: matt.morrison@nd.edu
#
# This is the Makefile for Lab 02 - Part 2 - CSE 20312

# G++ is for the GCC compiler for C++
PP := g++

# CFLAGS are the compiler flages for when we compile C code in this course
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm
CXXFLAGS := -m64 -std=c++11 -Weffc++ $(FLAGS)

# Folder Variables
SRC := src
INC := include
OBJ := objects
EXE := executables

# Initialize the folders for the objects and executables
initialize:
	mkdir $(OBJ) $(EXE)

# Create the attackMove object
$(OBJ)/attackMove.o: $(SRC)/attackMove.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/attackMove.cpp -o $@
	
# Create the battle object
$(OBJ)/battle.o: $(SRC)/battle.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/battle.cpp -o $@
	
# Create the pokemon object
$(OBJ)/pokemon.o: $(SRC)/pokemon.cpp
	$(PP) $(CXXFLAGS) -c $(SRC)/pokemon.cpp -o $@
	
# Create the main object
$(OBJ)/main.o: main.cpp
	$(PP) $(CXXFLAGS) -c main.cpp -o $@
	
# Pokemon Objects
pokemonObjs := $(OBJ)/attackMove.o $(OBJ)/battle.o $(OBJ)/pokemon.o $(OBJ)/main.o

# Pokemon Executable and Run
pokemon: $(pokemonObjs)
	$(PP) $(CXXFLAGS) -o $(EXE)/pokemon $(pokemonObjs)
	$(EXE)/./pokemon
	
	
# Make clean
clean:
	rm -rf $(OBJ)/* $(EXE)/*
	
# Make all
all: pokemon
