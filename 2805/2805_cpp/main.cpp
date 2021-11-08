#include <iostream>
using namespace std;

int main() {
    int N, M;
    cin >> N >> M;
    int trees[N];
    for(int i=0; i<N; i++){
        cin >> trees[i];
    }

    int lo = 0;
    int hi = 1000000000;

    while(lo+1 < hi){
        int mid = (lo+hi)/2;
        long long sum = 0;
        for(int i=0; i<N; i++){
            if(trees[i] > mid)  sum+=trees[i]-mid;
        }
        if(sum >= M) lo = mid;
        else hi = mid;
    }

    cout << lo;
    return 0;
}
