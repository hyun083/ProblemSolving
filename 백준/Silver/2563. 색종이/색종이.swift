import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: false, count: 100), count: 100)
var ans = 0

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let x = info[1]
    let y = info[0]
    for i in x..<x+10{
        for k in y..<y+10{
            if !arr[i][k]{
                ans += 1
                arr[i][k] = true
            }
        }
    }
}
print(ans)