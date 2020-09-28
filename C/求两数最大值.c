#include<stdio.h>

int Max(int num1, int num2)
{
    return num1 >= num2 ? num1 : num2;
}

int main()
{
    int num1 = 0;
    int num2 = 0;
    scanf("%d %d", &num1, &num2);
    printf("Max : %d", Max(num1, num2));
    return 0;
}