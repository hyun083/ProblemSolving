#include <iostream>
#include <vector>
using namespace std;

int main() {
    int N, K, M;
    vector<int> arr;
    cin >> N >> K >> M;
    
    for (int i=0; i<N; i++){
        int L;
        cin >> L;
        if (L<=K){ continue; }
        arr.push_back(L);
    }
    int lo = 1;
    int hi = 1000000000;
    int ans = -1;
    
    while (lo<=hi){
        int P = (lo+hi)/2;
        int cnt = 0;
        
        for(auto L : arr){
            cnt += L<(2*K) ? (L-K)/P : (L-(2*K))/P;
        }
        if (cnt >= M){
            ans = P;
            lo = P+1;
        }else{
            hi = P-1;
        }
    }
    cout << ans;
}