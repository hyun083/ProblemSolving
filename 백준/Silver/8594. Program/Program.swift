import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.map{String($0)}
var stk = [String]()
var ans = 0

for element in arr {
    if element == "(" || element == "[" || element == "{" {
        stk.append(element)
    } else if element == ")" {
        if stk.last == "(" {
            stk.removeLast()
        } else {
            stk.append(element)
        }
    } else if element == "]" {
        if stk.last == "[" {
            stk.removeLast()
        } else {
            stk.append(element)
        }
    } else if element == "}" {
        if stk.last == "{" {
            stk.removeLast()
        } else {
            stk.append(element)
        }
    }
    ans = max(ans, stk.count)
}

if stk.isEmpty {
    print(ans)
} else {
    print("NIE")
}