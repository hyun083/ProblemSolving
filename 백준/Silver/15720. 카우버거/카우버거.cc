#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
int main(int argc, const char * argv[]) {
    // insert code here...
    int B,C,D;
    int sum = 0;
    cin >> B >> C >> D;
    vector<int> burger;
    vector<int> side;
    vector<int> soda;
    
    for(int i=0; i<B; i++){
        int input;
        cin >> input;
        burger.push_back(input);
        sum += input;
    }
    for(int i=0; i<C; i++){
        int input;
        cin >> input;
        side.push_back(input);
        sum += input;
    }
    for(int i=0; i<D; i++){
        int input;
        cin >> input;
        soda.push_back(input);
        sum += input;
    }
    sort(burger.begin(), burger.end());
    sort(side.begin(), side.end());
    sort(soda.begin(), soda.end());
    int size = min(B, min(C,D));
    cout << sum << endl;
    for(int i=0; i<size; i++){
        int b = burger.back()/10; burger.pop_back();
        int c = side.back()/10; side.pop_back();
        int d = soda.back()/10; soda.pop_back();
        sum -= (b+c+d);
    }
    cout << sum << endl;
    return 0;
}