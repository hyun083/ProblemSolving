#include <iostream>
#include <stack>
#include <queue>

using namespace std;
string output = "";
vector<pair<long long,long long>> v;
int main() {
    int n;
    cin >> n;
    for(int i=0; i<n; i++){
        int cmd;
        cin >> cmd;
        if(cmd == 1){
            int a,b;
            cin >> a >> b;
            pair<long long,long long> p;
            p.first = a; p.second = b;
            v.push_back(p);
        }else{
            long long ans = 1;
            long long x;
            cin >> x;
            for (int i=0; i< v.size(); i++){
                pair<long long,long long> temp = v[i];
                ans *= (temp.first*x + temp.second);
            }
            if(ans < 0){
                output += "-\n";
            }else if (ans == 0){
                output += "0\n";
            }else{
                output += "+\n";
            }
        }
    }
    output.pop_back();
    cout << output;
    return 0;
}
