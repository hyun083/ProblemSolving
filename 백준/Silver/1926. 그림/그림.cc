#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
using namespace std;

vector<vector<int>> map(500,vector<int>(500));
vector<vector<bool>> visited(500,vector<bool>(500));
int main() {
    int n,m;
    cin >> n >> m;
    int size = 0;
    int count = 0;
    for(int i=0; i<n; i++) {
        for (int k = 0; k < m; k++) {
            cin >> map[i][k];
            visited[i][k] = false;
        }
    }
    for(int i=0; i<n; i++) {
        for (int k = 0; k < m; k++) {
            if(map[i][k]==1 && !visited[i][k]){
                count ++;
                visited[i][k] = true;
                int dx[4] = {-1,1,0,0};
                int dy[4] = {0,0,-1,1};
                int cnt = 1;
                queue<pair<int,int>> q;
                q.push(make_pair(i,k));
                while(!q.empty()){
                    pair<int,int> curr = q.front();
                    q.pop();
                    for(int i=0; i<4; i++){
                        int nx = dx[i]+curr.first;
                        int ny = dy[i]+curr.second;
                        if(nx<0 || nx>=n || ny<0 || ny>=m || map[nx][ny]==0){ continue; }
                        if(!visited[nx][ny]){
                            cnt ++;
                            visited[nx][ny] = true;
                            q.push(make_pair(nx,ny));
                        }
                    }
                }
                size = max(size,cnt);
            }
        }
    }
    cout << count << endl << size;
    return 0;
}
