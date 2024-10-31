#include <iostream>
#include <vector>
#include <string>
using namespace std;

int main(int argc, const char * argv[]) {
    int T;
    cin >> T;
    
    for(int i=0; i<T; i++){
        int N=0;
        cin >> N;
        vector<char> origin;
        vector<char> target;
        int W = 0;
        int B = 0;
        
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