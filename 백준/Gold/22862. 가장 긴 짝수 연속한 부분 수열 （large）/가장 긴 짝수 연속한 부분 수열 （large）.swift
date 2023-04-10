import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]

let arr = readLine()!.split(separator: " ").map{Int($0)!}

var head = 0
var tail = 0
var cnt = 0
var ans = 0

while true{
    if cnt > k{
        if arr[head]%2==1{
            cnt -= 1
        }
        head += 1
    }else if tail == n{
        break
    }else{
        if arr[tail]%2==1{
            cnt += 1
        }
        tail += 1
    }
    if cnt <= k{
        ans = max(ans, tail-head-cnt)
    }
}
print(ans)