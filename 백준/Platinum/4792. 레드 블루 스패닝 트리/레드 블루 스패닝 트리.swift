import Foundation

while let input = readLine(){
    let (N,M,K) = [input.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
    if N+M+K == 0{ break }
    
    var arr = Array(repeating: -1, count: N)
    var comp = N
    var ans = 0
    var edges = [(u:Int, v:Int, color:String)]()
    
    func root(of node:Int) -> Int{
        if arr[node] < 0 {
            return node
        }
        
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, color:String){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B { return }
        arr[B] = A
        comp -= 1
        ans += color=="B" ? 1:0
    }
    
    for _ in 0..<M{
        let (c,u,v) = [readLine()!.split(separator: " ").map{String($0)}].map{($0[0], Int($0[1])!-1, Int($0[2])!-1)}[0]
        edges.append((u,v,c))
    }
    var blueEdges = edges.sorted(by: {$0.color > $1.color})
    var redEdges = edges.sorted(by: {$0.color < $1.color})
    
    while comp>1 && !blueEdges.isEmpty{
        let edge = blueEdges.removeLast()
        
        union(a: edge.u, b: edge.v, color: edge.color)
    }
    let myMax = ans
    
    ans = 0
    arr = Array(repeating: -1, count: N)
    comp = N
    
    while comp>1 && !redEdges.isEmpty{
        let edge = redEdges.removeLast()
        
        union(a: edge.u, b: edge.v, color: edge.color)
    }
    let myMin = ans
    
//    print(ans==K&&comp==1 ? 1:0)
    print(myMin<=K&&K<=myMax ? 1:0)
}