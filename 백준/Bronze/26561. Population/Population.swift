import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let PT = readLine()!.split(separator: " ").map{Int($0)!}
    let P = PT[0]
    let T = PT[1]
    print(P - (T/7) + (T/4))
}