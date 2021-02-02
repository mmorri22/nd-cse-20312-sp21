#!/bin/sh
# Grading script developed by Matthew Morrison
# Spring 2021 - Data Structures - Coding Challenge 1 - Grading Script

# Variables for the script
SCRIPT_OUT="grade.out"
REDIRECT="redirect.out"

# Point Breakdown Variables
STUDENT_GRADE=0
TOTAL=400
VALGRIND_MSG="ERROR SUMMARY: 0 errors"
VALGRIND_PTS=10
CLEAN=10
LUCKY=25
LUCKY_1=20
LUCKY_2=20
LUCKY_3=20
LUCKY_4=20
LUCKY_5=20
STREAMS=25
STREAMS_1=15
STREAMS_2=20
STREAMS_3=20
STREAMS_4=20
STREAMS_BAD=15
COMBINE=25
COMBINE_1=15
COMBINE_2=20
COMBINE_3=20
COMBINE_4=20
COMBINE_5=20

# Delete the script.out so student can test multiple times
# and we can still use >> to append while running a test
if test -f $SCRIPT_OUT; then
    rm $SCRIPT_OUT
fi

# Write initial messages to the output file
INTRO_MESSAGE="Grading script for Coding Challenge 1"
NAME_MESSAGE="Type in the student's name:"
ID_MESSAGE="Type in the student's Notre Dame netID name:"

echo "-----------------------------" >> $SCRIPT_OUT
echo $INTRO_MESSAGE >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Get the student's name and ND netID
echo $NAME_MESSAGE
read STUDENT_NAME
echo $ID_MESSAGE
read STUDENT_ID

# Print the name and ID to the script.out
echo "Student's Name: $STUDENT_NAME" >> $SCRIPT_OUT
echo "Student's ID  : $STUDENT_ID" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# Test the make clean command 
#######################

echo "Testing make clean" >> $SCRIPT_OUT
MAKE_TEST_EXPECTED="rm -rf *.o lucky streams combine"
MAKE_TEST_RESULT=$(make clean)

# Send results to the script
echo "Expected 'make clean' output: $MAKE_TEST_EXPECTED" >> $SCRIPT_OUT
echo "Actual 'make clean' output  : $MAKE_TEST_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not
if $MAKE_TEST_EXPECTED = $MAKE_TEST_RESULT; 

then 
	echo "make clean test passed" >> $SCRIPT_OUT
	echo "$CLEAN / $CLEAN" >> $SCRIPT_OUT
	((STUDENT_GRADE += $CLEAN))
	
else
	echo "make clean test failed" >> $SCRIPT_OUT
	echo "0 / 15" >> $SCRIPT_OUT
	
fi


#######################
# Test the make lucky command 
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing make lucky" >> $SCRIPT_OUT

# make lucky comparison variables
MAKE_LUCKY="make lucky"
MAKE_LUCKY_EXPECTED="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -c lucky.cpp
g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -o lucky lucky.o"
MAKE_LUCKY_RESULT=$( $MAKE_LUCKY )

# Send results to the script
echo "Expected $MAKE_LUCKY output: $MAKE_LUCKY_EXPECTED" >> $SCRIPT_OUT
echo "Actual $MAKE_LUCKY output  : $MAKE_LUCKY_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky
if [ "$MAKE_LUCKY_EXPECTED" = "$MAKE_LUCKY_RESULT" ]; 

then 
	echo "$MAKE_LUCKY test passed" >> $SCRIPT_OUT
	echo "$LUCKY / $LUCKY" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LUCKY))
	
else
	echo "$MAKE_LUCKY test failed" >> $SCRIPT_OUT
	echo "0 / $LUCKY" >> $SCRIPT_OUT
	
fi

############################################################
# Running ./lucky tests
############################################################

# lucky tests 
LUCKY_1_TEST="./lucky 11235"
LUCKY_1_EXPECTED="Increasing order"

LUCKY_2_TEST="./lucky 13425"
LUCKY_2_EXPECTED="Not increasing order"

LUCKY_3_TEST="./lucky 11112222"
LUCKY_3_EXPECTED="Increasing order"

LUCKY_4_TEST="./lucky 7"
LUCKY_4_EXPECTED="Increasing order"

