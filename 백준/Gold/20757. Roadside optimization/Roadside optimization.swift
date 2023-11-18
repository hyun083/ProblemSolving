import Foundation

let T = Int(readLine()!)!

for _ in 0..<T{
    let N = Int(readLine()!)!
    var arr = Array(repeating: -1, count: N)
    var ans = 0
    
    func root(of node:Int) -> Int{
        if arr[node]<0 {return node}
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B {return}
        arr[B] = A
        ans += 1
    }
    
    for i in 0..<N{
        let info = readLine()!.split(separator: " ").map{Int($0)!}
        for k in i+1..<N{
            if info[k] == 1{
                union(a: i, b: k)
            }
        }
    }
    print(ans)
}