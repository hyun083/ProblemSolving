import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = [Int](1...N)
for _ in 0..<M{
    let (i,k) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    arr[i...k].reverse()
}
for ans in arr{
    print(ans,terminator: " ")
}