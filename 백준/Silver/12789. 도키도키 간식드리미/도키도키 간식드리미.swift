import Foundation

let N = Int(readLine()!)!
var line:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
var stk = [Int]()
var curr = 1

for i in 0..<N{
    let last = line.removeLast()
    stk.append(last)
    while !stk.isEmpty {
        if curr == stk.last!{
            stk.removeLast()
            curr += 1
        }else{
            break
        }
    }
}
while !stk.isEmpty {
    if curr == stk.last!{
        stk.removeLast()
        curr += 1
    }else{
        break
    }
}
print(stk.isEmpty ? "Nice":"Sad")