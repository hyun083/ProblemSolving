import Foundation

let n = Int(readLine()!)!
var numbers = Array(1...n)
var stack = Array<Int>()
var answer = Array<String>()
var flag = true

for _ in 1...n{
    let number = Int(readLine()!)!
    while(stack.last != number){
        if(numbers.isEmpty){
            flag = false
            break
        }else{
            stack.append(numbers.removeFirst())
            answer.append("+")
        }
    }
    if stack.last == number{
        stack.removeLast()
        answer.append("-")
    }
}

if(flag){
    for a in answer{
        print(a)
    }
}else{
    print("NO")
}