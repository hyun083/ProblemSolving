#include <iostream>
#include <queue>

using namespace std;

int main() {
    ios_base ::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);
    priority_queue<int,vector<int>,greater<int>> pq;
    int N;
    cin >> N;
    for(int i=0; i<N; i++){
        if(i>0){
            for(int k=0; k<N; k++){
                int n;
                cin >> n;
                pq.push(n);
                pq.pop();
            }
        }else{
            for(int k=0; k<N; k++){
                int n;
                cin >> n;
                pq.push(n);
            }
        }
    }
    cout << pq.top();
    return 0;
}