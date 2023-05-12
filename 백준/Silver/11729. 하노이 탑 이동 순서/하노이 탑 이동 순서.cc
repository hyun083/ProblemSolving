#include <iostream>
#include <vector>
#include <string>
using namespace std;

int N;
int CNT = 0;
string output;

void hanoi(int cnt, int start, int mid, int end){
    vector<int> res(2,0);
    CNT ++;
    if(cnt==1){
        output += to_string(start) + " " + to_string(end) + "\n";
        return;
    }
    
    hanoi(cnt-1, start, end, mid);
    output += to_string(start) + " " + to_string(end) + "\n";
    hanoi(cnt-1, mid, start, end);
}

int main() {
    cin >> N;
    hanoi(N, 1, 2, 3);
    cout << CNT << "\n" << output;
    return 0;
}