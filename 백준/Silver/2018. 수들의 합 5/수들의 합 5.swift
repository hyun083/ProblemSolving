import Foundation

let n = Int(readLine()!)!
var arr = [Int](1...n)
var s = 0
var e = 0
var sum = 0
var cnt = 0

while true{
    if sum >= n{
        sum -= arr[s]
        s += 1
    }else if e==n{
        break;
    }else{
        sum += arr[e]
        e += 1
    }
    if sum == n{
        cnt += 1
    }
}
print(cnt)