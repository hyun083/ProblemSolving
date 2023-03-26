import Foundation

let N = Int(readLine()!)!
var stars = String(repeating: "*", count: N+N-1)
var blank = ""

for _ in 0..<N-1{
    print(blank+stars)
    stars.removeLast()
    stars.removeLast()
    blank+=" "
}
for _ in 0..<N-1{
    print(blank+stars)
    blank.removeLast()
    stars+="**"
}
print(blank+stars)