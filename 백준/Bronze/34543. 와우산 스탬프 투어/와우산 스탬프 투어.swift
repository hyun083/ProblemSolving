import Foundation

let N = Int(readLine()!)!
let W = Int(readLine()!)!
var score = N*10

score += N>=3 ? 20:0
score += N==5 ? 50:0
score -= W>1000 ? 15:0

print(score<0 ? 0:score)