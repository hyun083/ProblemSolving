#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    int N;
    cin >> N;
    vector<int> arr;
    
    for(int i=0; i<N; i++){
        int snow;
        cin >> snow;
        arr.push_back(snow);
    }
    int ans= 0;
    while(!arr.empty()){
        sort(arr.begin(),arr.end());
        if(arr.back() == 0){ break; }
        arr[N-1] --;
        ans ++;
        if(arr[N-2]>0){
            arr[N-2] --;
        }
    }
    cout << (ans>1440 ? -1:ans) <<endl;
    return 0;
}