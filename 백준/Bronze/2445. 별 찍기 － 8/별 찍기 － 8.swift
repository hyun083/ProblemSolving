import Foundation

let N = Int(readLine()!)!
var stars = "*"
var blank = String(repeating: " ", count: N-1)

for _ in 0..<N-1{
    print(stars+blank+blank+stars)
    stars += "*"
    blank.removeLast()
}
for _ in 0..<N{
    print(stars+blank+blank+stars)
    stars.removeLast()
    blank+=" "
}