#include <iostream>
#include <string>


// recursive function to reverse a string
// you should start your debugging here with a breakpoint
void ReverseText(std::string & msg, int start = 0, int end = -1)
{
	
	if (end  ==  -1) 
		end = (int)msg.length() - 1;  // init case
	
	if (end < start) 
		return;             // base case
	
	else
	{
		char swap_char  = msg[start];
		msg[start] = msg[end];
		msg[end]   = swap_char;
		
		ReverseText(msg, start++, end--);
	}
}

// A simple loop-based decode function for string
void DecodeText(std::string & msg){
	
	long unsigned int len = msg.length();
	
	for(long unsigned int i = 0; i < len; ++i) 
		msg[i] = msg[i] ^ 0x02;
	
}

// decodes a secret message
int main()
{	
	// Do not change this secret text
	std::string secret = "qoSmSOjEqa5?t=javcu-oma,g`wvwm{,uuu--8qrvvj";
	std::cout << "secret:  " << secret << std::endl;
	
	ReverseText(secret);
	std::cout << "Reverse: " << secret << std::endl;
	
	DecodeText(secret);
	std::cout << "Message: " << secret << std::endl;
	
	return 0;
}
