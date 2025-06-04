import Foundation

let T = Int(readLine()!)!
for _ in 0..<T{
    let U = readLine()!.map{String($0)}
    let V = readLine()!.map{String($0)}
    var ans = 0
    for i in 0..<U.count{
        ans += U[i]==V[i] ? 0:1
    }
    print("Hamming distance is \(ans).")
}