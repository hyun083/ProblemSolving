#include <iostream>

using namespace std;
int T, M, N, K;
int visited[50][50];
int map[50][50];
int nx[4] = {0,0,-1,1};
int ny[4] = {-1,1,0,0};

void reset(){
    for(int x=0; x<50; x++){
        for(int y=0; y<50; y++){
            map[x][y] = 0;
            visited[x][y] = 0;
        }
    }
}
void dfs(int x, int y){
    visited[x][y] = 1;
    for(int i=0; i<4; i++){
        if(x+nx[i] < 0 || x+nx[i] > 49 || y+ny[i] < 0 || y+ny[i] > 49){
            continue;
        }
        if(map[x+nx[i]][y+ny[i]] == 1 && visited[x+nx[i]][y+ny[i]] == 0){
            dfs(x+nx[i],y+ny[i]);
        }
    }
}

int main() {
    cin >> T;
    for(int t=0; t<T; t++){
        cin >> M >> N >> K;
        reset();
        for(int i=0; i<K; i++){
            int x, y;
            cin >> x >> y;
            map[x][y] = 1;
        }
        int cnt = 0;
        for(int x=0; x<M; x++){
            for(int y=0; y<N; y++){
                if(map[x][y] == 1 && visited[x][y] == 0){
                    dfs(x,y);
                    cnt ++;
                }
            }
        }
        cout << cnt << '\n';
    }
    return 0;
}
