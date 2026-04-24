#include <deque>
#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    int N, K;
    deque<int> arr;
    
    cin >> N >> K;
    
    for(int num=1; num<=N; num++){
        arr.push_back(num);
    }
    
    for(int i=0; i<K; i++){
        char cmd;
        cin >> cmd;
        
        if(cmd=='A'){
            arr.push_back(arr.front());
            arr.pop_front();
        }else{
            int top = arr.front();
            arr.pop_front();
            
            arr.push_back(arr.front());
            arr.pop_front();
            arr.push_front(top);
        }
    }
    cout << arr.front();
    
    return 0;
}