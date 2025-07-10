import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

let hint = readLine()!.map{String($0)}
for _ in 0..<M{
    let memo = readLine()!.map{String($0)}
    var idx = 0
    for i in 0..<memo.count{
        if idx == N { break }
        if memo[i] == hint[idx]{
            idx += 1
        }else{
            continue
        }
    }
    print(idx==N ? "true":"false")
}