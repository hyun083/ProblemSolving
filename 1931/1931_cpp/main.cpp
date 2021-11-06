#include <iostream>
#include <deque>
#include <algorithm>

using namespace std;
int main() {
    int N;
    cin >> N;
    int starts[N];
    int ends[N];

    for(int i=0; i<N; i++){
        int start;
        int end;
        cin >> start >> end;
        starts[i] = start;
        ends[i] = end;
    }

    int min = ends[0];

    for(int i=0; i<N; i++){
        if(ends[i] < min){
            min = ends[i];
        }
    }

    for(int i = 0; i<N; i++){
        
    }

    return 0;
}
