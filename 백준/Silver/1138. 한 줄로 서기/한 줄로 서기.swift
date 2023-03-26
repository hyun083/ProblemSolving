import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = Array(repeating: 0, count: n)
var number = 1

for i in 0..<n{
    var cnt = 0
    for k in 0..<n{
        if ans[k] == 0{
            cnt += 1
        }
        if cnt > arr[i]{
            ans[k] = number
            number += 1
            break
        }
    }
}
for ans in ans{
    print(ans,terminator: " ")
}