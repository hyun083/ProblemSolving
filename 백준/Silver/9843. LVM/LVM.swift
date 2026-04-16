import Foundation

let N = Int(readLine()!)!
var cmd = [String]()

for _ in 0..<N {
    let line = readLine()!
    cmd.append(line)
}

var index = 0
var stk = [Int]()
var reg = 0

while index < cmd.count {
    let cmd = cmd[index].split(separator: " ").map{String($0)}
    
    if cmd[0] == "PUSH" {
        stk.append(Int(cmd[1])!)
    } else if cmd[0] == "STORE" {
        reg = stk.removeLast()
    } else if cmd[0] == "LOAD" {
        stk.append(reg)
    } else if cmd[0] == "PLUS" {
        let a = stk.removeLast()
        let b = stk.removeLast()
        stk.append(a+b)
    } else if cmd[0] == "TIMES" {
        let a = stk.removeLast()
        let b = stk.removeLast()
        stk.append(a*b)
    } else if cmd[0] == "IFZERO" {
        let last = stk.removeLast()
        if last == 0 {
            index = Int(cmd[1])!
            continue
        }
    } else {
        break
    }
    index += 1
}
print(stk.last!)