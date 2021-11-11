#include <iostream>
using namespace std;

int numbers[20000001];
int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    fill_n(numbers,20000001,0);
    int N;
    cin >> N;

    for(int i=0; i<N; i++){
        int cards;
        cin >> cards;
        numbers[cards+10000000] ++;
    }
    int M;
    cin >> M;
    for(int i=0; i<M; i++){
        int number;
        cin >> number;
        cout << numbers[number+10000000] << " ";
    }
    return 0;
}
