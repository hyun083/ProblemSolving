import Foundation

let N = Int(readLine()!)!
var blank = String(repeating: " ", count: N-1)
var stars = "*"

for _ in 0..<N-1{
    print(blank+stars)
    blank.removeLast()
    stars += "**"
}

for _ in 0..<N-1{
    print(blank+stars)
    blank += " "
    stars.removeLast()
    stars.removeLast()
}
print(blank+stars)