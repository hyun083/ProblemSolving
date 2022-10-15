#include <iostream>
#include <vector>
#include <queue>
#include <string>
using namespace std;

struct Info{
    int x,y,cnt;
};
int n,m;
int ans = 10001;
vector<vector<int>> map(100,vector<int>(100));
vector<vector<bool>> visited(100,vector<bool>(100));
int dx[4] = {-1,1,0,0};
int dy[4] = {0,0,-1,1};
void bfs(){
    queue<Info> q;
    q.push({0,0,1});
    while(!q.empty()){
        Info curr = q.front(); q.pop();
        int x = curr.x;
        int y = curr.y;
        int cnt = curr.cnt;
        if(x==n-1 && y==m-1){
            ans = cnt;
            return;
        }
        for(int i=0; i<4; i++){
            int nx = x+dx[i];
            int ny = y+dy[i];
            if(nx<0 || nx>=n || ny<0 || ny>=m || map[nx][ny]==0){ continue; }
            if(!visited[nx][ny]){
                visited[nx][ny] = true;
                q.push({nx,ny,cnt+1});
            }
        }
    }
}
int main() {
    cin >> n >> m;
    for(int i=0; i<n; i++){
        string input;
        cin >> input;
        for(int k=0; k<m; k++){
            map[i][k] = input[k]-'0';
            visited[i][k] = false;
        }
    }
    visited[0][0] = true;
    bfs();
    cout << ans;
    return 0;
}
