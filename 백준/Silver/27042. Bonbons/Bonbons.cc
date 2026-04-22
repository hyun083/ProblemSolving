#include <deque>
#include <iostream>
using namespace std;

int main(int argc, const char * argv[]) {
    int N;
    cin >> N;
    deque<int> tmp;
    
    for (int num=1; num<=N; num++) {
        tmp.push_back(num);
    }
    
    while (tmp.size() > 1) {
        tmp.push_back(tmp.front());
        tmp.pop_front();
        tmp.pop_front();
    }
    cout << tmp.front() << "\n";
    
    return EXIT_SUCCESS;
}