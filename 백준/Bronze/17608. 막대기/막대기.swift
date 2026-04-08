import Foundation

var arr = [Int]()
let N = Int(readLine()!)!
for _ in 0..<N {
    let num = Int(readLine()!)!
    arr.append(num)
}

var cnt = 1
var target = arr.removeLast()
while !arr.isEmpty {
    let num = arr.removeLast()
    if target < num {
        target = num
        cnt += 1
    }
}
print(cnt)