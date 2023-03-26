import Foundation

let ns = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = ns[0]
let s = ns[1]
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var len = n+1
var start = 0
var end = 0
var sum = arr[0]

while start<=end && end<n{
    if sum<s{
        end += 1
        if end == n{
            break
        }
        sum += arr[end]
    }else{
        len = min(len, end - start + 1)
        sum -= arr[start]
        start += 1
    }
}
if len == n+1{
    print(0)
}else{
    print(len)
}