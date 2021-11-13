#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    vector<unsigned int> arr;
    int N, M;
    cin >> N >> M;
    for(int i=0; i<N; i++){
        unsigned int lan;
        cin >> lan;
        arr.push_back(lan);
    }

    long long lo = 0;
    long long hi = 10000000000001;
    while(lo<hi){
        long long mid = (lo + hi)/2;
        long long cnt = 0;
        for(int i = 0; i<N; i++){
            cnt += arr[i] / mid;
        }
        if (cnt < M) hi = mid;
        else lo = mid +1;
    }
    cout << lo-1;
    return 0;
}
