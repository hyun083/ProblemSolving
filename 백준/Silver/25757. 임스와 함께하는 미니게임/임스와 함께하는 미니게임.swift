import Foundation

let info = readLine()!.split(separator: " ").map{String($0)}
let N = Int(info[0])!
let type = info[1]
var player = Set<String>()
let game = ["Y":1,"F":2,"O":3]

for _ in 0..<N{
    let name = readLine()!
    player.insert(name)
}
print(player.count/game[type]!)