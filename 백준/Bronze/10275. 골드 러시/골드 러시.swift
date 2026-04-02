import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let NAB = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NAB[0]
    let A = NAB[1]
    let B = NAB[2]
    let gold = 1<<N
    
    let res = gold^A^B
    print(String(res, radix: 2).map{Int(String($0))!}.reduce(0, +))
}