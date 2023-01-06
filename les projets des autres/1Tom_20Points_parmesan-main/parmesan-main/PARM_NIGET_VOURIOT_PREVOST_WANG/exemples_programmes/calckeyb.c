#include "pins.h"

void run() 
{
	INIT();
	
	int a, b;
	
	PUTCHAR('A');
	PUTCHAR('=');
	a = READINT();
	PUTCHAR('\n');
	
	PUTCHAR('B');
	PUTCHAR('=');
	b = READINT();
	PUTCHAR('\n');
	
	PUTCHAR('+');
	PUTCHAR('-');
	PUTCHAR('*');
	PUTCHAR('/');
	PUTCHAR('%');
	PUTCHAR('&');
	PUTCHAR('|');
	PUTCHAR('^');

	int choice;
read:
	choice = READKEY();
	
	if (choice == '+')
		RES = a + b;
	else if (choice == '-')
		RES = a - b;
	else if (choice == '*')
		RES = a * b;
	else if (choice == '/')
		RES = DIV(a, b);
	else if (choice == '%')
		RES = MOD(a, b);
	else if (choice == '&')
		RES = a & b;
	else if (choice == '|')
		RES = a | b;
	else if (choice == '^')
		RES = a ^ b;
	else
		goto read;
		
	PUTCHAR('\n');
	PUTCHAR('R');
	PUTCHAR('=');
	PRINTRES_SIGN();
		
	while (!KEYBeof);

	RESET();
}