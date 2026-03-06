import Foundation

let T = Int(readLine()!)!
for _ in 0..<T {
    let info = readLine()!.map{String($0)}
    var cnt = 0
    for step in info {
        if step == "D" { break }
        cnt += 1
    }
    print(cnt)
}