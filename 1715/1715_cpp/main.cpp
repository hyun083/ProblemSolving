#include <iostream>
#include <queue>
using namespace std;

int main() {
    priority_queue<int,vector<int>,greater<int>> pq;
    int n,total = 0;
    cin >> n;
    for(int i=0; i<n; i++){
        int card;
        cin >> card;
        pq.push(card);
    }
    while(pq.size() > 1){
        int temp = 0;
        temp += pq.top();
        pq.pop();
        temp += pq.top();
        pq.pop();

        pq.push(temp);
        total += temp;
    }
    cout << total;
    return 0;
}
