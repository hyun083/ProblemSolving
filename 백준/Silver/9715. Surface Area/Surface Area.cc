#include <iostream>
#include <vector>
using namespace std;

int T,R,C,ans;
vector<vector<int>> map;

int bfs(int x, int y){
    int res = 2;
    vector<int> dx = {-1,1,0,0};
    vector<int> dy = {0,0,-1,1};
    
    for(int i=0; i<4; i++){
        int nx = x+dx[i];
        int ny = y+dy[i];
        
        if(nx<0 || nx>=R || ny<0 || ny>=C){
            res += map[x][y];
            continue;
        }
        
        if(map[nx][ny] < map[x][y]){
            res += map[x][y]-map[nx][ny];
        }
    }
    return res;
}

int main(int argc, const char * argv[]) {
    cin.tie(NULL);
    ios_base::sync_with_stdio(false);
    
    cin >> T;
    
    for(int i=0; i<T; i++){
        ans = 0;
        cin >> R >> C;
        map = vector<vector<int>>(R, vector<int>(C,0));
        string tmp;
        
        for(int r=0; r<R; r++){
            cin >> tmp;
            for(int c=0; c<C; c++){
                map[r][c] = int(tmp[c]-'0');
            }
        }
        
        for(int r=0; r<R; r++){
            for(int c=0; c<C; c++){
                if(map[r][c]>0){ ans += bfs(r, c); }
            }
        }
        cout << ans << "\n";
    }
    return 0;
}