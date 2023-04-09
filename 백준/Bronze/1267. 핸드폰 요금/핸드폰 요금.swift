import Foundation

let N = Int(readLine()!)!
let times = readLine()!.split(separator: " ").map{Int($0)!}
var Y = 0
var M = 0

for time in times{
    Y += time/30 + 1
    M += time/60 + 1
}

Y *= 10
M *= 15
print(Y>M ? "M \(M)" : Y==M ? "Y M \(M)" : "Y \(Y)")