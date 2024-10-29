#include <iostream>
#include <vector>

using namespace std;

int main(int argc, const char * argv[]) {
    int N, ans;
    vector<char> arr;
    
    cin >> N;
    ans = N;
    for (int i=0; i<N; i++){
        char input;
        cin >> input;
        arr.push_back(input);
    }
    int res = 0;
    bool flag = false;
    
    for (int i=0; i<N; i++){
        if(arr[i]=='R'){
            res += flag ? 1:0;
        }else{
            flag = true;
        }
    }
    ans = min(ans,res);
    res = 0;
    flag = false;
    
    for (int i=N-1; i>=0; i--){
        if(arr[i]=='R'){
            res += flag ? 1:0;
        }else{
            flag = true;
        }
    }
    ans = min(ans,res);
    res = 0;
    flag = false;

    for (int i=0; i<N; i++){
        if(arr[i]=='B'){
            res += flag ? 1:0;
        }else{
            flag = true;
        }
    }
    ans = min(ans,res);
    res = 0;
    flag = false;
    
    for (int i=N-1; i>=0; i--){
        if(arr[i]=='B'){
            res += flag ? 1:0;
        }else{
            flag = true;
        }
    }
    ans = min(ans,res);
    res = 0;
    flag = false;
    cout << ans << "\n";
    return 0;
}