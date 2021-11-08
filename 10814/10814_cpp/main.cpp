#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

class Usr{
public:
    int age;
    string name;
    int number;
    Usr(int age, string name, int number): age(age), name(name), number(number){}
};

bool compare(Usr a, Usr b){
    if(a.age == b.age){
        return a.number < b.number;
    }else{
        return a.age < b.age;
    }
}
vector<Usr> arr;
int main() {
    int N;
    cin >> N;
    for(int i=0; i<N; i++){
        int age;
        string name;
        cin >> age >> name;
        arr.push_back(Usr(age,name,i));
    }
    sort(arr.begin(),arr.end(), compare);
    for(int i=0; i<N; i++){
        cout << arr[i].age << " "<<arr[i].name << "\n";
    }
    return 0;
}
