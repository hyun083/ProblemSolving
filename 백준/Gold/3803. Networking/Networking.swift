import Foundation

while let line = readLine(){
    let input = line.split(separator: " ").map{Int($0)!}
    if input.count == 1{ break }
    
    let P = input[0]
    let R = input[1]
    var comp = P
    var ans = 0
    
    var arr = Array(repeating: -1, count: P)
    var edges = [(u:Int, v:Int, cost:Int)]()
    
    func root(of node:Int) -> Int{
        if arr[node]<0 {return node}
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, cost:Int){
        let A = root(of: a)
        let B = root(of: b)
        if A==B { return }
        arr[B] = A
        comp -= 1
        ans += cost
    }
    
    for _ in 0..<R{
        let (u,v,c) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
        edges.append((u,v,c))
    }
    edges.sort(by: {$0.cost > $1.cost})
    
    while comp>1 && !edges.isEmpty{
        let edge = edges.removeLast()
        union(a: edge.u, b: edge.v, cost: edge.cost)
    }
    print(ans)
    readLine()
}