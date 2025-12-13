import Foundation

let N = Int(readLine()!)!

for _ in 0..<N{
    let CP = readLine()!.split(separator: " ").map{Int($0)!}
    let C = CP[0]
    let P = CP[1]
    let total = C*P-((C-1)*2)
    print(C,P)
    print(total)
}