import Foundation

let N = Int(readLine()!)!

var A = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var B = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var ans = 0

var Ai = 0
var Bi = 0

while Ai < N{
    if Bi == N { break }
    if B[Bi] <= A[Ai] {
        Bi += 1
    }else{
        ans += 1
        Ai += 1
        Bi += 1
    }
}
print(ans>=(N+1)/2 ? "YES":"NO")