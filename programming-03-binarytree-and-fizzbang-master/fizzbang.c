#include <stdio.h>

int main()                             // main function segment.
{
    int a;                             // declaring a interger called a.
    printf("FizzBang Demo\n");         // printing 'FizzBang Demo at the start of the output.
    for(a=1; a<=20; a++){              // for loop to loop round 20 numbers.
        if(a % 15 == 0)                // if statement, if the value of a is diviable to 15 then enter statement.
            printf("FizzBang\n");      // if a is divisable by 15 then print 'FizzBang'.
        else if(a % 5 == 0)            // if a isnt divisable by 15 check if it is divisable by 5.
            printf("Bang\n");          // if it is diviable by 5 then print 'Bang'.
        else if(a % 3 == 0)            // if a isnt divisable by 5 then check if it is diviable by 3.
            printf("Fizz\n");          // if a is diviable by 3 then print 'Fizz'.
        else                            
            printf("%d\n", a);         // otherwise print the value a.
        }
    return 0;
}

