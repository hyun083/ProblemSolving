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
let T = file.readInt()

for _ in 0..<T{
    
    func makeTree(from curr:Int){
        for next in arr[curr]{
            if depth[next] < 0{
                depth[next] = depth[curr]+1
                parent[0][next] = curr
                makeTree(from: next)
            }
        }
    }
    
    let N = file.readInt()
    
    var depth = Array(repeating: -1, count: N)
    var parent = Array(repeating: Array(repeating: -1, count: N), count: 16)
    var arr = Array(repeating: [Int](), count: N)
    var indegree = Array(repeating: 0, count: N)
    var root = -1
    
    for _ in 0..<N-1{
        let u = file.readInt()-1
        let v = file.readInt()-1
        
        arr[u].append(v)
        indegree[v] += 1
    }
    
    for i in 0..<N{
        if indegree[i]==0 {
            root = i
        }
    }
    depth[root] = 0
    makeTree(from: root)
    
    for level in 0..<15{
        for node in 1..<N{
            if parent[level][node] > -1{
                parent[level+1][node] = parent[level][parent[level][node]]
            }
        }
    }
    
    var U = file.readInt()-1
    var V = file.readInt()-1
    
    if depth[U] < depth[V] { swap(&U, &V)}
    
    var diff = depth[U] - depth[V]
    
    for level in stride(from: 0, to: diff, by: +1){
        if diff%2==1{ U = parent[level][U] }
        diff /= 2
    }
    
    if U != V{
        for level in stride(from: 15, through: 0, by: -1){
            if parent[level][U] > -1 && parent[level][U] != parent[level][V]{
                U = parent[level][U]
                V = parent[level][V]
            }
        }
        U = parent[0][U]
    }
    
    print(U+1)
}