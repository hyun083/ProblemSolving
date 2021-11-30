#include <iostream>
#include <stack>
#include <vector>

using namespace std;

int N;
stack<int> st;
vector<int> vc;

int main() {
    cin >> N;

    for(int i=0; i<N; i++){
        string action;
        cin >> action;
        if(action == "push"){
            int number;
            cin >> number;
            st.push(number);
        }else if(action == "pop"){
            if(st.empty()){
                vc.push_back(-1);
            }else{
                vc.push_back(st.top());
                st.pop();
            }
        }else if(action == "size"){
            vc.push_back(st.size());
        }else if(action == "empty"){
            if(st.empty()){
                vc.push_back(1);
            }else{
                vc.push_back(0);
            }
        }else if(action == "top"){
            if(st.empty()){
                vc.push_back(-1);
            }else{
            vc.push_back(st.top());
            }
        }
    }

    for(vector<int>::iterator iter = vc.begin(); iter!=vc.end(); ++iter){
        cout << *iter << "\n";
    }

    return 0;
}
