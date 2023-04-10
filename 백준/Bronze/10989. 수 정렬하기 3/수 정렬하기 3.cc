#include <iostream>
using namespace std;

int main() {
    ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0);
    int N;
    int arr[10000];
    fill_n(arr,10000,0);
    cin >> N;

    for(int i=0; i<N; i++){
        int number;
        cin >> number;
        arr[number-1] ++;
    }
    for(int i=0; i<10000; i++){
        while(arr[i] > 0){
            cout << i+1 << "\n";
            arr[i]--;
        }
    }
    return 0;
}
