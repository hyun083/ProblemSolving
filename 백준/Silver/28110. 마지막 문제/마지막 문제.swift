import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
var diff = -1
var startIdx = 0
var endIdx = 0

for i in 0..<N-1{
    let tmp = (arr[i]-arr[i+1])/2
    
    if tmp == 0 {
        continue
    }else if tmp >= diff {
        diff = tmp
        startIdx = i
        endIdx = i+1
    }
}
let ans = arr[endIdx] + diff
print(diff<0 ? -1:ans)