#include <iostream>
#include <list>

using namespace std;

int n, k, s;
list<char> outputs;
list<char>::iterator iter = outputs.begin();

int main() {
    cin >> n >> k;
    for(int i=0; i < n; i++){
        outputs.push_back('?');
    }

    iter = outputs.begin();

    for(int i=0; i < k; i++){
        char c;
        cin >> s >> c;
        for(int p=0; p<s; p++){
            if(iter==outputs.begin()){
                iter = outputs.end().operator--();
                continue;
            }
            iter.operator--();
        }
        if(*iter == '?'){
            *iter = c;
        } else{
            if(*iter == c){
                *iter = c;
            }else{
                cout << "!";
                return 0;
            }
        }
    }

    list<char>::iterator tempIter=outputs.begin();
    for(int i=0; i<outputs.size(); i++){
        for(list<char>::iterator iter=outputs.begin(); iter!=outputs.end(); ++iter){
            if(tempIter == iter){
                continue;
            }else if(*tempIter == '?'){
                continue;
            }else if(*tempIter==*iter){
                cout << '!';
                return 0;
            }
        }
        tempIter.operator++();
    }

    for(int i=0; i<outputs.size(); i++){
        if(iter == outputs.end()){
            iter = outputs.begin();
        }
        cout << *iter;
        iter.operator++();
    }

    return 0;
}
