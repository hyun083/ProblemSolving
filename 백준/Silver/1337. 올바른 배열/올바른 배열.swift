import Foundation

let n = Int(readLine()!)!
var map = [Int]()
var ans = 0
var cnt = 1

for _ in 0..<n{
    map.append(Int(readLine()!)!)
}
map.sort(by: <)

for i in 0..<n{
    cnt = 1
    for k in i+1..<i+5{
        if k>=n{ break }
        if map[k]-map[i]<5{ cnt += 1}
    }
    ans = max(ans, cnt)
}
print(5-ans)