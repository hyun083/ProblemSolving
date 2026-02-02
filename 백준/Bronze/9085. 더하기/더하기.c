#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>

int main(int argc, const char * argv[]) {
    uint32_t T = 0;
    uint32_t N = 0;
    uint32_t sum = 0;
    
    scanf("%d",&T);
    for (int t=0; t<T; t++)
    {
        sum = 0;
        scanf("%d",&N);
        for (int i=0; i<N; i++)
        {
            uint32_t num = 0;
            scanf("%d",&num);
            sum += num;
        }
        printf("%d\n",sum);
    }
    
    return EXIT_SUCCESS;
}