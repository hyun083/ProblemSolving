import Foundation

let line = readLine()!.split(separator: " ").map{Int($0)!}
let N = line[0]
let A = line[1]
let B = line[2]
let C = line[3]

var ans = 0

func comp(n:Int, k:Int) -> Int{
    var n = n
    var k = k
    var res = 1
    
    for _ in 0..<k{
        res *= n
        n-=1
    }
        
    for _ in 0..<k{
        res /= k
        k-=1
    }
    return res
}
ans = comp(n: N, k: A)
ans *= comp(n: N-A, k: B)
print(ans)