import Foundation

let N = Int(readLine()!)!
let cmd = readLine()!
var stk = [String]()
var ans = 1

for cmd in cmd {
    if cmd.isLowercase{
        stk.append(String(cmd))
    } else if !stk.isEmpty && stk.last! == String(cmd.lowercased()){
        stk.removeLast()
    } else {
        ans = 0
        break
    }
}
print(stk.isEmpty&&cmd.count==N ? ans : 0)