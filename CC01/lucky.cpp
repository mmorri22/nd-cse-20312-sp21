#include <iostream>
#include <stdlib.h>
#include <cstring>


bool increasing(int input)
{
	
	//make your changes only below this line.  You may not use any loops.

	

	return true;
}

//do not change the main function.
int main (int argc, char** argv)
{
  if(argc < 2){
    std::cerr << "Please provide an integer." << std::endl;
    return 1;
  }
  
  // Converts an input from ascii to integer 
  int x = atoi(argv[1]);
  
  if( increasing(x) ) 
	std::cout << "Increasing order." << std::endl;

  else 
	std::cout << "Not increasing order." << std::endl;

  return 0;
}