LUCKY_5_TEST="./lucky 1234356"
LUCKY_5_EXPECTED="Not increasing order"

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing lucky program" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# LUCKY_1 Test
#######################

# Need to re-compile on first test since $( $MAKE_LUCKY ) automatically deletes executable
$MAKE_LUCKY > $REDIRECT
LUCKY_1_RESULT=$( $LUCKY_1_TEST )

echo "Expected '$LUCKY_1_TEST' output: $LUCKY_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LUCKY_1_TEST' output: $LUCKY_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LUCKY_1_EXPECTED" = "$LUCKY_1_RESULT" ]; 

then 
	echo "$LUCKY_1_TEST test passed" >> $SCRIPT_OUT
	echo "$LUCKY_1 / $LUCKY_1" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LUCKY_1))
	
else
	echo "LUCKY_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $LUCKY_1" >> $SCRIPT_OUT
	
fi

#######################
# LUCKY_2 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

LUCKY_2_RESULT=$( $LUCKY_2_TEST )

echo "Expected '$LUCKY_2_TEST' output: $LUCKY_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LUCKY_2_TEST' output: $LUCKY_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LUCKY_2_EXPECTED" = "$LUCKY_2_RESULT" ]; 

then 
	echo "$LUCKY_2_TEST test passed" >> $SCRIPT_OUT
	echo "$LUCKY_2 / $LUCKY_2" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LUCKY_2))
	
else
	echo "LUCKY_2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $LUCKY_2" >> $SCRIPT_OUT
	
fi


#######################
# LUCKY_3 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

LUCKY_3_RESULT=$( $LUCKY_3_TEST )

echo "Expected '$LUCKY_3_TEST' output: $LUCKY_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LUCKY_3_TEST' output: $LUCKY_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LUCKY_3_EXPECTED" = "$LUCKY_3_RESULT" ]; 

then 
	echo "$LUCKY_3_TEST test passed" >> $SCRIPT_OUT
	echo "$LUCKY_3 / $LUCKY_3" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LUCKY_3))
	
else
	echo "LUCKY_3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $LUCKY_3" >> $SCRIPT_OUT
	
fi


#######################
# LUCKY_4 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

LUCKY_4_RESULT=$( $LUCKY_4_TEST )

echo "Expected '$LUCKY_4_TEST' output: $LUCKY_4_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LUCKY_4_TEST' output: $LUCKY_4_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LUCKY_4_EXPECTED" = "$LUCKY_4_RESULT" ]; 

then 
	echo "$LUCKY_4_TEST test passed" >> $SCRIPT_OUT
	echo "$LUCKY_4 / $LUCKY_4" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LUCKY_4))
	
else
	echo "LUCKY_4_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $LUCKY_4" >> $SCRIPT_OUT
	
fi


#######################
# LUCKY_5 Test
#######################

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

LUCKY_5_RESULT=$( $LUCKY_5_TEST )

echo "Expected '$LUCKY_5_TEST' output: $LUCKY_5_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$LUCKY_5_TEST' output: $LUCKY_5_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$LUCKY_5_EXPECTED" = "$LUCKY_5_RESULT" ]; 

then 
	echo "$LUCKY_5_TEST test passed" >> $SCRIPT_OUT
	echo "$LUCKY_5 / $LUCKY_5" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LUCKY_5))
	
else
	echo "LUCKY_5_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $LUCKY_5" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#########################
# LUCKY_VALGRIND Test
#########################

# Test re-direct file
LUCKY_VALGRIND_REDIRECT="lucky_valgrind.out"

# valgrind command 
LUCKY_VALGRIND_TEST="valgrind --tool=memcheck --leak-check=yes $LUCKY_5_TEST > $LUCKY_VALGRIND_REDIRECT 2>&1"

# Print tests to student 
echo "lucky valgrind test" >> $SCRIPT_OUT
echo $LUCKY_VALGRIND_TEST >> $SCRIPT_OUT
make lucky > $REDIRECT

# Run the valgrind test
LUCKY_VALGRIND_RESULT=$(valgrind --tool=memcheck --leak-check=yes ./lucky 111222333 > $LUCKY_VALGRIND_REDIRECT 2>&1)
$LUCKY_VALGRIND_RESULT

