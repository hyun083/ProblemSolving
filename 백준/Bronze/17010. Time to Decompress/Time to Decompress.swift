import Foundation

let L = Int(readLine()!)!
for _ in 0..<L{
    let line = readLine()!.split(separator: " ").map{String($0)}
    let N = Int(line[0])!
    let char = line[1]
    let ans = String(repeating: char, count: N)
    print(ans)
}