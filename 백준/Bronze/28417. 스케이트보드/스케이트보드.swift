import Foundation

let N = Int(readLine()!)!
var ans = 0
for _ in 0..<N{
    var score:[Int] = readLine()!.split(separator: " ").map{Int($0)!}.reversed()
    var runScore = [Int]()
    var trickScore = [Int]()
    for _ in 0..<2{
        runScore.append(score.removeLast())
    }
    trickScore = score.sorted(by: >)
    let res = runScore.max()! + trickScore[0] + trickScore[1]
    ans = max(ans, res)
}
print(ans)