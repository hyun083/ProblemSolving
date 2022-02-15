#include <iostream>
#include <queue>

using namespace std;

int main() {
    int n, m;
    cin >> n >> m;
    priority_queue<long long int, vector<long long int>, greater<long long int>> pq;

    for(int i=0; i<n; i++){
        long long int number;
        cin >> number;
        pq.push(number);
    }

    for(int i=0; i<m; i++){
        long long int number = pq.top(); pq.pop();
        number += pq.top(); pq.pop();
        pq.push(number); pq.push(number);
    }

    long long int sum;
    while(pq.size()!=0){
        sum += pq.top(); pq.pop();
    }
    cout << sum;
    return 0;
}
