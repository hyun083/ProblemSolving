#include <iostream>
#include <unordered_map>
#include <vector>
using namespace std;
int N,M,Q;
int cnt;
unordered_map<int,int> arr;

int main(int argc, const char * argv[]) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    cin >> N;
    for(int i=0; i<N; i++){
        int num;
        cin >> num;
        if(arr.find(num) == arr.end()){
            arr[num] = 1;
        }else{
            arr[num]+=1;
        }
    }
    cnt = N;
    cin >> Q;
    for(int i=0; i<Q; i++){
        bool flag = true;
        int cntA,cntB;
        vector<int> A;
        vector<int> B;
        
        cin >> cntA;
        for (int k=0; k<cntA; k++){
            int num;
            cin >> num;
            A.push_back(num);
        }
        
        cin >> cntB;
        for(int k=0; k<cntB; k++){
            int num;
            cin >> num;
            B.push_back(num);
        }
        
        for(int i=0; i<cntA; i++){
            int num = A[i];
            if (arr.find(num)==arr.end() || arr[num]==0){
                flag = false;
                for(int k=0; k<i; k++){
                    int num = A[k];
                    arr[num]++;
                    cnt++;
                }
                break;
            }else{
                arr[num] -= 1;
                cnt--;
            }
        }
        
        if (flag){
            for(auto num: B){
                cnt++;
                if (arr.find(num)==arr.end()){
                    arr[num] = 1;
                }else{
                    arr[num] += 1;
                }
            }
        }
    }
    
    cout << cnt << "\n";
    if (cnt>0){
        for(auto info:arr){
            for (int value=0; value<info.second; value++){
                cout << info.first << " ";
            }
            
        }
    }
    return 0;
}