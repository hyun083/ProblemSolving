import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let VE = readLine()!.split(separator: " ").map{Int($0)!}
    let V = VE[0]
    let E = VE[1]
    print(-1*(V-E-2))
}