#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    long long arr[100000];
    long long N, M, lo = -1, hi;
    cin >> N >> M;
    for(int i=0; i<N; i++){
        cin >> arr[i];
        hi += arr[i];
        lo = max(lo,arr[i]);
    }
    
    while(lo <= hi){
        long long temp = 0, mid=(lo+hi)/2, cnt = 0;
        for(int i=0; i<N; i++){
            if(temp + arr[i] > mid){
                cnt += 1;
                temp = 0;
            }
            temp += arr[i];
        }
        if(temp != 0) cnt += 1;
        if(cnt <= M)  hi = mid-1;
        else lo = mid+1;
    }
    cout << lo;

    return 0;
}
