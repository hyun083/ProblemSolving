#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

vector<vector<int>> arr;
vector<bool> visited;

void dfs(int num){
    visited[num] = true;
    for(int next: arr[num]){
        if(visited[next] == false) dfs(next);
    }
}

int main() {
    int N,M;
    cin >> N >> M;
    arr.resize(N); visited.resize(N,false);

    for(int i=0; i<M; i++){
        int u,v;
        cin >> u >> v;
        arr[u-1].push_back(v-1);
        arr[v-1].push_back(u-1);
    }
    for(int i=0; i<N; i++){
        sort(arr[i].begin(),arr[i].end());
    }

    int cnt = 0;
    for(int i=0; i<N; i++){
        if(visited[i] == false){
            dfs(i);
            cnt ++;
        }
    }
    cout << cnt;
    return 0;
}
