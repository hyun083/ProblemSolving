import Foundation

let N = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
var ans = 0
let MOD = 1000000007

for i in 0..<N-1{
    var pow = 1
    for k in i+1..<N{
        ans += (pow)*(arr[k]-arr[i])%MOD
        ans %= MOD
        pow *= 2
        pow %= MOD
    }
}
print(ans)