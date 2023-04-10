import Foundation

func plus(num1:[Int], num2:[Int]) -> [Int]{
    var result = [Int]()
    var num1 = Array(num1.reversed())
    var num2 = Array(num2.reversed())
    var carry = 0
    if num1.count > num2.count{
        for _ in 0..<num1.count - num2.count{
            num2.append(0)
        }
    }else{
        for _ in 0..<num2.count - num1.count{
            num1.append(0)
        }
    }
    for i in 0..<num2.count{
        result.append((carry+num1[i]+num2[i])%10)
        carry = (carry+num1[i]+num2[i])/10
    }
    if carry != 0 {
        result.append(carry)
    }
    
    return Array(result.reversed())
}

let numbers = readLine()!.split(separator: " ").map{String($0)}
let A = numbers[0].map{Int(String($0))!}
let B = numbers[1].map{Int(String($0))!}
let sum = plus(num1: A, num2: B).map{String($0)}.joined(separator: "")
print(sum)