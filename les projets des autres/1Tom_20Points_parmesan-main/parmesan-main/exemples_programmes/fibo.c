#include "pins.h"

void run()
{
	INIT();
	
	int a = 0;
	int b = 1;
	int suiv;
	while (1)
	{
		RES = b;
		PRINTRES();
		PUTCHAR('\n');
		suiv = a + b;
		a = b;
		b = suiv;
	}
}