#include<stdio.h>

void Multiple(int first, int end, int num)
{
	int i = first;
	for(i = first; i <= (end - first + 1); i++)
	{
		if (i % 3 == 0)
			printf("%d ", i);
	}
}

int main()
{
	int num = 3;
	int first = 1;
	int end = 100;
	Multiple(first, end, num);
	return 0;
}