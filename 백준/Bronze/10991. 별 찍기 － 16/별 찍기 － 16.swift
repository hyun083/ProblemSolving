import Foundation

let N = Int(readLine()!)!
var star = ["*"]
var blank = String(repeating: " ", count: N-1)

for _ in 0..<N{
    print(blank+star.joined(separator: " "))
    star.append("*")
    if !blank.isEmpty{ blank.removeLast() }
}