#Check to determine if the valgrind passed:
if grep -q "$VALGRIND_MSG" $LUCKY_VALGRIND_REDIRECT

then
	echo "$LUCKY_VALGRIND_TEST passed" >> $SCRIPT_OUT
	echo "$VALGRIND_PTS / $VALGRIND_PTS" >> $SCRIPT_OUT
	((STUDENT_GRADE += $VALGRIND_PTS))
	
else
	echo "$LUCKY_VALGRIND_TEST failed" >> $SCRIPT_OUT
	echo "0 / $VALGRIND_PTS" >> $SCRIPT_OUT
	echo "" >> $SCRIPT_OUT
	echo "Contents of the valgrind test:" >> $SCRIPT_OUT
	cat $LUCKY_VALGRIND_REDIRECT >> $SCRIPT_OUT
	
fi

# Remove the valgrind re-direct file 
rm $LUCKY_VALGRIND_REDIRECT

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


############################################################
# Running ./streams tests
############################################################

# streams tests 
STREAMS_1_TEST="./streams"
STREAMS_1_EXPECTED="Incorrect number of inputs."

STREAMS_2_TEST="./streams streams1.txt"
STREAMS_2_EXPECTED="speak
like
this,
does
Yoda"

STREAMS_3_TEST="./streams streams2.txt"
STREAMS_3_EXPECTED="Cheer
Cheer
for
ol'
Notre
Dame"

STREAMS_4_TEST="./streams streams3.txt"
STREAMS_4_EXPECTED="The
quick
brown
fox
jumps
over
the
lazy
dog."

STREAMS_BAD_TEST="./streams streamsBad.txt"
STREAMS_BAD_EXPECTED="File requires an initial integer."

#######################
# Test the make streams command 
#######################

MAKE_STREAMS="make streams"

MAKE_STREAMS_EXPECTED="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -c streams.cpp
g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -o streams streams.o"

MAKE_STREAMS_RESULT=$( $MAKE_STREAMS )

# Send results to the script
echo "Expected $MAKE_STREAMS output: $MAKE_STREAMS_EXPECTED" >> $SCRIPT_OUT
echo "Actual $MAKE_STREAMS output  : $MAKE_STREAMS_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky
if [ "$MAKE_STREAMS_EXPECTED" = "$MAKE_STREAMS_RESULT" ]; 

then 
	echo "$MAKE_STREAMS test passed" >> $SCRIPT_OUT
	echo "$STREAMS / $STREAMS" >> $SCRIPT_OUT
	((STUDENT_GRADE += $STREAMS))
	
else
	echo "$MAKE_STREAMS test failed" >> $SCRIPT_OUT
	echo "0 / $STREAMS" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# STREAMS_1 Test
#######################

# Need to re-compile on first test since $( $MAKE_STREAMS ) automatically deletes executable
$MAKE_STREAMS > $REDIRECT

# Run the test and save the output 
STREAMS_1_RESULT=$( $STREAMS_1_TEST )

echo "Expected '$STREAMS_1_TEST' output: $STREAMS_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$STREAMS_1_TEST' output: $STREAMS_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$STREAMS_1_EXPECTED" = "$STREAMS_1_RESULT" ]; 

then 
	echo "$STREAMS_1_TEST test passed" >> $SCRIPT_OUT
	echo "$STREAMS_1 / $STREAMS_1" >> $SCRIPT_OUT
	((STUDENT_GRADE += $STREAMS_1))
	
else
	echo "STREAMS_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $STREAMS_1" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

#######################
# STREAMS_2 Test
#######################


STREAMS_2_RESULT=$( $STREAMS_2_TEST )

echo "Expected '$STREAMS_2_TEST' output: $STREAMS_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$STREAMS_2_TEST' output: $STREAMS_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$STREAMS_2_EXPECTED" = "$STREAMS_2_RESULT" ]; 

then 
	echo "$STREAMS_2_TEST test passed" >> $SCRIPT_OUT
	echo "$STREAMS_2 / $STREAMS_2" >> $SCRIPT_OUT
	((STUDENT_GRADE += $STREAMS_2))
	
else
	echo "STREAMS_2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $STREAMS_2" >> $SCRIPT_OUT
	echo "Note: Check to see if you are printing an extra ENDL at the end if the outputs appear to match" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# STREAMS_3 Test
