#include "pins.h"

void run()
{
	INIT();
	
	for (int i = 32; i < 128; i++)
	{
		PUTCHAR(i);
	}
	
	while(1);
}