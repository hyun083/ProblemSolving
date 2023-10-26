import Foundation

let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)

func root(of node:Int) -> Int{
    if arr[node] < 0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    arr[A] += arr[B]
    arr[B] = A
}

for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    union(a: u, b: v)
}

var (C,H,K) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
var nodes = [Int]()

for i in 0..<N{
    let h = root(of: H)
    let r = root(of: i)
    if arr[i] > 0 { continue }
    if r==h { continue }
    
    nodes.append(i)
}
nodes.sort(by: {arr[$0] > arr[$1]})

while K>0 && !nodes.isEmpty{
    let node = nodes.removeLast()
    K-=1
    union(a: C, b: node)
}
print(-1*arr[C])