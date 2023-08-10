import Foundation

func readInt() -> [Int]{
    readLine()!.split(separator: " ").map{Int($0)!}
}

func root(of node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, p:Int, q:Int) -> Bool{
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B {return false}
    arr[B] = A
    cnt -= 1
    return (a==p&&b==q) || (a==q&&b==p)
}

let T = Int(readLine()!)!
var arr = [Int]()
var cnt = Int()

for _ in 0..<T{
    var edges = [(u:Int, v:Int, cost:Int)]()
    let info = readInt()
    var ans = false
    
    let n = info[0]
    let m = info[1]
    let p = info[2]-1
    let q = info[3]-1
    
    arr = Array(repeating: -1, count: n)
    cnt = n
    
    for _ in 0..<m{
        let uvw = readInt()
        let u = uvw[0]-1
        let v = uvw[1]-1
        let w = uvw[2]
        
        edges.append((u,v,w))
    }
    edges.sort(by: {$0.cost > $1.cost})
    
    while cnt>1{
        let edge = edges.removeLast()
        
        if union(a: edge.u, b: edge.v, p: p, q: q){
            ans = true
        }
    }
    print(ans ? "YES":"NO")
}