#include <iostream>
#include <queue>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);
    int N;
    queue<int> q;

    cin >> N;
    for(int i = 0; i<N; i++){
        string cmd;
        cin >> cmd;
        if(cmd == "push") {
            int num;
            cin >> num;
            q.push(num);
        }else if ( cmd == "pop" ){
            int num = -1;
            if(!q.empty()){
                num = q.front();
                q.pop();
            }
            cout << num << "\n";
        }else if (cmd == "size"){
            cout << q.size() << "\n";
        }else if (cmd == "empty"){
            int res = q.empty() ? 1:0;
            cout << res << "\n";
        }else if (cmd == "front"){
            int num = -1;
            if(!q.empty()){
                num = q.front();
            }
            cout << num << "\n";
        }else if (cmd == "back"){
            int num = -1;
            if(!q.empty()){
                num = q.back();
            }
            cout << num << "\n";
        }else{
            continue;
        }
    }

    return 0;
}