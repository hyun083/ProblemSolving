import Foundation

var ans = Int(readLine()!)!
var oper = ""

while let input = readLine(){
    if input == "="{
        print(ans)
        break
    }
    
    if let num = Int(input){
        if oper == "+"{
            ans += num
        }else if oper == "-"{
            ans -= num
        }else if oper == "*"{
            ans *= num
        }else if oper == "/"{
            ans /= num
        }
    }else{
        oper = input
    }
}