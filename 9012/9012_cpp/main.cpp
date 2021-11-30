#include <iostream>

using namespace std;

int main() {
    int t(0);
    cin >> t;
    string input;
    int outputs[t];

    for(int i=0; i<t; i++){
        int result = 0;
        cin >> input;
        for(int k=0; k<input.size(); k++){
            if(result < 0){
                break;
            }
            if(input[k] == '('){
                result++;
            }else{
                result--;
            }
        }
        outputs[i] = result;
    }

    for(int i=0; i<t; i++){
        if(outputs[i] == 0){
            cout << "YES" << "\n";
        }else{
            cout << "NO" << "\n";
        }
    }

    return 0;
}
