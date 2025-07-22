import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.map{String($0)}
var res = true
for i in 0..<N-4{
    let tmp = arr[i..<i+5].map{Int($0.unicodeScalars.first!.value)}
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