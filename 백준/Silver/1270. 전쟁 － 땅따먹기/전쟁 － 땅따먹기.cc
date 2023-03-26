#include <iostream>
#include <map>
#include <algorithm>
using namespace std;


int main() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    int n;
    cin >> n;
    for(int T=0; T<n; T++){
        int ans = 0;
        long long key = 0;
        int size;
        cin >> size;
        map<long long,int> map;
        for(int i=0; i<size; i++){
            long long number;
            cin >> number;
            if(map.find(number) != map.end()){
                map[number] += 1;
                if(ans < map[number]){
                    ans = map[number];
                    key = number;
                }
            }else{
                map.insert(make_pair(number,1));
            }
        }
        if(ans > size/2){
            cout << key << "\n";
        }else{
            cout << "SYJKGW\n";
        }
    }
    return 0;
}
