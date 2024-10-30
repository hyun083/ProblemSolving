#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

vector<int> cal(vector<int> arr, int target){
    vector<int> res;
    int tmp = target;

    while (tmp){
        for(int i=44; i>=0; i--){
            if(arr[i]<=tmp){
                res.push_back(arr[i]);
                tmp -= arr[i];
                break;
            }
        }
    }
    return res;
}

int main(int argc, const char * argv[]) {
    vector<int> tmp;
    vector<int> arr;
    int N;
    cin >> N;
    
    for(int i=0; i<N; i++){
        int num;
        cin >> num;
        arr.push_back(num);
    }
    tmp.push_back(0);
    tmp.push_back(1);
    
    while(tmp[tmp.size()-1]+tmp[tmp.size()-2]<1000000000){
        tmp.push_back(tmp[tmp.size()-1]+tmp[tmp.size()-2]);
    }
    
    for(auto num: arr){
        vector<int> ans;
        ans = cal(tmp, num);
        reverse(ans.begin(),ans.end());
        for(auto data: ans){
            cout << data << " ";
        }
        cout << "\n";
    }
    
    return 0;
}