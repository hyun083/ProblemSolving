import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    var num = readLine()!.split(separator: " ").map{Int($0)!-1}
    var arr = Array(repeating: -1, count: N)
    var cnt = N
    
    func root(of node:Int) -> Int{
        if arr[node]<0 { return node }
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B { return }
        arr[B] = A
        cnt -= 1
    }
    
    for u in 0..<N{
        union(a: u, b: num[u])
    }
    print(cnt)
}