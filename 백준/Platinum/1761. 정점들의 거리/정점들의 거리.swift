import Foundation

//by rhyno
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

func makeTree(from curr:Int){
    for next in arr[curr]{
        if depth[next.node] == -1{
            parent[0][next.node] = curr
            depth[next.node] = depth[curr] + 1
            makeTree(from: next.node)
        }
    }
}

func makeCost(from root:Int, c:Int){
    var visited = Array(repeating: false, count: N)
    var q = [(node:Int, cost:Int)]()
    var idx = 0
    
    visited[root] = true
    cost[root] = 0
    
    for next in arr[root]{
        q.append((next.node, next.cost))
        visited[next.node] = true
        cost[next.node] = next.cost
    }
    
    while idx<q.count{
        let curr = q[idx]
        
        for next in arr[curr.node]{
            if !visited[next.node]{
                visited[next.node] = true
                cost[next.node] = curr.cost + next.cost
                q.append((next.node, cost[next.node]))
            }
        }
        idx += 1
    }
}

let file = FileIO()

let N = file.readInt()
var arr = Array(repeating: [(node:Int,cost:Int)](), count: N)
var parent = Array(repeating: Array(repeating: -1, count: N), count: 18)
var depth = Array(repeating: -1, count: N)
var cost = Array(repeating: 0, count: N)

for _ in 0..<N-1{
    let u = file.readInt()-1
    let v = file.readInt()-1
    let cost = file.readInt()
    
    arr[u].append((v,cost))
    arr[v].append((u,cost))
}

depth[0] = 0
cost[0] = 0

makeTree(from: 0)
makeCost(from: 0, c: 0)

for level in 0..<18-1{
    for node in 1..<N{
        if parent[level][node] != -1{
            parent[level+1][node] = parent[level][parent[level][node]]
        }
    }
}

let M = file.readInt()
for _ in 0..<M{
    var u = file.readInt()-1
    var v = file.readInt()-1
    
    let U = u
    let V = v
    
    if depth[u] < depth[v] {swap(&u, &v)}
    var diff = depth[u]-depth[v]
    
    for level in stride(from: 0, to: diff, by: +1){
        if diff%2 == 1{ u = parent[level][u]}
        diff /= 2
    }
    
    if u != v{
        for level in stride(from: 17, through: 0, by: -1){
            if parent[level][u] != -1 && parent[level][u] != parent[level][v]{
                u = parent[level][u]
                v = parent[level][v]
            }
        }
        u = parent[0][u]
    }
    print(cost[U]-cost[u] + cost[V]-cost[u])
}