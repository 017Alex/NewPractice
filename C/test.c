#include<stdio.h>


int main()
{
    int sum = 0;
    int s = 1;
    for(int i = 1; i <= 10; i++){
        s = s * i;
        sum += s;
    }
    printf("%d", sum);
    /*
    int n = 0;
    scanf("%d", &n);
    int i = 1, s = 1;
    while(i <= n){
        s = s * i;
        i++;
    }
    printf("%d", s);
    */
    return 0;
}