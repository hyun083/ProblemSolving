#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int N;
bool compare(string a, string b){
    if(a.size() == b.size()){
        for(int i=0; i<a.size(); i++){
            if(a[i] != b[i]) {
                return a[i] < b[i];
            }
        }
        return a < b;
    }else{
        return a.size() < b.size();
    }
}
int main() {
    cin >> N;
    vector<string> arr;
    for(int i=0; i<N; i++){
        string str;
        cin >> str;
        arr.push_back(str);
    }
    sort(arr.begin(),arr.end(),compare);
    arr.erase(unique(arr.begin(),arr.end()),arr.end());
    for(vector<string>::iterator iter = arr.begin(); iter!=arr.end(); ++iter){
        cout << *iter << '\n';
    }
    return 0;
}
