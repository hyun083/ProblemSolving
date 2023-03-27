import Foundation

let nc = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nc[0]
let c = nc[1]
var arr = [Int]()
for _ in 0..<n{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: <)

func check(length:Int)->Int{
    var cnt = 1
    var from = 0
    for to in 1..<n{
        if arr[to] - arr[from] >= length{
            cnt+=1
            from = to
        }
    }
    return cnt
}

var start = 1
var end = arr.last!
var ans = 0
while start <= end{
    let mid = (start+end)/2
    if check(length: mid) < c{
        end = mid-1
    }else{
        ans = max(ans, mid)
        start = mid+1
    }
}
print(ans)