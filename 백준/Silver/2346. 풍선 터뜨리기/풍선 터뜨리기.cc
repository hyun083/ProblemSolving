#include <iostream>
#include <list>
using namespace std;

int N;
list<int> outputs;
list<int>::iterator iter = outputs.begin();

int main() {
    cin >> N;
    int papers[N];

    for(int i=0; i<N; i++){
        cin >> papers[i];
        outputs.push_back(i+1);
    }

    iter = outputs.begin();
    while(1){
        if(outputs.size()==1){
            cout << *outputs.begin();
            break;
        }
        cout << *iter << " ";
        int temp = *iter-1;

        iter = outputs.erase(iter);

        if(papers[temp] > 0){
            if(iter == outputs.end()) iter = outputs.begin();
            for(int i=0; i<papers[temp]-1; i++){
                if(iter == outputs.end().operator--()){
                    iter = outputs.begin();
                    continue;
                }
                iter.operator++();
            }
        }else if(papers[temp] < 0){
            for(int i=0; i>papers[temp]; i--){
                if(iter == outputs.begin()){
                    iter = outputs.end().operator--();
                    continue;
                }
                iter.operator--();
            }
        }
    }
    return 0;
}
