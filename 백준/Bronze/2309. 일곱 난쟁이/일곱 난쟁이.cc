#include <iostream>
#include <algorithm>
#include <deque>

using namespace std;
int main() {
    int inputs[9];

    for(int i=0; i<9; i++){
        cin >> inputs[i];
    }

    for(int i=0; i<9; i++){
        for(int k=0; k<9; k++){
            if(k == i){
                continue;
            }
            int result(0);
            deque<int> outputs;
            for(int n=0; n<9; n++){
                if(n != i && n != k){
                    result += inputs[n];
                    outputs.push_back(inputs[n]);
                }
            }
            if(result == 100){
                sort(outputs.begin(),outputs.end());
                for(deque<int>::iterator iter = outputs.begin(); iter != outputs.end(); ++iter){
                    cout << *iter << "\n";
                }
                return 0;
            }
        }
    }
    return 0;
}
