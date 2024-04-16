import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var ans = [Int](1...N)

for _ in 0..<M{
    let (i,k) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    ans.swapAt(i,k)
}
for ans in ans{
    print(ans,terminator: " ")
}
