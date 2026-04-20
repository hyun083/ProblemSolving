import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var stk = [Int]()

for num in arr.reversed() {
    if stk.isEmpty {
        stk.append(num)
    } else {
        if (stk.last! + num) % 2 == 0{
            stk.removeLast()
        } else {
            stk.append(num)
        }
    }
}
print(stk.count)