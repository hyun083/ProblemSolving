#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

vector<long long> arr;
vector<long long> arr2;
int main() {
    int N, M;

    cin >> N;
    for(int i=0; i<N; i++){
        long long num;
        cin >> num;
        arr.push_back(num);
    }
    sort(arr.begin(),arr.end());

     cin >> M;
    for(int i=0; i<M; i++){
        long long num;
        cin >> num;
        arr2.push_back(num);
    }
    
    for(int i=0; i<M; i++){
        bool flag = false;
        int lo = 0;
        int hi = arr.size()-1;
        while(lo <= hi){
            int mid = (lo + hi)/2;
            if(arr2[i] == arr[mid]){
                cout << 1 << '\n';
                flag = true;
                break;
            }
            if(arr2[i] < arr[mid]){
                hi = mid-1;
            }
            if(arr2[i] > arr[mid]){
                lo = mid+1;
            }
        }
        if(flag == true){
            continue;
        }else{
            cout << 0 << '\n';
        }
    }
    return 0;
}
