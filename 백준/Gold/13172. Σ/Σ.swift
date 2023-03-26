import Foundation

let MOD = 1000000007
let M = Int(readLine()!)!
var ans = 0

func gcd(a:Int, b:Int) -> Int{
    if b == 0{
        return a
    }else{
        return gcd(a: b, b: a%b)
    }
}

func p(a:Int, b:Int) -> Int{
    if b == 1{
        return a
    }
    if b%2 == 1{
        return a*p(a: a, b: b-1)%MOD
    }
    let tmp = p(a: a, b: b/2)
    return tmp * tmp % MOD
}

for _ in 0..<M{
    let NS = readLine()!.split(separator: " ").map{Int($0)!}
    let g = gcd(a: NS[0], b: NS[1])
    let N = NS[0]/g
    let S = NS[1]/g
    
    ans += S*p(a: N, b: MOD-2)%MOD
    ans %= MOD
}
print(ans)