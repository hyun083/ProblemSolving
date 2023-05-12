#include <queue>
#include <vector>
#include <iostream>
using namespace std;

int main() {
    queue<vector<int>> q;
    int N, idx, cnt;
    cin >> N;
    cnt = 1;
    idx = 2;
    vector<int> v(2,1);
    
    while(cnt<N){
        if (idx%2 == 0){
            v[0] = 1;
            v[1] = idx;
            cnt++;
            
            while ((v[1]>1) && (cnt<N)){
                v[1]--;
                v[0]++;
                cnt++;
            }
        }else{
            v[0] = idx;
            v[1] = 1;
            cnt++;
            
            while ((v[0]>1) && (cnt<N)){
                v[1]++;
                v[0]--;
                cnt++;
            }
        }
        idx++;
    }
    
    cout << v[0] << "/" << v[1];
    return 0;
}