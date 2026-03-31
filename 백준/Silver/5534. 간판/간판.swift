import Foundation

let N = Int(readLine()!)!
let target = readLine()!
var ans = 0
for _ in 0..<N {
    let arr = readLine()!.map{String($0)}
    for i in 0..<arr.count {
        var res = ""
        for offset in 1..<arr.count {
            for k in 0..<target.count {
                if i+(k*offset) >= arr.count { break }
                res += arr[i+(k*offset)]
            }
            if res == target {
                break
            } else {
                res = ""
            }
        }
        if res == target {
            ans += 1
            break
        }
    }
}
print(ans)