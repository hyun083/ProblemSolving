import Foundation

let N = Int(readLine()!)!
var W = 0
var H = 0
for _ in 0..<N{
    let AB = readLine()!.split(separator: " ").map{Int($0)!}
    W = max(W,min(AB[0],AB[1]))
    H = max(H,max(AB[0],AB[1]))
}
print(W*H)