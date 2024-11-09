#include <iostream>
#include <vector>
using namespace std;

int main(int argc, const char * argv[]) {
    int SH,SM,TH,TM,N,ans=0;
    bool flag = false;
    cin >> SH >> SM >> TH >> TM >> N;
    
    for (int hh=0; hh<24; hh++){
        for(int mm=0; mm<60; mm++){
            if(SH==hh && SM==mm){ flag = true; }
            if (flag){
                ans += (hh/10==N || hh%10==N || mm/10==N || mm%10==N) ? 1:0;
            }
            if(TH==hh && TM==mm){ flag = false; }
        }
    }
    
    cout << ans << "\n";
    return 0;
}