import Foundation

var sum = 0
for _ in 0..<5{
    let score = Int(readLine()!)!
    sum += score<40 ? 40:score
}
print(sum/5)