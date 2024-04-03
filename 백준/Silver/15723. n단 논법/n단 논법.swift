import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: [Int](), count: 26)

for _ in 0..<N{
    let (u,v) = [readLine()!.split(separator: " ").map{String($0)}].map{(Character($0[0]), Character($0[2]))}[0]
    let U = Int(u.asciiValue!)-97
    let V = Int(v.asciiValue!)-97
    map[U].append(V)
}

func bfs(from a:Int, to b:Int)-> Bool{
    var visited = Array(repeating: false, count: 26)
    var q = [Int]()
    var idx = 0
    
    q.append(a)
    visited[a] = true
    
    while idx<q.count{
        let curr = q[idx]
        if curr == b { return true }
        
        for next in map[curr]{
            if visited[next]{ continue }
            visited[next] = true
            q.append(next)
        }
        
        idx += 1
    }
    return false
}

let M = Int(readLine()!)!
for _ in 0..<M{
    let (u,v) = [readLine()!.split(separator: " ").map{String($0)}].map{(Character($0[0]), Character($0[2]))}[0]
    let U = Int(u.asciiValue!)-97
    let V = Int(v.asciiValue!)-97
    print(bfs(from: U, to: V) ? "T":"F")
}
