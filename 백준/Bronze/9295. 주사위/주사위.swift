import Foundation

let T = Int(readLine()!)!
for t in 1...T{
    let (A, B) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    print("Case \(t): \(A+B)")
}