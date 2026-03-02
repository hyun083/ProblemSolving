import Foundation

var line = readLine()!.map{String($0)}
var stk = [Int]()

for curr in line {
    if let num = Int(curr) {
        stk.append(num)
    } else {
        let op1 = stk.removeLast()
        let op2 = stk.removeLast()
        let res = curr=="+" ? op2+op1 :
                  curr=="-" ? op2-op1 :
                  curr=="*" ? op2*op1 : op2/op1
        stk.append(res)
    }
}
print(stk.last!)