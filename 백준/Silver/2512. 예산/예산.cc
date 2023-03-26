#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;
int main() {
    int N,M;
    int total = 0;

    cin >> N;
    vector<int> numbers;
    for(int i=0; i<N; i++){
        int number;
        cin >> number;
        total += number;
        numbers.push_back(number);
    }

    cin >> M;
    if(total <= M){
        cout << *max_element(numbers.begin(),numbers.end());
        return 0;
    }

    int lo,hi;
    lo = 0;
    hi = 1000000000;
    while(lo+1 < hi){
        int mid = (lo+hi)/2;
        long long sum = 0;
        for(int i=0; i<N; i++) {
            if (numbers[i] > mid) sum += numbers[i] - mid;
        }
        if (total - sum > M) hi = mid;
        else lo = mid;
    }
    cout << lo;
    return 0;
}
