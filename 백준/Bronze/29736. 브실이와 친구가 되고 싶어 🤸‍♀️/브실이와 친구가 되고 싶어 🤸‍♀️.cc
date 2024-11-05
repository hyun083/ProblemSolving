#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int A,B,K,X;
    
    cin >> A >> B >> K >> X;
    if(K+X<A || B<K-X){
        cout << "IMPOSSIBLE" << "\n";
    }else {
        cout << min(B,K+X)-max(A,K-X)+1 << "\n";
    }
    
    return 0;
}