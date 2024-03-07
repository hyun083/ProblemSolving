#include <iostream>
using namespace std;
int y, m, d;
int ty, tm, td;

int main() {
    cin >> y >> m >> d;
    cin >> ty >> tm >> td;
    
    int birthday = (y*365) + (m*30) + d;
    int today = (ty*365) + (tm*30) + td;
    cout << (today-birthday)/365 << endl;
    cout << ty-y+1 << endl;
    cout << ty-y << endl;
}