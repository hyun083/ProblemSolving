import Foundation

var S = readLine()!.map{String($0)}
var ans = 0
var flag = false
var stk = [String]()

while !S.isEmpty {
    let char = S.removeLast()
    if char == ")" {
        stk.append(char)
    } else if char == "(" {
        stk.removeLast()
    } else {
        break
    }
}
print(stk.count)