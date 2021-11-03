#include <iostream>
#include <list>

using namespace std;

string input;
list<char> operand;

int main() {
    cin >> input;

    for(int i=0; i < input.size(); i++){
        switch (input[i]) {
            case '+':
                while(!operand.empty() && operand.back() != '('){
                    cout << operand.back();
                    operand.pop_back();
                }
                operand.push_back(input[i]);
                break;
            case '-':
                while(!operand.empty() && operand.back() != '('){
                    cout << operand.back();
                    operand.pop_back();
                }
                operand.push_back(input[i]);
                break;
            case '*':
                while(!operand.empty() && operand.back()!='(' && operand.back()!='+' && operand.back()!='-'){
                    cout << operand.back();
                    operand.pop_back();
                }
                operand.push_back(input[i]);
                break;
            case '/':
                while(!operand.empty() && operand.back()!='(' && operand.back()!='+' && operand.back()!='-'){
                    cout << operand.back();
                    operand.pop_back();
                }
                operand.push_back(input[i]);
                break;
            case '(':
                operand.push_back(input[i]);
                break;
            case ')':
                while(operand.back() != '('){
                    cout << operand.back();
                    operand.pop_back();
                }
                operand.pop_back();
                break;
            default:
                cout << input[i];
                break;
        }
    }
    while(!operand.empty()){
        cout << operand.back();
        operand.pop_back();
    }
    return 0;
}

