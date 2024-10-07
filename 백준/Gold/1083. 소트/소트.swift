import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = [Int]()
var S = Int(readLine()!)!
var idx = 0

while S>0 && idx<N{
    var maxIdx = idx
    
    for i in idx...min(N-1, idx+S){
        if arr[maxIdx] < arr[i]{ maxIdx = i }
    }
    for i in stride(from: maxIdx, to: idx, by: -1){
        arr.swapAt(i, i-1)
        S -= 1
    }
    idx += 1
}
for ans in arr{
    print(ans, terminator: " ")
}