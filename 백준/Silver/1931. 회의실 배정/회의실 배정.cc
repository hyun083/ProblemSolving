#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;
int N;
int cnt = 0;
vector<pair<int,int>> arr;

int main() {
    cin >> N;
    for(int i=0; i<N; i++){
        int start;
        int end;
        cin >> start >> end;
        arr.push_back({end,start});
    }

    sort(arr.begin(),arr.end());

    int finish = arr.front().first;
    cnt ++;

    for(int i = 1; i<arr.size(); i++){
        int next = arr[i].second;
        if(next < finish){
            continue;
        }else{
            finish = arr[i].first;
            cnt ++;
        }
    }
    cout << cnt;
    return 0;
}