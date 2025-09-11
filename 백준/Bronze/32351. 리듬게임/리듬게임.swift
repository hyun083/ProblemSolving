import Foundation

let NSK = readLine()!.split(separator: " ").map{Double($0)!}
let N = NSK[0]
let S = NSK[1]
let K = Int(NSK[2])

var currBar = 1.0
var currBPM = S
var sum = 0.0
for _ in 0..<K{
    let info = readLine()!.split(separator: " ").map{Double($0)!}
    let nextBar = info[0]
    let nextBPM = info[1]
    let bit = (nextBar-currBar)*4
    sum += bit/(currBPM/60)
    currBar = nextBar
    currBPM = nextBPM
}
let bit = (N-currBar+1)*4
sum += bit/(currBPM/60)
print(String(format: "%.12f", sum))