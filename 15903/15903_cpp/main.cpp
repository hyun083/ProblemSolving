#include <iostream>
#include <queue>
#include <stdio.h>

using namespace std;

int main() {
    int n, m;
    cin >> n >> m;
    priority_queue<long long, vector<long long>, greater<long long>> pq;

    for(int i=0; i<n; i++){
        long long number;
        cin >> number;
        pq.push(number);
    }

    for(int i=0; i<m; i++){
        long long number = pq.top(); pq.pop();
        number += pq.top(); pq.pop();
        pq.push(number); pq.push(number);
    }

    long long sum = 0;
    while(!pq.empty()){
        sum += pq.top(); pq.pop();
    }
    cout << sum;
    return 0;
}
