#include <iostream>
#include <set>
using namespace std;

int T,K;
char cmd;

int main() {
    cin >> T;
    for(int i = 0; i < T; i++){
        multiset<int> arr;
        cin >> K;
        for(int k = 0; k<K; k++){
            int data;
            cin >> cmd >> data;
            if (cmd == 'I'){
                arr.insert(data);
            }else{
                if(arr.empty()){
                    continue;
                }else{
                    if (data == 1){
                        arr.erase(--arr.end());
                    }else{
                        arr.erase(arr.begin());
                    }
                }
            }
        }
        if (arr.empty()){
            cout << "EMPTY" << "\n";
        }else{
            cout << *(--arr.end()) << " "<<*(arr.begin()) << "\n";
        }

    }
    return 0;
}
