import Foundation

let (d,n,m) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = [0,d]
for _ in 0..<n{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: <)

var lo = 0
var hi = d
var ans = 0

while lo<=hi{
    let mid = (lo+hi)/2
    var pre = arr[0]
    var cnt = 0
    var res = d+1
    
    for i in 1..<arr.count{
        if arr[i]-pre < mid{
            cnt += 1
        }else{
            res = min(res, arr[i]-pre)
            pre = arr[i]
        }
    }
    if pre < arr[arr.count-1]{
        cnt -= 1
        res = min(res, arr.last!-pre)
    }
    
    if cnt > m{
        hi = mid-1
    }else{
        ans = max(ans, res)
        lo = mid+1
    }
}
print(ans)