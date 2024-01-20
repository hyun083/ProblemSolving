import Foundation

let (A,B) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
let N = Int(readLine()!)!
var ans = abs(A-B)

for _ in 0..<N{
    let S = Int(readLine()!)!
    ans = min(ans, abs(S-B)+1)
}
print(ans)