import Foundation

let input = readLine()!.map{String($0)}
var num1 = input[0]
var num2 = ""
var op = ""
var flag = false

for i in 1..<input.count {
    let char = String(input[i]).first!
    if !flag {
        if char.isNumber {
            num1.append(char)
        } else {
            op.append(char)
            flag = true
        }
    } else {
        num2.append(char)
    }
}
var ans = Int.min
switch op {
case "+":
    ans = Int(num1, radix: 8)! + Int(num2, radix: 8)!
case "-":
    ans = Int(num1, radix: 8)! - Int(num2, radix: 8)!
case "*":
    ans = Int(num1, radix: 8)! * Int(num2, radix: 8)!
case "/":
    if Int(num2, radix: 8)! == 0{
        break
    }else{
        ans = Int(floor(Double(Int(num1, radix: 8)!) / Double(Int(num2, radix: 8)!)))
    }
default:
    break
}
print(ans==Int.min ? "invalid" : String(ans, radix: 8))