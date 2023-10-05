import Foundation

var T = 1

while let line = readLine(){
    if line == ""{
        continue
    }else if line == "0"{
        break
    }
    
    let N = Int(line)!
    var arr = Array(repeating: -1, count: N)
    var vertex = [(x:Int, y:Int)]()
    var edges = [(u:Int, v:Int, cost:Double)]()
    var comp = N
    var ans = Double(0)
    
    func root(of node:Int) -> Int{
        if arr[node] < 0{
            return node
        }
        
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, dist:Double){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B { return }
        arr[B] = A
        comp -= 1
        ans = max(ans, dist)
    }
    
    func distance(from a:(x:Int, y:Int), to b:(x:Int, y:Int)) -> Double{
        let ax = Double(a.x)
        let ay = Double(a.y)
        
        let bx = Double(b.x)
        let by = Double(b.y)
        
        return sqrt((abs(ax-bx)*abs(ax-bx)) + (abs(ay-by)*abs(ay-by)))
    }
    
    for _ in 0..<N{
        let (X,Y) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
        vertex.append((X,Y))
    }
    
    for u in 0..<N-1{
        for v in u+1..<N{
            edges.append((u,v,distance(from: vertex[u], to: vertex[v])))
        }
    }
    edges.sort(by: {$0.cost > $1.cost})
    
    while root(of: 0) != root(of: 1) && !edges.isEmpty{
        let edge = edges.removeLast()
        union(a: edge.u, b: edge.v, dist: edge.cost)
    }
    
    print( "Scenario #\(T)\nFrog Distance = \(String(format: "%.3f", ans))\n" )
    T += 1
}