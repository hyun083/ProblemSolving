import Foundation

let mn = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = mn[0]   //조카들의 수
let n = mn[1]   //과자의 수
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var start = 1
var end = arr.max()!
var ans = 0
while start <= end{
    var cnt = 0
    let mid = (start+end)/2
    for length in arr{
        cnt += length/mid
    }
    if cnt>=m{
        ans = max(ans, mid)
        start = mid+1
    }else if cnt<m{
        end = mid-1
    }
}
print(ans)