import Foundation

let (L,K,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = [L]
arr += readLine()!.split(separator: " ").map{Int($0)!}
arr.append(0)

arr = Set(arr).sorted(by: >)

var lo = 0
var hi = Int.max/2
var ans = -1
var pos = -1

while lo<=hi{
    let mid = (lo+hi)/2
    var cnt = 0
    var res = 0
    var sum = 0
    var tmpPos = -1
    
    for i in 1..<arr.count{
        if sum+(arr[i-1]-arr[i]) > mid{
            res = max(res, sum)
            cnt += 1
            sum = arr[i-1]-arr[i]
            tmpPos = arr[i-1]
            if i==arr.count-1{
                res = max(res, arr[i-1])
            }
        }else{
            sum += (arr[i-1]-arr[i])
            if i==arr.count-1{
                if cnt<C{
                    cnt += 1
                    tmpPos = arr[i-1]
                    res = max(res, sum-(arr[i-1]-arr[i]))
                    res = max(res, arr[i-1]-arr[i])
                }
            }
        }
    }
    
    if cnt<=C{
        ans = res
        pos = tmpPos
        hi = mid-1
    }else{
        lo = mid+1
    }
}
print(ans,pos)
