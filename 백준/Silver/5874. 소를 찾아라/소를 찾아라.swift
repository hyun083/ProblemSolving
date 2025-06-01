import Foundation

let arr = readLine()!.map{String($0)}
var cnt = 0
var ans = 0

for i in 0..<arr.count-1 {
    if arr[i]+arr[i+1] == "(("{
        cnt += 1
    }else if arr[i]+arr[i+1] == "))"{
        ans += cnt
    }
}
print(ans)