import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.map{Int($0.unicodeScalars.first!.value)}
var res = true
for i in 0..<N-4{
    let tmp = Array(arr[i..<i+5])
    res = true
    for k in 0..<4{
        if abs(tmp[k]-tmp[k+1]) != 1{
            res = false
            break
        }
    }
    if res{ break }
}
print(res ? "YES":"NO")