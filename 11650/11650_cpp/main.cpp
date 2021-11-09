#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

class Coordinate{
public:
    int x;
    int y;
    Coordinate(int x, int y): x(x), y(y){}
};

bool compare(Coordinate a, Coordinate b){
    if(a.x == b.x) return a.y < b.y;
    else return a.x < b.x;
}

vector<Coordinate> arr;
int main() {
    int N;
    cin >> N;

    for(int i=0; i<N; i++){
        int x;
        int y;
        cin >> x >> y;
        arr.push_back(Coordinate(x,y));
    }

    sort(arr.begin(),arr.end(),compare);
    for(int i=0; i<N; i++){
        cout << arr[i].x << " " << arr[i].y << "\n";
    }
    return 0;
}
