import Foundation

let INF = Int.max
let N = Int(readLine()!)!
var line = readLine()!.split(separator: " ").map{Int($0)!}
var hp = Array(repeating: 0, count: 3)
for i in 0..<N{ hp[i] = line[i] }
var dp = Array(repeating: Array(repeating: Array(repeating: INF, count: 61), count: 61), count: 61)

func attack(a:Int, b:Int, c:Int) -> Int{
    if a<0{
        return attack(a: 0, b: b, c: c)
    }else if b<0{
        return attack(a: a, b: 0, c: c)
    }else if c<0{
        return attack(a: a, b: b, c: 0)
    }else if a+b+c==0{ return 0 }
    
    var tmp = dp[a][b][c]
    if tmp != INF{
        return tmp
    }
    
    tmp = min(tmp, attack(a: a-9, b: b-3, c: c-1)+1)
    tmp = min(tmp, attack(a: a-9, b: b-1, c: c-3)+1)
    tmp = min(tmp, attack(a: a-3, b: b-9, c: c-1)+1)
    tmp = min(tmp, attack(a: a-3, b: b-1, c: c-9)+1)
    tmp = min(tmp, attack(a: a-1, b: b-9, c: c-3)+1)
    tmp = min(tmp, attack(a: a-1, b: b-3, c: c-9)+1)
    
    dp[a][b][c] = tmp
    return tmp
}
print(attack(a: hp[0], b: hp[1], c: hp[2]))