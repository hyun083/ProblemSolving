#include <iostream>
#include <sstream>
#include <deque>

using namespace  std;

int main() {
    int N;
    cin >> N;

    for(int i=0; i<N; i++){
        bool flag = true;
        bool flag2 = true;

        deque<string> dq;
        string actions;
        int size;
        string arr;

        cin >> actions;
        cin >> size;
        cin >> arr;

        arr.pop_back();
        arr.erase(arr.begin());

        istringstream iss(arr);
        string token;
        while(getline(iss,token,',')){
            dq.push_back(token);
        }

        for(string::iterator iter = actions.begin(); iter != actions.end(); ++iter){
            if (*iter == 'R'){
                flag2 = !flag2;
            } else if (*iter == 'D'){
                if(dq.empty()){
                    flag = false;
                    cout << "error" << "\n";
                    break;
                } else{
                    if(flag2 == true){
                        dq.pop_front();
                    }else{
                        dq.pop_back();
                    }
                }
            }
        }

        if(flag==true && flag2==true){
            cout << '[';
            for(deque<string>::iterator iter = dq.begin(); iter != dq.end(); ++iter){
                if(iter != dq.end().operator--()){
                    cout << *iter << ',';
                }else{
                    cout << *iter;
                }
            }
            cout << ']' << "\n";
        }else if(flag == true && flag2 == false){
            cout << '[';
            for(deque<string>::iterator iter = dq.end().operator--(); iter >= dq.begin(); --iter){
                if(iter != dq.begin()){
                    cout << *iter << ',';
                }else{
                    cout << *iter;
                }
            }
            cout << ']' << "\n";
        }
    }
    return 0;
}
