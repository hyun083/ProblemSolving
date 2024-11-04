#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;

int main(int argc, const char * argv[]) {
    cin.tie(NULL);
    ios_base::sync_with_stdio(false);
    
    int N, total=0;
    cin >> N;
    map<int,int> line;
    vector<pair<int,int>> arr;
    vector<vector<int>> pointOf(N+1,vector<int>());
    
    for(int i=0; i<N; i++){
        int coord, color;
        cin >> coord >> color;
        arr.push_back(make_pair(coord, color));
        line[coord] = 1000000000;
    }
    sort(arr.begin(), arr.end());
    
    for(auto point: arr){
        int coord = point.first;
        int color = point.second;
        pointOf[color].push_back(coord);
    }
    
    for(int color=1; color<=N; color++){
        if(pointOf[color].empty()){ continue; }
        if(pointOf[color].size()==1){
            line[pointOf[color][0]] = 0;
        }else{
            for(int i=0; i<pointOf[color].size()-1; i++){
                int curr = pointOf[color][i];
                int next = pointOf[color][i+1];
                int length = next-curr;
                line[curr] = min(line[curr],length);
                line[next] = min(line[next],length);
            }
        }
    }
    
    for(auto point: line){ total += point.second; }
    cout << total << "\n";
    return 0;
}