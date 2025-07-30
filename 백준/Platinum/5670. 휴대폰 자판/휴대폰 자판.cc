#include <iostream>
#include <algorithm>
using namespace std;

struct Trie{
    Trie *children[26];
    bool isEndOfWord;
    int countOfBranch;
    int countOfWords;

    Trie():
    isEndOfWord(false),
    countOfBranch(0),
    countOfWords(0){fill(children,children+26,nullptr);}

    ~Trie(){
        for(int i=0; i<26; i++){
            if(children[i]){
                delete children[i];
            }
        }
    }

    void insert(char *str){
        if(*str == '\0'){
            countOfBranch ++;
            isEndOfWord = true;
        }else{
            if(!children[*str-'a']){
                countOfBranch ++;
                children[*str-'a'] = new Trie;
            }
            countOfWords ++;
            children[*str-'a']->insert(str+1);
        }
    }

    long long cntKeyStrokes(bool isRoot=false){
        long long res = 0;
        if(isRoot || countOfBranch>1){
            res = countOfWords;
        }
        for(int i=0; i<26; i++){
            if(children[i]){
                res += children[i]->cntKeyStrokes();
            }
        }
        return res;
    }

};
int main() {
    int N;
    while(scanf("%d", &N)>0){
        Trie *root = new Trie;
        for(int i=0; i<N; i++){
            char W[81];
            scanf("%s",W);
            root->insert(W);
        }
        printf("%.2lf\n",1.0*root->cntKeyStrokes(true)/N);
        delete root;
    }
    return 0;
}