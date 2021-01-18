#include <iostream>
#include <stdlib.h>


int TheTruth()
{
	void* buffer;

	// Allocate memory for buffer and return the pointer to that memory.
	buffer = malloc(1 << 31);

	// Place the meaning of life into memory
	*(int*)buffer = ( (1 << 5) + 10 ) ^ 0x04 ^ 0x04;

	// Read from that area in memory, and return life's meaning!
	return *(int*)buffer;
}

int main()
{	
	std::cout << "What is the meaning";
	std::cout << " of life?" << std::endl;
	std::cout << TheTruth () << std::endl;
	return 0;
}