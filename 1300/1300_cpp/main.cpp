#include <iostream>
#include <queue>
using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    priority_queue<int,vector<int>,less<int>> pq;
    int N,M;
    cin >> N;
    cin >> M;

    for(int i=1; i<=N; i++){
        for(int j=1; j<=N; j++) {
            pq.push(i*j);
            if(pq.size() > M){
                pq.pop();
            }
        }
    }
    cout << pq.top();
    return 0;
}
