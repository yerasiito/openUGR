#include <stdlib.h>	// rand
#include <stdio.h>	// printf
#include <time.h>	// time

#define SIZE (1<<16)

int main (void)
{
    unsigned r;
    int i;

    srand (time (NULL));
    for (i=0; i<SIZE; i++)
    {
       r = (unsigned) rand () * 2;
       printf ("r = %u = 0x%08x\n",r,r);
    }

    return 0;
}

