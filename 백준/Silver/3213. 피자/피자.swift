import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: 0, count: 3)

for _ in 0..<N{
    let num = readLine()!.split(separator: "/").map{Int($0)!}
    if num[0]==1 && num[1]==4{
        arr[0]+=1
    }else if num[0]==1 && num[1]==2{
        arr[1]+=1
    }else{
        arr[2]+=1
    }
}
var ans = 0


if arr[0] <= arr[2]{
    ans += arr[2]
    arr[0] = 0
}else{
    ans += arr[2]
    arr[0] -= arr[2]
}
arr[2] = 0

ans += arr[1]/2
arr[1] %= 2

if arr[0] <= arr[1]{
    ans += arr[1]
    arr[0] = 0
}else{
    ans += arr[1]
    arr[0] -= arr[1]
}
arr[1] = 0

ans += arr[0]/4
arr[0] = arr[0]%4

ans += arr[0]>0 ? 1:0

print(ans)