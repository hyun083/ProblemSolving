#include <iostream>
#include <vector>
using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    while(true){
        vector<int> arr1, arr2;
        int N,M;
        cin >> N >> M;
        if(N==0 && M==0){
            break;
        }

        for(int i=0; i<N;i++){
            int num;
            cin >> num;
            arr1.push_back(num);
        }
        for(int i=0; i<M;i++){
            int num;
            cin >> num;
            arr2.push_back(num);
        }
        int cnt = 0;
        for(int i=0; i<M; i++){
            bool flag = false;
            int lo = 0;
            int hi = N-1;
            while(lo <= hi){
                int mid = (lo + hi)/2;
                if(arr2[i] == arr1[mid]){
                    flag = true;
                    break;
                }
                if(arr2[i] < arr1[mid]){
                    hi = mid-1;
                }
                if(arr2[i] > arr1[mid]){
                    lo = mid+1;
                }
            }
            if(flag){cnt += 1; continue;}
        }
        cout << cnt << '\n';
    }
    return 0;
}
