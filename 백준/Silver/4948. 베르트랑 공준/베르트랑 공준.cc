#include <vector>
#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    vector<int> prime(1000000,1);
    
    for(int i=2; i<1000000; i++){
        if(prime[i] == 0){ continue; }
        for(int k=i+i; k<1000000; k+=i){
            prime[k] = 0;
        }
    }
    
    while (true){
        int n,res = 0;
        cin >> n;
        if (n == 0) { break; }
        
        for(int num=n+1; num<=(2*n); num++){
            res += prime[num];
        }
        cout << res << "\n";
    }
    
    return 0;
}