#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    int N,M,L,ans=0,curr=0;
    cin >> N >> M >> L;
    
    vector<int> arr(N,0);
    
    while(true){
        curr = (curr+L)%N;
        arr[curr]++;
        if(arr[curr]==M){ break; }
        ans++;
    }
    cout << ans << "\n";
    return 0;
}