# Author: [Student Puts their Name Here]
# E-mail: [Student Puts their Email Here]
#
# This is the Makefile for Lab 01

# G++ is for the GCC compiler for C++
PP := g++

# CFLAGS are the compiler flages for when we compile C code in this course
FLAGS := -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm
CXXFLAGS := $(FLAGS) -m64 -std=c++11 -Weffc++



# sample Example
# Command: make sample
sampleObjs :=  sample.o

sample: sample.o
	$(PP) $(CXXFLAGS) -o sample $(sampleObjs)

sample.o: sample.cpp
	$(PP) $(CXXFLAGS) -c sample.cpp
	
	
	
# decoder Example
# Command: make decoder
decoderObjs :=  decoder.o

decoder: decoder.o
	$(PP) $(CXXFLAGS) -o decoder $(decoderObjs)

decoder.o: decoder.cpp
	$(PP) $(CXXFLAGS) -c decoder.cpp

	

# Make all
all: sample decoder

# Make clean
clean :
	rm -rf *.o sample decoder
