#include <iostream>
#include <vector>
#include <string>
#include <algorithm>
using namespace std;

int N,M;
vector<string> arr;

int compW(int x, int y){
    int cnt = 0;
    vector<string> white = {"WBWBWBWB",
                            "BWBWBWBW",
                            "WBWBWBWB",
                            "BWBWBWBW",
                            "WBWBWBWB",
                            "BWBWBWBW",
                            "WBWBWBWB",
                            "BWBWBWBW"};
    for(int i=0; i<8; i++){
        for(int k=0; k<8; k++){
            if(white[i][k] != arr[x+i][y+k]){
                cnt ++;
            }
        }
    }
    return cnt;
}

int compB(int x, int y){
    int cnt = 0;
    vector<string> black = {"BWBWBWBW",
                            "WBWBWBWB",
                            "BWBWBWBW",
                            "WBWBWBWB",
                            "BWBWBWBW",
                            "WBWBWBWB",
                            "BWBWBWBW",
                            "WBWBWBWB"};
    for(int i=0; i<8; i++){
        for(int k=0; k<8; k++){
            if(black[i][k] != arr[x+i][y+k]){
                cnt ++;
            }
        }
    }
    return cnt;
}

int main() {
    cin >> N >> M;
    for(int i=0; i<N; i++){
        string str;
        cin >> str;
        arr.push_back(str);
    }
    int cntW=64, cntB=64;
    for(int i=0; i<N-7; i++){
        for(int k=0; k<M-7; k++){
            cntW = min(cntW,compW(i,k));
            cntB = min(cntB,compB(i,k));
        }
    }
    if(cntW < cntB) cout << cntW;
    else cout << cntB;

    return 0;
}
