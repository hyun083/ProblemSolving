#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int32_t N = 0;
    int32_t rankOfYonsei = 0;
    int32_t rankOfKorea = 0;
    string yonseiStr = "yonsei";
    string koreaStr = "korea";
    
    cin >> N;
    for (int i=0; i<N; i++)
    {
        string name = "";
        cin >> name;
        
        if(name == yonseiStr)
        {
            rankOfYonsei = i;
        }
        else if (name == koreaStr)
        {
            rankOfKorea = i;
        }
    }
    cout << ((rankOfKorea > rankOfYonsei) ? "Yonsei Won!":"Yonsei Lost...");
    return EXIT_SUCCESS;
}