import Foundation

let n = Int(readLine()!)!
var cow = Array(repeating: -1, count: 11)
var cnt = 0

for _ in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let num = info[0]
    let pos = info[1]
    
    if cow[num] < 0{
        cow[num] = pos
    }else if cow[num] != pos{
        cow[num] = pos
        cnt += 1
    }
}
print(cnt)