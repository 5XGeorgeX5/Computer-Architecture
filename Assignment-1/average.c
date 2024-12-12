#include <stdio.h>

int main()
{
    int array[10] = {7, 2, 5, 11, 4, 6, 1, 1, 8, 3};
    int size = 10;
    int sum = 0;

    for (int i = 0; i < size; i++)
    {
        sum += array[i];
    }

    float average = (float)sum / size;

    printf("Average is: %.1f\n", average);

    return 0;
}