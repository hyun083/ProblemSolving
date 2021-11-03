#include <iostream>
#include <list>

using namespace std;
int N, K;
list<int> ll;
list<int>::iterator iter = ll.begin();

void solution(){
    cout << "<";
    while(1){
        if(ll.size() == 1){
            cout << *ll.begin();
            break;
        }
        for(int i=0; i<K; ++i){
            if(iter == ll.end().operator--()){
                iter = ll.begin();
                continue;
            }
            iter.operator++();
        }
        cout << *iter << ", ";
        iter = ll.erase(iter);
        iter.operator--();
    }
    cout << ">";
}

int main() {
    cin >> N >> K;
    for (int n = 1; n <= N; n++) {
        ll.push_back(n);
    }
    solution();
}
