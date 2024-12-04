#include <iostream>
#include <queue>
#include <vector>
using namespace std;

vector<int> dijk(int DEP);
vector<vector<pair<int,int>>> map;
int N,M,B;

int main(int argc, const char * argv[]) {
    cin >> N >> M >> B;
    map = vector<vector<pair<int,int>>>(N);
    
    for(int i=0; i<M; i++){
        int U,V,C;
        cin >> U >> V >> C;
        U--;
        V--;
        map[U].push_back(make_pair(V, C));
        map[V].push_back(make_pair(U, C));
    }
    
    vector<int> minCost = dijk(0);
    
    for(int i=0; i<B; i++){
        int U, V;
        cin >> U >> V;
        U--;
        V--;
        cout << minCost[U] + minCost[V] << "\n";
    }
    return 0;
}

vector<int> dijk(int DEP){
    vector<int> minCost(N,2000000000);
    priority_queue<pair<int, int>> q;
    
    q.push(make_pair(DEP, 0));
    minCost[DEP] = 0;
    
    while (!q.empty()) {
        auto curr = q.top(); q.pop();
        if(minCost[curr.first] < curr.second){ continue; }
        
        for(auto next:map[curr.first]){
            int newCost = curr.second + next.second;
            if(newCost < minCost[next.first]){
                minCost[next.first] = newCost;
                q.push(make_pair(next.first, newCost));
            }
        }
    }
    
    return minCost;
}