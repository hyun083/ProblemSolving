import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    for _ in 0..<N{
        let num = readLine()!.split(separator: " ").map{Int($0)!}
        print(num.reduce(0, +),num.reduce(1, *))
    }
}