import Foundation

let N = Int(readLine()!)!

func distance(a:(x:Double, y:Double), b:(x:Double, y:Double)) -> Double{
    return sqrt(pow(a.x-b.x, 2) + pow(a.y-b.y, 2))
}

for _ in 0..<N{
    let (S,P) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    var arr = Array(repeating: -1, count: P)
    var outposts = [(x:Double,y:Double)]()
    var edges = [(u:Int, v:Int, cost:Double)]()
    var tmp = [(u:Int, v:Int, cost:Double)]()
    var comp = P
    var ans:Double = 0
    var indegree:[Double] = Array(repeating: 0, count: P)
    var hasSatellite = Array(repeating: false, count: P)
    
    func root(of node:Int) -> Int{
        if arr[node]<0 {return node}
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, cost:Double){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B { return }
        tmp.append((a,b,cost))
        indegree[a] += cost
        indegree[b] += cost
        arr[B] = A
        comp -= 1
    }
    
    for _ in 0..<P{
        let (x,y) = [readLine()!.split(separator: " ").map{Double($0)!}].map{($0[0], $0[1])}[0]
        outposts.append((x,y))
    }
    
    for i in 0..<P-1{
        for k in i+1..<P{
            let cost = distance(a: outposts[i], b: outposts[k])
            edges.append((i,k,cost))
        }
    }
    edges.sort(by: {$0.cost > $1.cost})
    
    while comp>1 && !edges.isEmpty{
        let edge = edges.removeLast()
        union(a: edge.u, b: edge.v, cost: edge.cost)
    }
    
    for _ in 0..<S-1{
        tmp.removeLast()
    }
    ans = tmp.last!.cost
    
    print(String(format: "%.2f", ans))
}