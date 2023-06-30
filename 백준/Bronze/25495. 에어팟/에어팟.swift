import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0
var last = 0
var connect = 0

for phone in arr{
    if connect == phone{
        ans += last*2
        last *= 2
    }else{
        connect = phone
        ans += 2
        last = 2
    }
    if ans >= 100{
        connect = 0
        ans = 0
        last = 0
    }
}
print(ans)