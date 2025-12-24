import Foundation

let N = Int(readLine()!)!
var ans = 0
for _ in 0..<N{
    let score = readLine()!.split(separator: " ").map{Int($0)!}
    let runScore = score.prefix(2).sorted(by: >)
    let trickScore = score.suffix(5).sorted(by: >)
    
    let res = runScore[0] + trickScore[0] + trickScore[1]
    ans = max(ans, res)
}
print(ans)