#include <iostream>
#include <vector>
using namespace std;

int euc(int A, int B){
    int remain = A%B;
    if (remain == 0){
        return B;
    }
    return euc(B, remain);
}

int main() {
    vector<int> arr;
    int N, X;
    long long total = 0;
    int cnt = 0;
    double ans;
    
    cin >> N;
    for (int i=0; i<N; i++){
        int num;
        cin >> num;
        arr.push_back(num);
    }
    cin >> X;
    
    for(auto num: arr){
        if (euc(X, num)==1){
            cnt += 1;
            total += num;
        }
    }
    ans = double(total)/double(cnt);
    cout << ans << endl;
    
    return 0;
}