import Foundation

let (N,Q) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
var arr = Array(repeating: -1, count: N)
var nodes = [(num:Int, x1:Int, x2:Int, y:Int)]()

func root(of node:Int) -> Int{
    if arr[node] < 0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int) -> Bool{
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return false}
    arr[B] = A
    return true
}

for num in 0..<N{
    let (x1, x2, y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    nodes.append((num,x1,x2,y))
}
nodes.sort(by: {
    if $0.x1 == $1.x1{
        return $0.y < $1.y
    }else{
        return $0.x1 < $1.x1
    }
})

for i in 0..<N-1{
    let u = nodes[i]
    let v = nodes[i+1]
    
    if u.x1 <= v.x1 && v.x1 <= u.x2{
        union(a: u.num, b: v.num)
    }
}

for _ in 0..<Q{
    let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
    print(root(of: u) == root(of: v) ? 1:0)
}