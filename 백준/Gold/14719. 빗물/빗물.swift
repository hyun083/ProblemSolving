import Foundation

let info = readLine()!.split(separator: " ").map{Int($0)!}
let arr = readLine()!.split(separator: " ").map{Int($0)!}

let H = info[0]
let W = info[1]

var base = arr[0]
var ans = 0
var tmp = 0
var mid = -1

for i in 0..<W{
    if base <= arr[i]{
        base = arr[i]
        ans += tmp
        tmp = 0
        mid = i
    }else{
        tmp += base - arr[i]
    }
}

tmp = 0
base = arr.last!

for i in (mid..<W).reversed(){
    if base <= arr[i]{
        base = arr[i]
        ans += tmp
        tmp = 0
    }else{
        tmp += base - arr[i]
    }
}
print(ans)