import Foundation

let NSE = readLine()!.split(separator: " ").map{Int($0)!}
let N = NSE[0]
let S = NSE[1]
let E = NSE[2]
var ans = Double(0)

func damage(until T: Int, r:Int, a:Int, d:Double) -> Double{
    let remain = T % (r+a)
    var res = Double((T/(r+a))) * d
    if remain > r{
        let total = Double(remain-r)
        let ratio = d/Double(a)
        res += total * ratio
    }
    return res
}

for _ in 0..<N{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let R = info[0]
    let A = info[1]
    let D = Double(info[2])
    let res = damage(until: E, r:R, a:A, d:D) - damage(until: S, r: R, a: A, d: D)
    ans += res
}
print(ans/Double(E-S))