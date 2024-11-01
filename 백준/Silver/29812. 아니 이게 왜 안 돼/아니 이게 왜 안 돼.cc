#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    cin.tie(NULL);
    ios_base::sync_with_stdio(false);
    
    int N,D,M;
    int H=0, Y=0, U=0;
    int cost = 0;
    cin >> N;
    vector<char> arr;
    for(int i=0; i<N; i++){
        char tmp;
        cin >> tmp;
        H += tmp=='H' ? 1:0;
        Y += tmp=='Y' ? 1:0;
        U += tmp=='U' ? 1:0;
        arr.push_back(tmp);
    }
    cin >> D >> M;
    int cnt = 0;
    for(auto data: arr){
        if(data=='H' || data=='Y' || data=='U'){
            if(cnt>0){
                if(cnt==1){
                    cost += D;
                }else{
                    cost += min(D*cnt,D+M);
                }
            }
            cnt = 0;
        }else{
            cnt++;
        }
    }
    if(cnt>0){
        if(cnt==1){
            cost += D;
        }else{
            cost += min(D*cnt,D+M);
        }
    }
    if(cost==0){
        cout << "Nalmeok" << "\n";
    }else{
        cout << cost << "\n";
    }
    
    if(min(H,min(Y,U)) == 0){
        cout << "I love HanYang University" << "\n";
    }else{
        cout << min(H,min(Y,U)) << "\n";
    }
    return 0;
}