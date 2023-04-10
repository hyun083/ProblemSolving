#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

struct point{
    int x;
    int y;
    point(int x, int y) : x(x), y(y) {}
};

bool compP(point a, point b){
    if(a.y == b.y) return a.x < b.x;
    else return a.y < b.y;
}

int main() {
    int N;
    cin >> N;
    vector<point> points;

    for(int i=0; i<N; i++){
        int x,y;
        cin >> x >> y;
        points.push_back(point(x,y));
    }

    sort(points.begin(),points.end(), compP);

    for(int i=0; i<N; i++){
        cout << points[i].x << " " << points[i].y << "\n";
    }
    return 0;
}
