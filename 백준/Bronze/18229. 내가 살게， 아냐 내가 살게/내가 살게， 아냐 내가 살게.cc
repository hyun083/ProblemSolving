#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    cin.tie(NULL);
    ios_base::sync_with_stdio(false);
    
    int N,M,K,ansNum,ansIdx;
    cin >> N >> M >> K;
    bool flag = false;
    vector<vector<int>> map(N, vector<int>(M));
    
    for(int i=0; i<N; i++){
        for(int k=0; k<M; k++){
            cin >> map[i][k];
            if(k){ map[i][k] += map[i][k-1]; }
        }
    }
    for(int k=0; k<M; k++){
        for(int i=0; i<N; i++){
            if(map[i][k]>=K && flag==false){
                flag = true;
                ansNum = i+1;
                ansIdx = k+1;
            }
        }
    }
    cout << ansNum << " " << ansIdx << "\n";
    return 0;
}