import Foundation

let N = Int(readLine()!)!
var stars = String(repeating: "**", count: N)
stars.removeLast()
var blank = ""

for _ in 1..<N{
    print(blank+stars)
    stars.removeLast()
    stars.removeLast()
    blank+=" "
}
print(blank+stars)