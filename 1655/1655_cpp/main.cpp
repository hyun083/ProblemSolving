#include <iostream>
#include <queue>

using namespace std;

int main() {
    ios_base ::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);

    int N;
    priority_queue<int, vector<int>, less<int>> max_heap;
    priority_queue<int,vector<int>, greater<int>> min_heap;

    cin >> N;
    for(int i=1; i<=N; i++){
        int input;
        cin >> input;
        if(max_heap.size() == min_heap.size()){
            if(max_heap.size() == 0 && min_heap.size() == 0){
                max_heap.push(input);
            }
            else{
                if(min_heap.top() < input){
                    int temp = min_heap.top();
                    min_heap.pop();
                    min_heap.push(input);
                    max_heap.push(temp);

                }
                else{
                    max_heap.push(input);
                }
            }
        }
        else if(max_heap.size() > min_heap.size()){
            if(max_heap.top() > input){
                int temp = max_heap.top();
                max_heap.pop();
                max_heap.push(input);
                min_heap.push(temp);
            }
            else{
                min_heap.push(input);
            }
        }
        cout << max_heap.top() << "\n";
    }
    return 0;
}
