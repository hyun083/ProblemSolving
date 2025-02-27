#include <iostream>
#include <deque>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(0);
    int N;
    cin >> N;
    deque<int> q;

    for(int i = 0; i < N; i ++){
        int cmd;
        cin >> cmd;

        switch (cmd) {
            case 1:
                int X1;
                cin >> X1;
                q.push_front(X1);
                break;
            case 2:
                int X2;
                cin >> X2;
                q.push_back( X2);
                break;
            case 3:
                int pfront;
                pfront = -1;
                if(!q.empty()){
                    pfront = q.front();
                    q.pop_front();
                }
                cout << pfront << "\n";
                break;
            case 4:
                int pback;
                pback = -1;
                if(!q.empty()){
                    pback = q.back();
                    q.pop_back();
                }
                cout << pback << "\n";
                break;
            case 5:
                cout << q.size() << "\n";
                break;
            case 6:
                int isEmpty;
                isEmpty = q.empty() ? 1:0;
                cout << isEmpty << "\n";
                break;
            case 7:
                int front;
                front = -1;
                if(!q.empty()){
                    front = q.front();
                }
                cout << front << "\n";
                break;
            case 8:
                int back;
                back = -1;
                if(!q.empty()){
                    back = q.back();
                }
                cout << back << "\n";
                break;
            default:
                break;
        }
    }
    return 0;
}
