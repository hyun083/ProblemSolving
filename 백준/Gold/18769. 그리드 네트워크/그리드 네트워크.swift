import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let (R,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    var arr = Array(repeating: -1, count: R*C)
    var edges = [(u:Int, v:Int, cost:Int)]()
    var totalCost = 0
    var node = 0
    var comp = R*C
    
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
        
        if A==B{return}
        arr[B] = A
        comp -= 1
        totalCost += cost
    }
    
    for _ in 0..<R{
        let info = readLine()!.split(separator: " ").map{Int($0)!}
        for cost in info{
            edges.append((node,node+1,cost))
            node += 1
        }
        node+=1
    }
    
    node = 0
    for _ in 0..<R-1{
        let info = readLine()!.split(separator: " ").map{Int($0)!}
        for cost in info{
            edges.append((node, node+C, cost))
            node += 1
        }
    }

    edges.sort(by: {$0.cost > $1.cost})
    
    while comp>1 && !edges.isEmpty{
        let edge = edges.removeLast()
        union(a: edge.u, b: edge.v, cost: edge.cost)
    }
    
    print(totalCost)
}