#include <iostream>
#include <deque>

using namespace std;

int N, M, answer(0);
deque<int> dq;

//void printdq(deque<int> dq){
//    deque<int>::iterator iter = dq.begin();
//
//    for(int i=0; i<dq.size(); i++){
//        cout << *iter << " ";
//        iter.operator++();
//    }
//    cout << "\n";
//}

int main() {
    cin >> N >> M;
    int right(0), left(0);

    for(int i=1; i<=N; i++){
        dq.push_back(i);
    }


    for(int i=0; i<M; i++){
        int target;
        cin >> target;
        for(int k=0; k<dq.size(); k++){
            if(dq.at(k) == target){
                right = k;
                left = dq.size() - k;
                break;
            }
        }
        if(right < left){
            answer += right;
            for(int i = 0; i < right; i ++){
                dq.push_back(dq.front());
                dq.pop_front();
            }
        } else{
            answer += left;
            for(int i = 0; i < left; i++){
                dq.push_front(dq.back());
                dq.pop_back();
            }
        }
        dq.pop_front();
    }

    cout << answer << "\n";
    return 0;
}
