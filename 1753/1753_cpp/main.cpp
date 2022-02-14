#include <iostream>
#include <queue>

using namespace std;
typedef  pair<int,int> P;
const int inf = 1000000000;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int V,E,S;
    cin >> V; cin >> E; cin >> S;
    S--;
    vector<P> graph[V];
    for(int i=0; i<E; i++){
        int u,v,w;
        cin >> u; cin >> v; cin >> w;
        graph[u - 1].push_back(P(v - 1, w));
    }

    bool visited[V];
    fill(visited,visited+V, false);

    int dist[V];
    fill(dist,dist+V,inf);
    dist[S]=0;

    priority_queue<P,vector<P>,greater<P>> pq;
    pq.push(P(0,S));
    while(!pq.empty()){
        int curr;
        do{
            curr = pq.top().second; pq.pop();
        }while(!pq.empty() && visited[curr]);

        if(visited[curr]){ break;}

        visited[curr] = true;
        for(int i=0; i<graph[curr].size(); i++){
            int next = graph[curr][i].first;
            int d = graph[curr][i].second;
            if(dist[next] > dist[curr] + d){
                dist[next] = dist[curr] + d;
                pq.push(P(dist[next],next));
            }
        }
    }

    for(int i=0; i<V; i++){
        if(dist[i] == inf){
            cout << "INF\n";
        }else{
            cout << dist[i] << '\n';
        }
    }

    return 0;
}
