#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

int N;
vector<pair<int,int>> arr;
priority_queue<int,vector<int>,greater<int>> cls;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    cin >> N;

    for(int i=0; i<N; i++){
        int begin, end;
        cin >> begin >> end;
        arr.push_back({begin,end});
    }

    sort(arr.begin(),arr.end());
    cls.push(arr[0].second);

    for(int i=1; i<arr.size(); i++){
        if(arr[i].first < cls.top()){
            cls.push(arr[i].second);
        }else{
            cls.pop();
            cls.push(arr[i].second);
        }
    }

    cout << cls.size();
    return 0;
}