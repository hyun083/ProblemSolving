#include <iostream>
#include <string>
#include <list>

using namespace std;

string text;
list<char> outputs;
list<char>::iterator iter = outputs.begin();
int N;

enum Actions{
    L,
    D,
    B,
    P,
};

void play(Actions action){
    switch (action) {
        case L:
            if(iter == outputs.begin()) break;
            iter.operator--();
            break;
        case D:
            if(iter == outputs.end()) break;
            iter.operator++();
            break;
        case B:
            if(iter == outputs.begin()) break;
            iter = outputs.erase(iter.operator--());
            break;
        case P:
            char charater;
            cin >> charater;
            outputs.insert(iter,charater);
            break;
    }
};

int main() {
    cin >> text;
    cin >> N;
    for(int i=0; i<text.size(); i++){
        outputs.push_back(text[i]);
    }
    iter = outputs.end();
    for(int i=0; i<N; i++){
        char action;
        cin >> action;
        if(action == 'L'){
            play(L);
        }else if(action == 'D'){
            play(D);
        }else if(action == 'B'){
            play(B);
        }else if(action == 'P'){
            play(P);
        }
    }
    for(list<char>::iterator tempIter=outputs.begin(); tempIter!=outputs.end(); ++tempIter){
        cout << *tempIter;
    }
    return 0;
}
