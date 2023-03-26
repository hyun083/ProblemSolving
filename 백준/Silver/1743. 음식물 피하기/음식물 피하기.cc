#include <iostream>
#include <algorithm>
#include <cstring>
using namespace std;

int N,M,K;
int map[100][100];
int visited[100][100];
int nr[4] = {-1,1,0,0};
int nc[4] = {0,0,-1,1};

int dfs(int r, int c){
    int cnt = 0;
    visited[r][c] = 1;
    cnt ++;
    for(int i=0; i<4; i++){
        int R = r + nr[i];
        int C = c + nc[i];
        if(R < 0 || R > N || C < 0 || C > M){continue;}
        else if(map[R][C] == 1 && visited[R][C] == 0){
            cnt += dfs(R,C);
        }
    }
    return cnt;
}

int main() {
    cin >> N >> M >> K;
    memset(map,0,sizeof(map));
    memset(visited,0,sizeof(visited));
    for(int k=0; k<K; k++){
        int r,c;
        cin >> r >> c;
        map[r-1][c-1] = 1;
    }

    int maxCnt = 0;

    for(int r=0; r<N; r++){
        for(int c=0; c<M; c++){
            if(map[r][c] == 1 && visited[r][c]==0){
                maxCnt = max(maxCnt,dfs(r,c));
            }
        }
    }

    cout << maxCnt;
    return 0;
}