#######################

STREAMS_3_RESULT=$( $STREAMS_3_TEST )

echo "Expected '$STREAMS_3_TEST' output: $STREAMS_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$STREAMS_3_TEST' output: $STREAMS_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$STREAMS_3_EXPECTED" = "$STREAMS_3_RESULT" ]; 

then 
	echo "$STREAMS_3_TEST test passed" >> $SCRIPT_OUT
	echo "$STREAMS_3 / $STREAMS_3" >> $SCRIPT_OUT
	((STUDENT_GRADE += $STREAMS_3))
	
else
	echo "STREAMS_3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $STREAMS_3" >> $SCRIPT_OUT
	echo "Note: Check to see if you are printing a space at the end if the outputs appear to match" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# STREAMS_4 Test
#######################

STREAMS_4_RESULT=$( $STREAMS_4_TEST )

echo "Expected '$STREAMS_4_TEST' output: $STREAMS_4_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$STREAMS_4_TEST' output: $STREAMS_4_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$STREAMS_4_EXPECTED" = "$STREAMS_4_RESULT" ]; 

then 
	echo "$STREAMS_4_TEST test passed" >> $SCRIPT_OUT
	echo "$STREAMS_4 / $STREAMS_4" >> $SCRIPT_OUT
	((STUDENT_GRADE += $STREAMS_4))
	
else
	echo "STREAMS_4_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $STREAMS_4" >> $SCRIPT_OUT
	echo "Note: Check to see if you are printing a space at the end if the outputs appear to match" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# STREAMS_BAD Test
#######################

STREAMS_BAD_RESULT=$( $STREAMS_BAD_TEST )

echo "Expected '$STREAMS_BAD_TEST' output: $STREAMS_BAD_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$STREAMS_BAD_TEST' output: $STREAMS_BAD_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$STREAMS_BAD_EXPECTED" = "$STREAMS_BAD_RESULT" ]; 

then 
	echo "$STREAMS_BAD_TEST test passed" >> $SCRIPT_OUT
	echo "$STREAMS_BAD / $STREAMS_BAD" >> $SCRIPT_OUT
	((STUDENT_GRADE += $STREAMS_BAD))
	
else
	echo "STREAMS_BAD_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $STREAMS_BAD" >> $SCRIPT_OUT
	echo "Note: Check to see if you are printing a space at the end if the outputs appear to match" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#########################
# STREAMS_VALGRIND Test
#########################

# Test re-direct file
STREAMS_VALGRIND_REDIRECT="streams_valgrind.out"

# valgrind command 
STREAMS_VALGRIND_TEST="valgrind --tool=memcheck --leak-check=yes $STREAMS_4_TEST > $STREAMS_VALGRIND_REDIRECT 2>&1"

# Print tests to student 
echo "streams valgrind test" >> $SCRIPT_OUT
echo $STREAMS_VALGRIND_TEST >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Run the valgrind test
STREAMS_VALGRIND_RESULT=$( valgrind --tool=memcheck --leak-check=yes $STREAMS_4_TEST > $STREAMS_VALGRIND_REDIRECT 2>&1 )
$STREAMS_VALGRIND_RESULT


#Check to determine if the valgrind passed:
if grep -q "$VALGRIND_MSG" $STREAMS_VALGRIND_REDIRECT

then
	echo "$STREAMS_VALGRIND_TEST passed" >> $SCRIPT_OUT
	echo "$VALGRIND_PTS / $VALGRIND_PTS" >> $SCRIPT_OUT
	((STUDENT_GRADE += $VALGRIND_PTS))
	
else
	echo "$STREAMS_VALGRIND_TEST failed" >> $SCRIPT_OUT
	echo "0 / $VALGRIND_PTS" >> $SCRIPT_OUT
	echo "" >> $SCRIPT_OUT
	echo "Contents of the valgrind test:" >> $SCRIPT_OUT
	cat $STREAMS_VALGRIND_REDIRECT >> $SCRIPT_OUT
fi


# Remove the valgrind re-direct file 
rm $STREAMS_VALGRIND_REDIRECT

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT



############################################################
# Running ./combine tests
############################################################


#######################
# Test the make combine command 
#######################

