import Foundation

let NX = readLine()!.split(separator:  " ").map{Int($0)!}
let N = NX[0]
let X = NX[1]
var ans = Int.max

var arr = readLine()!.split(separator: " ").map{Int($0)!}
for i in 0..<N-1{
    let price = arr[i]*X + arr[i+1]*X
    ans = min(ans, price)
}
print(ans)
