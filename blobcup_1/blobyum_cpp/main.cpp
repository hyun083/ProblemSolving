#include <iostream>
#include <algorithm>
#include <queue>
#include <numeric>

using namespace std;

int main() {
    ios_base :: sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    int N,K;
    vector<int>pies;
    priority_queue<int> dp;

    cin >> N;
    cin >> K;
    for(int i=0; i<N; i++){
        int pie;
        cin >> pie;
        pies.push_back(pie);
    }

    if (N==1){
        cout << *max_element(pies.begin(),pies.end());
    }else if (N==K){
        cout << accumulate(pies.begin(), pies.end(),0);
    }else{
        for(int i=0; i<N; i++){
            int temp = 0;
            for(int p=i; p<i+K; p++){
                temp += pies[p%N];
            }
            dp.push(temp);
        }

        cout << dp.top();
    }
    return 0;
}
