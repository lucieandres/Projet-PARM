#include "pins.h"

void run()
{
	INIT();
	
	PIXSET(2, 0);
	PIXSET(5, 0);
	PIXSET(1, 2);
	PIXSET(2, 3);
	PIXSET(3, 3);
	PIXSET(4, 3);
	PIXSET(5, 3);
	PIXSET(6, 2);
	SCRUPD();
	
	while (1);
}