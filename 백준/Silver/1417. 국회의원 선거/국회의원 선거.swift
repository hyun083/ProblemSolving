import Foundation

let n = Int(readLine()!)!
var candidates = [Int]()
var ans = 0
var my = Int(readLine()!)!

for _ in 1..<n{
    candidates.append(Int(readLine()!)!)
}
if n == 1{
    print(0)
}else{
    var target = candidates.max()!
    while my <= target{
        let idx = candidates.firstIndex(of: target)!
        candidates[idx] -= 1
        my += 1
        target = candidates.max()!
        ans += 1
    }
    print(ans)
}