#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main(int argc, const char * argv[]) {
    int N = 0;
    int rankOfYonsei = 0;
    int rankOfKorea = 0;
    char yonseiStr[] = "yonsei";
    char koreaStr[] = "korea";

    scanf("%d",&N);
    for (int i=0; i<N; i++)
    {
        char name[50] = "";
        scanf("%s",name);
        
        if (strcmp(name, yonseiStr)==0)
        {
            rankOfYonsei = i;
        }
        else if (strcmp(name, koreaStr)==0)
        {
            rankOfKorea = i;
        }
        else
        {
            /* do nothing */
        }
    }
    
    if (rankOfYonsei < rankOfKorea)
    {
        printf("Yonsei Won!\n");
    }
    else
    {
        printf("Yonsei Lost...\n");
    }
    return 0;
}