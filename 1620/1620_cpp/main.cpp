#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    vector<string> arr;
    int N,M;
    cin >> N;
    cin >> M;

    for(int i=0; i<N; i++){
        string pocket;
        cin >> pocket;
        arr.push_back(pocket);
    }

    for(int i=0; i<M; i++){
        string q;
        cin >> q;
        if(48 <= q.front() && q.front() <= 57){
            int num = stoi(q);
            cout << arr[num-1] << "\n";
        }else{
            cout << find(arr.begin(),arr.end(),q) - arr.begin() + 1<< "\n";
        }
    }
    return 0;
}
