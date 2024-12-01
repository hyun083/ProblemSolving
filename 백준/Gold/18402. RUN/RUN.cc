#include <iostream>
#include <queue>

using namespace std;

int main(int argc, const char * argv[]) {
    int N,E,T,M;
    cin >> N >> E >> T >> M;
    E--;
    
    priority_queue<pair<int,int>> pq;
    vector<bool> visited(N,false);
    vector<vector<pair<int,int>>> map(N);
    vector<int> minCost(N,1000000000);
    
    for (int i = 0; i<M; i++){
        int U,V,C;
        cin >> U >> V >> C;
        U--; V--;
        map[V].push_back(make_pair(U, C));
    }
    
    pq.push(make_pair(E, 0));
    minCost[E] = 0;
    
    while (!pq.empty()){
        int currNode = pq.top().first;
        int currCost = pq.top().second;
        pq.pop();
        
        if (visited[currNode]){ continue; }
        visited[currNode] = true;
        
        for (auto next: map[currNode]){
            int newCost = currCost + next.second;
            if (minCost[next.first] > newCost){
                minCost[next.first] = newCost;
                pq.push(make_pair(next.first, newCost));
            }
        }
    }
    int ans = 0;
    for(auto cost:minCost){
        ans += cost <= T ? 1:0;
    }
    cout << ans ;
    return 0;
}