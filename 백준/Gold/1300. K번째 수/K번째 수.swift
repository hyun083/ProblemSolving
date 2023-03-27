import Foundation

func cnt(of num:Int) -> Int{
    var result = 0
    for i in 1...n{
        result += min(num/i, n)
    }
    return result
}

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var start = 1
var end = n*n

while start <= end{
    let mid = (start+end)/2
    let cnt = cnt(of: mid)
    if cnt >= k{
        end = mid-1
        continue
    }else{
        start = mid+1
        continue
    }
}
print(start)