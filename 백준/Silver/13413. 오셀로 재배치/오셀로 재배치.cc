#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main(int argc, const char * argv[]) {
    cin.tie(NULL);
    ios_base::sync_with_stdio(false);
    
    int T,N,W,B;
    vector<int> origin,target;
    cin >> T;
    
    for(int i=0; i<T; i++){
        cin >> N;
        origin.clear();
        target.clear();
        W = 0;
        B = 0;
        
        for(int i=0; i<N; i++){
            char stone;
            cin >> stone;
            origin.push_back(stone);
        }
        
        for(int i=0; i<N; i++){
            char stone;
            cin >> stone;
            target.push_back(stone);
        }
        for(int i=0; i<N; i++){
            if(origin[i]!=target[i]){
                W += origin[i]=='W'?1:0;
                B += origin[i]=='B'?1:0;
            }
        }
        cout << max(W,B) << "\n";
    }
    return 0;
}