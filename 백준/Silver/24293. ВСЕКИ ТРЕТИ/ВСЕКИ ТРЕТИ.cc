#include <iostream>
#include <string.h>
#include <deque>
using namespace std;

int main(int argc, const char * argv[]) {
    string str;
    deque<char> arr;
    deque<char> tmp;
    bool flag = false;
    
    cin >> str;
    for (auto s : str) {
        arr.push_back(s);
    }
    
    while (arr.size() > 2) {
        if (flag == true) {
            while(arr.size()>0){
                tmp.push_front(arr.back());
                arr.pop_back();
                if(arr.size()==0){ break; }
                
                tmp.push_front(arr.back());
                arr.pop_back();
                if(arr.size()==0){ break; }

                arr.pop_back();
                if(arr.size()==0){ break; }
            }
        } else {
            while(arr.size()>0){
                tmp.push_back(arr.front());
                arr.pop_front();
                if(arr.size()==0){ break; }
                
                tmp.push_back(arr.front());
                arr.pop_front();
                if(arr.size()==0){ break; }
                arr.pop_front();
                if(arr.size()==0){ break; }
            }
        }
        arr = tmp;
        tmp = {};
        flag = !flag;
    }
    
    if (arr[0] < arr[1]) {
        cout << arr[0] << arr[1];
    } else {
        cout << arr[1] << arr[0];
    }
    return 0;
}