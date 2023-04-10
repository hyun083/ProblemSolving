import Foundation

let n = Int(readLine()!)!
var cnt = 0
for _ in 0..<n{
    let line = readLine()!.split(separator: "-").map{String($0)}
    if Int(line[1])! <= 90{
        cnt += 1
    }
}
print(cnt)