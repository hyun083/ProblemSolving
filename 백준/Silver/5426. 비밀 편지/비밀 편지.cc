#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int N;
    
    cin >> N;
    
    for(int i=0; i<N; i++){
        int size = 1;
        string S;
        cin >> S;
        
        while(size*size < S.size()){
            size ++;
        }
        
        char res[size][size];
        
        for(int i=0; i<size; i++){
            for(int k=0; k<size; k++){
                res[i][k] = S[i*size+k];
            }
        }
        
        for(int i=size-1; i>=0; i--){
            for(int k=0; k<size; k++){
                cout << res[k][i];
            }
        }
        cout << endl;
    }
    
    return 0;
}