echo "Testing make combine" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# make lucky comparison variables
MAKE_COMBINE="make combine"
MAKE_COMBINE_EXPECTED="g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -c combine.cpp
g++ -m64 -std=c++11 -Weffc++ -O2 -g -Wall -Wextra -Wconversion -Wshadow -pedantic -Werror -lm -o combine combine.o"
MAKE_COMBINE_RESULT=$( $MAKE_COMBINE )

# Send results to the script
echo "Expected $MAKE_COMBINE output: $MAKE_COMBINE_EXPECTED" >> $SCRIPT_OUT
echo "Actual $MAKE_COMBINE output  : $MAKE_COMBINE_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Add points to overall score or mark as 0 if not for make lucky
if [ "$MAKE_COMBINE_EXPECTED" = "$MAKE_COMBINE_RESULT" ]; 

then 
	echo "$MAKE_COMBINE test passed" >> $SCRIPT_OUT
	echo "$COMBINE / $COMBINE" >> $SCRIPT_OUT
	((STUDENT_GRADE += $LUCKY))
	
else
	echo "$MAKE_COMBINE test failed" >> $SCRIPT_OUT
	echo "0 / $COMBINE" >> $SCRIPT_OUT
	
fi



############################################################
# Running ./combine tests
############################################################

# combine tests 
COMBINE_1_TEST="./combine"
COMBINE_1_EXPECTED="Incorrect number of inputs."

COMBINE_2_TEST="./combine 7"
COMBINE_2_EXPECTED="1
3
6
10
15
21
28"

COMBINE_3_TEST="./combine 5"
COMBINE_3_EXPECTED="1
3
6
10
15"

COMBINE_4_TEST="./combine 1"
COMBINE_4_EXPECTED="1"

COMBINE_5_TEST="./combine 20"
COMBINE_5_EXPECTED="1
3
6
10
15
21
28
36
45
55
66
78
91
105
120
136
153
171
190
210"

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT
echo "Testing combine program" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT

#########################
# COMBINE_1 Test
#########################

# Need to re-compile on first test since $( $MAKE_COMBINE ) automatically deletes executable
$MAKE_COMBINE > $REDIRECT

# Run the test and save the output 
COMBINE_1_RESULT=$( $COMBINE_1_TEST )

echo "Expected '$COMBINE_1_TEST' output: $COMBINE_1_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$COMBINE_1_TEST' output: $COMBINE_1_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$COMBINE_1_EXPECTED" = "$COMBINE_1_RESULT" ]; 

then 
	echo "$COMBINE_1_TEST test passed" >> $SCRIPT_OUT
	echo "$COMBINE_1 / $COMBINE_1" >> $SCRIPT_OUT
	((STUDENT_GRADE += $STREAMS_1))
	
else
	echo "COMBINE_1_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $COMBINE_1" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# COMBINE_2 Test
#######################

# Run the program 
$COMBINE_2_TEST >> $REDIRECT

# Read the output file vec_output.txt
COMBINE_2_RESULT=$( cat vec_output.txt )

echo "Expected '$COMBINE_2_TEST' output: $COMBINE_2_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$COMBINE_2_TEST' output: $COMBINE_2_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$COMBINE_2_EXPECTED" = "$COMBINE_2_RESULT" ]; 

then 
	echo "$COMBINE_2_TEST test passed" >> $SCRIPT_OUT
	echo "$COMBINE_2 / $COMBINE_2" >> $SCRIPT_OUT
	((STUDENT_GRADE += $COMBINE_2))
	
else
	echo "COMBINE_2_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $COMBINE_2" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT



#######################
# COMBINE_3 Test
#######################

# Run the program 
$COMBINE_3_TEST >> $REDIRECT

# Read the output file vec_output.txt
COMBINE_3_RESULT=$( cat vec_output.txt )

echo "Expected '$COMBINE_3_TEST' output: $COMBINE_3_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$COMBINE_3_TEST' output: $COMBINE_3_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$COMBINE_3_EXPECTED" = "$COMBINE_3_RESULT" ]; 

then 
	echo "$COMBINE_3_TEST test passed" >> $SCRIPT_OUT
	echo "$COMBINE_3 / $COMBINE_3" >> $SCRIPT_OUT
	((STUDENT_GRADE += $COMBINE_3))
	
