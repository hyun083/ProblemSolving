import Foundation

let k = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
var visited = Array(repeating: false, count: k)
let s = arr.reduce(0, +)
var ans = Array(repeating: false, count: s+1)

func btk(total:Int, idx:Int){
    if 1 <= total && total <= s{
        ans[total] = true
    }
    for i in idx..<k{
        if !visited[i]{
            visited[i] = true
            btk(total: total-arr[i],idx: i)
            btk(total: total+arr[i],idx: i)
            visited[i] = false
        }
    }
}
btk(total: 0, idx: 0)
var cnt = 0
for i in 1...s{
    if !ans[i]{
        cnt += 1
    }
}
print(cnt)