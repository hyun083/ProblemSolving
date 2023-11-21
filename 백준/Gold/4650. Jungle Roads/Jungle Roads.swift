import Foundation

while let line = readLine(){
    if line == "0" { break }
    let N = Int(line)!
    var arr = Array(repeating: -1, count: N)
    var comp = N
    var ans = 0
    var edges = [(u:Int, v:Int, cost:Int)]()
    
    func root(of node:Int) -> Int{
        if arr[node] < 0 { return node }
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, cost:Int){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B { return }
        arr[B] = A
        ans += cost
        comp -= 1
    }
    
    for _ in 0..<N-1{
        let info = readLine()!.split(separator: " ").map{String($0)}
        let u = Int(Character(info[0]).asciiValue! - 65)
        if info[1] == "0" { continue }
        for i in stride(from: 2, to: info.count, by: +2){
            let v = Int(Character(info[i]).asciiValue! - 65)
            let cost = Int(info[i+1])!
            edges.append((u,v,cost))
        }
    }
    edges.sort(by: {$0.cost > $1.cost})
    
    while comp>1 && !edges.isEmpty{
        let edge = edges.removeLast()
        union(a: edge.u, b: edge.v, cost: edge.cost)
    }
    
    print(ans)
}