import Foundation

let N = Int(readLine()!)!
var blank = ""
var stars = String(repeating: "*", count: N)
for _ in 0..<N{
    print(blank+stars)
    blank += " "
    stars.removeLast()
}