import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var cardsOfPlayer = [[Int]]()
var scoreOfPlayer = Array(repeating: 0, count: N)
for _ in 0..<N{
    let cards = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: >)
    cardsOfPlayer.append(cards)
}
for i in 0..<M{
    var target = 0
    var winners = [Int]()
    for k in 0..<N{
        let numberOfCard = cardsOfPlayer[k][i]
        if target < numberOfCard{
            target = numberOfCard
            winners = [k]
        }else if target == numberOfCard{
            winners.append(k)
        }
    }
    for winner in winners {
        scoreOfPlayer[winner] += 1
    }
}
let maxScore = scoreOfPlayer.max()!
for i in 0..<N{
    if maxScore == scoreOfPlayer[i]{
        print(i+1,terminator: " ")
    }
}