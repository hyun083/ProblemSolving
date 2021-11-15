#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    int T;
    cin >> T;
    for(int i=0; i<T; i++){
        int N,M; vector <int> arr, arr2;
        cin >> N;
        for(int k=0; k<N; k++){
            int num; cin >> num;
            arr.push_back(num);
        }
        sort(arr.begin(),arr.end());

        cin >> M;
        for(int p=0; p<M; p++){
            int num; cin >> num;
            arr2.push_back(num);
        }

        for(int q = 0; q<M; q++){
            int lo = 0;
            int hi = N-1;
            bool flag = false;
            while (lo <= hi){
                int mid = (lo + hi) / 2;
                if(arr[mid] == arr2[q]){flag = true; break;}
                if(arr2[q] < arr[mid]){ hi = mid-1;}
                if(arr2[q] > arr[mid]){ lo = mid+1;}
            }
            if(flag == true){  cout << 1 << '\n'; continue;}
            else{cout << 0 << '\n'; continue;}
        }
    }
    return 0;
}
