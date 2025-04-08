import Foundation

let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

for _ in 0..<M{
    let UV = readLine()!.split(separator: " ").map {Int($0)!-1}
    let U = UV[0]
    let V = UV[1]
    map[U].append(V)
    map[V].append(U)
}

func bfs(from root:Int){
    var q = [root]
    var idx = 0
    
    while idx < q.count{
        let curr = q[idx]
        
        for next in map[curr]{
            if !visited[next]{
                visited[next] = true
                q.append(next)
            }
        }
        idx+=1
    }
}

visited[0] = true
bfs(from: 0)
var cnt = 0

for i in 0..<N{
    if !visited[i]{
        print(i+1)
        cnt += 1
    }
}
if cnt == 0{
    print(0)
}