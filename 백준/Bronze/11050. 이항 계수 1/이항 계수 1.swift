import Foundation

func factorial(number : Int) -> Int{
    if(number == 0) {return 1}
    var res = 1
    for i in 1...number{
        res *= i
    }
    return res
}

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let K = inputs[1]

print(factorial(number: N) / factorial(number: N-K) / factorial(number: K))