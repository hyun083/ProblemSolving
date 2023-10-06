import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let (N,M) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    var edges = [(u:Int, v:Int, cost:Int)]()
    var ans = [Int]()
    var arr = Array(repeating: -1, count: N)
    var comp = N
    var totalCost = 0
    
    func root(of node:Int) -> Int{
        if arr[node] < 0{
            return node
        }
        
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, cost:Int){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B { return }
        arr[B] = A
        comp -= 1
        totalCost += cost
    }
     
    for u in 1...N-1{
        let (v, cost) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
        edges.append((u,v,cost))
    }
    
    for _ in 0..<M{
        let (u, v, cost) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
        arr = Array(repeating: -1, count: N)
        comp = N
        totalCost = 0
        
        edges.append((u,v,cost))
        var tmp = edges.sorted(by: {$0.cost > $1.cost})
        
        while comp>1 && !tmp.isEmpty{
            let edge = tmp.removeLast()
            union(a: edge.u, b: edge.v, cost: edge.cost)
        }
        ans.append(totalCost)
    }
    
    var res = ans[0]
    for i in 1..<M{
        res ^= ans[i]
    }
    print(res)
}