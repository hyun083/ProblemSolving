import Foundation

let N = Int(readLine()!)!
for _ in 0..<N {
let AM = readLine()!.split(separator: " ").map{Double($0)!}
let A = AM[0]
let M = AM[1]
print(Int(A*M*0.00176))
}