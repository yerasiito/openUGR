#include <stdio.h>

void crear_muestra (char h, char l);

int main (void)
   {
    crear_muestra (0x01,0xf5);
   }

void crear_muestra (char h, char l)
   {
    char m;	// Muestra de 8 bits
/*
              h                      l 
    +---------+---------+  +---------+---------+
    | 0 0 0 0 | x x x x |  | y y y y | z z z z |
    +---------+---------+  +---------+---------+
                    |          |
                    v          v
               +---------+---------+
               | x x x x | y y y y |
               +---------+---------+
                         m
*/
     m = h << 4 | l >> 4;

     printf ("m = %x\n",(unsigned) (unsigned char) m);
    }
