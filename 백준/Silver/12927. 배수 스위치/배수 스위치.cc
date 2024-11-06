#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    unsigned long N,cnt=0,ans=0,idx=1;
    string arr;
    cin >> arr;
    N = arr.size();
    arr = 'N'+arr;
    
    for(auto data:arr){
        if(data == 'Y'){
            cnt++;
        }
    }
    
    while(0<cnt || idx<=N){
        if(arr[idx]=='N'){
            idx++;
            continue;
        }
        for(unsigned long i=idx; i<=N; i+=idx){
            if(arr[i]=='Y'){
                arr[i]='N';
                cnt--;
            }else{
                arr[i]='Y';
                cnt++;
            }
        }
        ans++;
        idx++;
    }
    cout << ans << "\n";
    return 0;
}
