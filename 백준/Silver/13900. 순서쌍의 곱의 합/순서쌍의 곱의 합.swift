import Foundation

let n = Int(readLine()!)!
var ans = 0
var temp = 0
let arr = [0] + readLine()!.split(separator: " ").map{Int($0)!}
let psum = arr.map{num -> Int in
    temp += num
    return temp
}

for i in 1..<n{
    ans += arr[i] * (psum[n]-psum[i])
}
print(ans)