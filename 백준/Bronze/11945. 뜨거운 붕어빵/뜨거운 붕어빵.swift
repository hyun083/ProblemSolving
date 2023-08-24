import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
var ans = [String]()

for _ in 0..<N{
    let line = readLine()!.map{String($0)}
    ans.append(line.reversed().joined())
}
print(ans.joined(separator: "\n"))