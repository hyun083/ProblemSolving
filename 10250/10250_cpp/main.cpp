#include <iostream>
#include <string>
using namespace std;

int T,H,W,N;
int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);
    cin >> T;
    for(int i=0; i<T; i++){
        int cnt = 0;
        bool flag = false;
        string room;
        cin >> H >> W >> N;

        for(int i=1; i<=W; i++){
            if(flag) break;
            for(int k=1; k<=H; k++){
                cnt ++;
                if(i < 10) {room = to_string(k) + "0" + to_string(i);}
                else {room = to_string(k) + to_string(i);}
                if(cnt == N) {flag = true; break;}
            }
        }
        cout << room << '\n';
    }
    return 0;
}
