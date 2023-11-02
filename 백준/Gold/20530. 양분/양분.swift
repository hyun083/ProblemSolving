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

let file = FileIO()
let N = file.readInt()
let Q = file.readInt()

var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int)]()
var indegree = Array(repeating: 0, count: N)
var map = Array(repeating: [Int](), count: N)

func root(of node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    if indegree[a]>1 && indegree[b]>1 { return }
    
    arr[B]=A
}

func findLoop(){
    var visited = Array(repeating: false, count: N)
    var q = [Int]()
    var idx = 0
    
    for i in 0..<N{
        if indegree[i] == 1{
            visited[i] = true
            q.append(i)
        }
    }
    
    while idx<q.count{
        let curr = q[idx]
        
        for next in map[curr]{
            indegree[next] -= 1
            if !visited[next] && indegree[next]==1{
                visited[next] = true
                q.append(next)
            }
        }
        idx += 1
    }
}

for _ in 0..<N{
    let u = file.readInt()-1
    let v = file.readInt()-1
    edges.append((u,v))
    
    indegree[u] += 1
    indegree[v] += 1
    map[u].append(v)
    map[v].append(u)
}

findLoop()

for edge in edges{
    union(a: edge.u, b: edge.v)
}

for _ in 0..<Q{
    let u = file.readInt()-1
    let v = file.readInt()-1
    print(root(of: u) == root(of: v) ? 1:2)
}