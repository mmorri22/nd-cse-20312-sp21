#include <iostream>
#include <cstdlib>
#include <cstring>

#define COUT std::cout 
#define ENDL std::endl 
#define CERR std::cerr

/* Recursive function for determining the increasing value */
bool increasing(int input)
{

	//make your changes only below this line.	You may not use any loops.


	return true;
}

/* do not change the main function. */
int main (int argc, char** argv)
{

	/* Verify the correct number of inputs */
	if(argc < 2){
		std::cerr << "Please provide an integer greater than 0." << std::endl;
		return 1;
	}
	
	/* Converts an input from ascii to integer */
	int input_integer = atoi(argv[1]);
	
	/* Check to ensure x is positive */
	if( input_integer <= 0 ){
		
		std::cerr << "Please provide an integer greater than 0." << std::endl;
		exit(-1);
	
	}

	/* Recursive call */	
	if( increasing( input_integer ) ) 
		std::cout << "Increasing order." << std::endl;

	else 
		std::cout << "Not increasing order." << std::endl;


	return 0;
}
