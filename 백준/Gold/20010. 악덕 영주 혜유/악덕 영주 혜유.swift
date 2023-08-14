import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

func root(of node:Int) -> Int{
    if arr[node]<0{
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
    sum += cost
    cnt -= 1
    map[a].append((b,cost))
    map[b].append((a,cost))
}
let fio = FileIO()

let N = fio.readInt()
let M = fio.readInt()

var arr = Array(repeating: -1, count: N)
var cnt = N
var sum = 0

var maxEdge = 0
var edges = [(u:Int, v:Int, cost:Int)]()
var idx = 0
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
    
    let u = fio.readInt()
    let v = fio.readInt()
    let c = fio.readInt()
    
    edges.append((u,v,c))
}
edges.sort(by: {$0.cost < $1.cost})

while cnt>1 && idx<edges.count{
    let edge = edges[idx]
    
    union(a: edge.u, b: edge.v, cost: edge.cost)
    idx += 1
}
print(sum)

func bfs(from node:Int) -> Int{
    var visited = Array(repeating: false, count: N)
    var q = [(node:Int, cost:Int)]()
    
    visited[node] = true
    q.append((node,0))
    var idx = 0
    var res = -1
    
    while idx < q.count{
        let curr = q[idx]
        res = max(res, curr.cost)
        
        for next in map[curr.node]{
            if !visited[next.node]{
                visited[next.node] = true
                q.append((next.node, curr.cost + next.cost))
            }
        }
        
        idx += 1
    }
    
    return res
}

for i in 0..<N{
    maxEdge = max(maxEdge, bfs(from: i))
}
print(maxEdge)