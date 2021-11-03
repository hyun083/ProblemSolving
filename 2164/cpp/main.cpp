#include <iostream>
#include <queue>

using namespace std;

int main() {
    int N;
    cin >> N;
    queue<int> q;

    for(int i=0; i<N; i++){
        q.push(i+1);
    }

    while(q.size()!=1){
        q.pop();
        q.push(q.front());
        q.pop();
    }

    cout << q.front();
    return 0;
}
