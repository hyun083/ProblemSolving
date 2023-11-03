import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    let M = Int(readLine()!)!
    var arr = Array(repeating: -1, count: N)
    var comp = N
    var hasCycle = false
    
    func root(of node:Int) -> Int{
        if arr[node]<0 {return node}
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int){
        let A = root(of: a)
        let B = root(of: b)
        
        if A == B {
            hasCycle = true
            return
        }
        
        arr[B] = A
        comp -= 1
    }
    
    for _ in 0..<M{
        let (u,v) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1)}[0]
        union(a: u, b: v)
    }
    
    print((comp==1)&&(!hasCycle) ? "tree":"graph")
}