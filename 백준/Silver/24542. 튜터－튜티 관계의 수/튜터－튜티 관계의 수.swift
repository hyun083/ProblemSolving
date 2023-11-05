import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var ans = 1

func root(of node:Int) -> Int{
    if arr[node]<0 {return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B {return}
    arr[A] += arr[B]
    arr[B] = A
}

for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    union(a: u, b: v)
}

for i in 0..<N{
    if arr[i]<0{
        ans *= abs(arr[i])
        ans %= 1000000007
    }
}
print(ans)