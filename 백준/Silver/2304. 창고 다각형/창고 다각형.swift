import Foundation

let n = Int(readLine()!)!
var map = Array(repeating: Int(), count: 1001)


var poleH = 0
var poleP = 0
for _ in 0..<n{
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[line[0]] = line[1]
    if poleH < line[1]{
        poleH = line[1]
        poleP = line[0]
    }
}

var leftH = 0
var rightH = 0
var leftSize = 0
var rightSize = 0

for i in 0..<poleP{
    leftH = max(leftH, map[i])
    leftSize += leftH
}

for i in stride(from: 1000, to: poleP, by: -1){
    rightH = max(rightH, map[i])
    rightSize += rightH
}
print(leftSize + rightSize + poleH)