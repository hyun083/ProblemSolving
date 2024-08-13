import Foundation

let NK = readLine()!.split(separator: " ").map{Int($0)!}
let N = NK[0]
let K = NK[1]
var arr = [(start:Int, end:Int)]()
var map = Array(repeating:0, count:1000002)

for _ in 0..<N{
    let num = readLine()!.split(separator: " ").map{Int($0)!}
    map[num[0]] += 1
    map[num[1]] -= 1
}

for i in 0..<1000001{
    map[i+1] += map[i]
}

var left = 0
var right = 0
var tmp = 0
var ans = [0,0]

while left<=1000000{
    if tmp<K && right<=1000000{
        tmp += map[right]
        right += 1
    }else if tmp==K{
        ans[0] = left
        ans[1] = right
        break
    }else{
        tmp -= map[left]
        left += 1
    }
}
print(ans[0], ans[1])