import Foundation

let N = Int(readLine()!)!
for _ in 0..<N{
    let (A,B,X) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    print(A*(X-1)+B)
}