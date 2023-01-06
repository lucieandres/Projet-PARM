#include "pins.h"

void run()
{
	INIT();

	const unsigned int N = 100;
	unsigned int R = 1 << 15;
	unsigned int r2 = R;
	r2 *= r2;
	unsigned int ok = 0;
	unsigned int mask = R - 1;
	for (unsigned int i = 0; i < N; i++)
	{
		PUTCHAR('.');
		unsigned int x = (RNG32 & mask);
		unsigned int y = (RNG32 & mask);
		if (x * x + y * y < r2)
			ok++;
	}
	
	unsigned int pi;
	DIV(ok * 4000, N, &pi);
	
	RES = pi;
	PRINTRES();
	
	while(1);
}