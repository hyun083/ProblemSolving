import Foundation

let n = Int(readLine()!)!
var input = [String]()
var score = 0
for _ in 0..<n{
    input.append(readLine()!)
}
for i in 0..<n{
    let answer = readLine()!
    if input[i] == answer{
        score += 1
    }
}
print(score)