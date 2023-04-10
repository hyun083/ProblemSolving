#include <iostream>
using namespace std;
int main() {
    int N;
    cin >> N;
    int numbers[2000001];
    std::fill_n(numbers,2000001,1000001);

    for(int i=0; i<N; i++){
        int number;
        cin >> number;
        numbers[1000000+number] = number;
    }

    for(int i=0; i<2000001; i++){
        if(numbers[i] != 1000001){
            cout << numbers[i] << "\n";
        }
    }

    return 0;
}
