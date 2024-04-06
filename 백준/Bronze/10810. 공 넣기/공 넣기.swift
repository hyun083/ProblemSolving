import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: "0", count: N)

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{String($0)}
    let i = Int(line[0])!-1
    let j = Int(line[1])!-1
    let k = line[2]
    for idx in i...j{ arr[idx] = k}
}
print(arr.joined(separator: " "))