else
	echo "COMBINE_3_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $COMBINE_3" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# COMBINE_4 Test
#######################

# Run the program 
$COMBINE_4_TEST >> $REDIRECT

# Read the output file vec_output.txt
COMBINE_4_RESULT=$( cat vec_output.txt )

echo "Expected '$COMBINE_4_TEST' output: $COMBINE_4_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$COMBINE_4_TEST' output: $COMBINE_4_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$COMBINE_4_EXPECTED" = "$COMBINE_4_RESULT" ]; 

then 
	echo "$COMBINE_4_TEST test passed" >> $SCRIPT_OUT
	echo "$COMBINE_4 / $COMBINE_4" >> $SCRIPT_OUT
	((STUDENT_GRADE += $COMBINE_4))
	
else
	echo "COMBINE_4_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $COMBINE_4" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT


#######################
# COMBINE_5 Test
#######################

# Run the program 
$COMBINE_5_TEST >> $REDIRECT

# Read the output file vec_output.txt
COMBINE_5_RESULT=$( cat vec_output.txt )

echo "Expected '$COMBINE_5_TEST' output: $COMBINE_5_EXPECTED" >> $SCRIPT_OUT
echo "  Actual '$COMBINE_5_TEST' output: $COMBINE_5_RESULT" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT


if [ "$COMBINE_5_EXPECTED" = "$COMBINE_5_RESULT" ]; 

then 
	echo "$COMBINE_5_TEST test passed" >> $SCRIPT_OUT
	echo "$COMBINE_5 / $COMBINE_5" >> $SCRIPT_OUT
	((STUDENT_GRADE += $COMBINE_5))
	
else
	echo "COMBINE_5_TEST test failed" >> $SCRIPT_OUT
	echo "0 / $COMBINE_5" >> $SCRIPT_OUT
	
fi

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT



#########################
# COMBINE_VALGRIND Test
#########################

# Test re-direct file
COMBINE_VALGRIND_REDIRECT="streams_valgrind.out"

# valgrind command 
COMBINE_VALGRIND_TEST="valgrind --tool=memcheck --leak-check=yes $COMBINE_4_TEST > $COMBINE_VALGRIND_REDIRECT 2>&1"

# Print tests to student 
echo "streams valgrind test" >> $SCRIPT_OUT
echo $COMBINE_VALGRIND_TEST >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT

# Run the valgrind test
COMBINE_VALGRIND_RESULT=$( valgrind --tool=memcheck --leak-check=yes $COMBINE_4_TEST > $COMBINE_VALGRIND_REDIRECT 2>&1 )
$COMBINE_VALGRIND_RESULT


#Check to determine if the valgrind passed:
if grep -q "$VALGRIND_MSG" $COMBINE_VALGRIND_REDIRECT

then
	echo "$COMBINE_VALGRIND_TEST passed" >> $SCRIPT_OUT
	echo "$VALGRIND_PTS / $VALGRIND_PTS" >> $SCRIPT_OUT
	((STUDENT_GRADE += $VALGRIND_PTS))
	
else
	echo "$COMBINE_VALGRIND_TEST failed" >> $SCRIPT_OUT
	echo "0 / $VALGRIND_PTS" >> $SCRIPT_OUT
	echo "" >> $SCRIPT_OUT
	echo "Contents of the valgrind test:" >> $SCRIPT_OUT
	cat $COMBINE_VALGRIND_REDIRECT >> $SCRIPT_OUT
fi


# Remove the valgrind re-direct file 
rm $COMBINE_VALGRIND_REDIRECT

echo "" >> $SCRIPT_OUT
echo "-----------------------------" >> $SCRIPT_OUT



# Clean up the vec_output.txt file 
rm vec_output.txt


# Final Grade to both the screen and the script file.
echo "-----------------------------" >> $SCRIPT_OUT
echo "" >> $SCRIPT_OUT
echo "CC01 Coding Portion Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL " >> $SCRIPT_OUT
echo "CC01 Coding Portion Grade for $STUDENT_NAME ($STUDENT_ID): $STUDENT_GRADE / $TOTAL "
echo "Run 'vim $SCRIPT_OUT' to see the result of the test script"


# Clean and delete re-directions
make clean > $REDIRECT
rm $REDIRECT