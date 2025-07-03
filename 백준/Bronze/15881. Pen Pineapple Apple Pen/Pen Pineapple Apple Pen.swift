import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.map{String($0)}
var ans = 0
var curr = 0
while curr < N-3{
    let tmp = arr[curr..<curr+4].joined(separator: "")
    if tmp == "pPAp"{
        ans += 1
        curr += 4
    }else{
        curr += 1
    }
}
print(ans)