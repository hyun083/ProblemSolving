import Foundation

let N = Int(readLine()!)!
let info = readLine()!.split(separator: " ").map{String($0)}
let target = readLine()!
var ans = 0
for track in info {
    ans += track == target ? 1 : 0
}
print(ans)