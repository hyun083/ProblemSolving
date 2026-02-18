import Foundation

let info = readLine()!.split(separator: " ").map { Int($0)! }
let N = info[0]
var J = info[1]
var S = info[2]
let H0 = info[3]
let K = info[4]

var arr = [[Character]]()
for _ in 0..<3 {
    arr.append(Array(readLine()!))
}

var smallJump = 0
var largeJump = 0
var topSlide = 0

for i in 0..<N {
    let curr = String([arr[0][i], arr[1][i], arr[2][i]])
    if curr == "..." { continue }
    else if curr == "..^" { smallJump += 1 }
    else if curr == ".^^" { largeJump += 1 }
    else { topSlide += 1 }
}

var collisions = 0

let avoidSmall = min(J, smallJump)
J -= avoidSmall
collisions += (smallJump - avoidSmall)

let avoidLarge = min(largeJump, J / 2)
J -= avoidLarge * 2
collisions += (largeJump - avoidLarge)

let avoidTop = min(S, topSlide)
S -= avoidTop
collisions += (topSlide - avoidTop)

let resultH = H0 - collisions * K
print(resultH > 0 ? resultH : -1)