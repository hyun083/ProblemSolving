import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    let reversedNumber = Int(String(String(N).reversed()))!
    
    let sum = N + reversedNumber
    let reversedSum = Int(String(String(sum).reversed()))!
    print(sum==reversedSum ? "YES" : "NO")
}