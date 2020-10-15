#include<stdio.h>

void Leap(int first, int end)
{
    int i = first;
    for (i = first; i <= end; i++)
    {
        if (i % 4 == 0 && i % 100 != 0)
            printf("%d ", i);
    }
}

int main()
{
    int first = 1000;
    int end = 2000;
    Leap(first, end);
    return 0;
}