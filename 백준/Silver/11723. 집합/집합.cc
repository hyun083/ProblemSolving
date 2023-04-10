#include <iostream>
using namespace std;

int main() {
    ios::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);

    int M;
    cin >> M;
    int bit = 0;
    for(int i = 0; i<M; i ++) {
        string cmd;
        cin >> cmd;
        if (cmd == "add") {
            int x;
            cin >> x; x--;
            bit = bit | (1 << x);
        }
        if (cmd == "remove"){
            int x;
            cin >> x; x--;
            bit = bit & ~(1 << x);
        }
        if (cmd == "check"){
            int x;
            cin >> x; x--;
            if(bit & (1 << x)){
                cout << 1 << "\n";
            }else{
                cout << 0 << "\n";
            }
        }
        if (cmd == "toggle"){
            int x;
            cin >> x; x--;
            if(bit & (1 << x)){
                bit = bit & ~(1 << x);
            }else{
                bit = bit | (1 << x);
            }
        }

        if (cmd == "all"){
            bit = ~0;
        }
        if (cmd == "empty"){
            bit = 0;
        }
    }

}
