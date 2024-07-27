import Foundation

let (N,M,Q) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var arr = Array(repeating: -1, count: N)

func rootOf(node:Int) -> Int{
    if arr[node] < 0 { return node }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    
    if ra == rb { return }
    arr[rb]=ra
}

for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    union(a: u, b: v)
}

for _ in 0..<Q{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    print(rootOf(node: u) == rootOf(node: v) ? "Y":"N")
}