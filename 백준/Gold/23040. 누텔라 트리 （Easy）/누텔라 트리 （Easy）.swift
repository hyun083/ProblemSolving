import Foundation

// by rhyno
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

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
}

let file = FileIO()
let N = file.readInt()
var ans = 0

var arr = Array(repeating: -1, count: N)
var map = Array(repeating: [Int](), count: N)
var visited = Array(repeating: false, count: N)

func root(of node:Int) -> Int{
    if arr[node] < 0 { return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int) {
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B {return}
    arr[A] += arr[B]
    arr[B] = A
}

for _ in 0..<N-1{
    let u = file.readInt()-1
    let v = file.readInt()-1

    map[u].append(v)
    map[v].append(u)
}

var colorOf = file.readString().map{String($0)}

func bfs(from vertex:Int) -> Int{
    var q = [vertex]
    var cnt = 0
    var idx = 0
    
    while idx < q.count{
        let curr = q[idx]
        for next in map[curr]{
            if colorOf[next] == "R" && !visited[next]{
                visited[next] = true
                union(a: curr, b: next)
                q.append(next)
            }else if colorOf[next] == "B"{
                cnt += 1
            }
        }
        idx += 1
    }
    
    return cnt * abs(arr[root(of: vertex)])
}

for i in 0..<N{
    if colorOf[i] == "R" && !visited[i]{
        visited[i] = true
        ans += bfs(from: i)
    }
}
print(ans)