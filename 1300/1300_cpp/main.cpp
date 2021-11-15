#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    vector<int> arr;
    int N,M; bool flag = false;
    cin >> N;
    cin >> M;

    for(int i=1; i<=N; i++){
        for(int j=1; j<=N; j++){
            if(arr.size() < M){
                arr.push_back(i*j);
            }else{
                flag = true;
                break;
            }
        }
        if(flag){break;}
    }
    sort(arr.begin(),arr.end());

    cout << arr.back();
    return 0;
}
