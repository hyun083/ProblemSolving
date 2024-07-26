import Foundation

var cnt = 1
while let line = readLine(){
    let NM = line.split(separator: " ").map{Int($0)!}
    let N = NM[0]
    let M = NM[1]
    var comp = N
    if N+M == 0{ break }
    var arr = Array(repeating: -1, count: N)
    func rootOf(node:Int) -> Int{
        if arr[node] < 0 {return node}
        arr[node] = rootOf(node: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int){
        let ra = rootOf(node: a)
        let rb = rootOf(node: b)
        
        if ra == rb { return }
        arr[rb] = ra
        comp -= 1
    }
    
    for _ in 0..<M{
        let UV = readLine()!.split(separator: " ").map{Int($0)!-1}
        let U = UV[0]
        let V = UV[1]
        
        union(a: U, b: V)
    }
    print("Case \(cnt): \(comp)")
    cnt += 1
}