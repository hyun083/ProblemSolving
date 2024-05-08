import Foundation

var tc = 1
while let line = readLine(){
    let (N,M) = [line.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
    if N+M == 0{ break }
    
    var numOf = Dictionary<String,Int>()
    var edges = [(u:Int, v:Int, c:Int)]()
    
    for _ in 0..<M{
        let (U,V,C) = [readLine()!.split(separator: " ").map{String($0)}].map{($0[0], $0[1], Int($0[2]))}[0]
        if numOf[U] == nil{
            numOf[U] = numOf.count
        }
        if numOf[V] == nil{
            numOf[V] = numOf.count
        }
        edges.append((numOf[U]!,numOf[V]!,C!))
    }
    let (dep,des) = [readLine()!.split(separator: " ").map{String($0)}].map{($0[0], $0[1])}[0]
    
    var arr = Array(repeating: -1, count: N)
    var comp = N
    var ans = 10000
    
    func rootOf(node:Int) -> Int{
        if arr[node]<0 { return node }
        arr[node] = rootOf(node: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, c:Int){
        let ra = rootOf(node: a)
        let rb = rootOf(node: b)
        
        if ra==rb { return }
        arr[rb] = ra
        comp -= 1
        ans = min(ans, c)
    }
    edges.sort(by: {$0.c < $1.c})
    
    let DEP = numOf[dep]!
    let DES = numOf[des]!
    while comp>1 && rootOf(node: DEP) != rootOf(node: DES){
        let edge = edges.removeLast()
        union(a: edge.u, b: edge.v, c: edge.c)
    }
    
    print("Scenario #\(tc)")
    print(ans,"tons")
    print()
    tc += 1
}