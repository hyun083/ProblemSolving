import Foundation

var line = readLine()!.map{String($0)}
var stk = [Int]()

for curr in line {
    if let num = Int(curr) {
        stk.append(num)
    } else if curr == "+" {
        let op1 = stk.removeLast()
        let op2 = stk.removeLast()
        stk.append(op2+op1)
    } else if curr == "-" {
        let op1 = stk.removeLast()
        let op2 = stk.removeLast()
        stk.append(op2-op1)
    } else if curr == "*" {
        let op1 = stk.removeLast()
        let op2 = stk.removeLast()
        stk.append(op2*op1)
    } else if curr == "/" {
        let op1 = stk.removeLast()
        let op2 = stk.removeLast()
        stk.append(op2/op1)
    }
}
print(stk.last!)