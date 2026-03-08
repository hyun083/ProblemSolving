import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.map{String($0)}

var left = 0
var right = arr.filter({$0 == "B"}).count
var ans = N

for i in 0..<N{
    var temp = (left,right)
    if arr[i]=="B" {
        temp.1 -= 1
        left += 1
        right -= 1
    }
    let cntOfD = i-temp.0
    let cnt = cntOfD+(temp.1)
    ans = min(cnt, ans)
}

print(ans)