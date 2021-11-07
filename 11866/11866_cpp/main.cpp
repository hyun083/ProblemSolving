#include <iostream>
#include <list>
using namespace std;
int main() {
    list<int> numbers;
    list<int>::iterator iter;
    list<int> outputs;
    int N;
    int K;
    cin >> N >> K;

    for(int i=1; i<=N; i++){
        numbers.push_back(i);
    }

    iter = numbers.end();
    while(1){
        if(numbers.size() == 1){
            outputs.push_back(numbers.front());
            break;
        }

        for(int i=0; i<K; i++){
            if(iter == numbers.end().operator--()){
                iter = numbers.begin();
                continue;
            }
            iter.operator++();
        }
        outputs.push_back(*iter);
        numbers.erase(iter);
        iter.operator--();
    }

    for(list<int>::iterator iter = outputs.begin(); iter != outputs.end(); ++iter){
        if(iter == outputs.begin()){
            cout << "<";
        } else if(iter == outputs.end().operator--()){
            cout << *iter << ">";
            break;
        }
        cout << *iter << ", " ;
    }
    return 0;
}
