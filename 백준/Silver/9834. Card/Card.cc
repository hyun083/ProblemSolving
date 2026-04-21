#include <iostream>
#include <deque>
using namespace std;

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    long long M, K;
    string cmds;
    if (!(cin >> M >> K >> cmds)) return 0;

    deque<long long> arr;
    for (long long i = 0; i < M; ++i) {
        arr.push_back(i);
    }

    for (char c : cmds) {
        if (c == 'A') {
            long long top = arr.front();
            arr.pop_front();
            arr.push_back(top);
        } else if (c == 'B') {
            long long top = arr.front();
            arr.pop_front();
            long long bottom = arr.front();
            arr.pop_front();
            arr.push_front(top);
            arr.push_back(bottom);
        } else {
            break;
        }
    }

    cout << arr[K-1] << ' ' << arr[K] << ' ' << arr[K+1] << '\n';
    return 0;
}