import Foundation

let (S,P) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = readLine()!.map{String($0)}
var cnt = readLine()!.split(separator: " ").map{Int($0)!}

var curr = Array(repeating: 0, count: 4)
let idx = ["A":0,"C":1,"G":2,"T":3]

for i in 0..<P{
    if idx[arr[i]] == nil{ continue }
    curr[idx[arr[i]]!] += 1
}

func flag() -> Int{
    for i in 0..<4{
        if curr[i] < cnt[i]{
            return 0
        }
    }
    return 1
}

var ans = flag()
var head = P
var tail = 0

while head < S{
    if idx[arr[head]] != nil{
        curr[idx[arr[head]]!] += 1
    }
    if idx[arr[tail]] != nil{
        curr[idx[arr[tail]]!] -= 1
    }
    ans += flag()
    head += 1
    tail += 1
}
print(ans)