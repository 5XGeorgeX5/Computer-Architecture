#include <stdio.h>

int main()
{
    int array[10] = {10, 31, 5, 7, 11, 3, 8, 40, 12, 4};
    int size = 10;
    int count = 0;

    for (int i = 0; i < 10; i++)
    {
        if (array[i] % 2 == 0)
        {
            count++;
        }
    }

    printf("Count of even numbers is: %d\n", count);

    return 0;
}
