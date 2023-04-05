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

let io = FileIO()
//let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = io.readInt()
let M = io.readInt()

var indegree = Array(repeating: 0, count: N)
var arr = Array(repeating: [Int](), count: N)
var edges = Set<[Int]>()

for _ in 0..<M{
//    let info = readLine()!.split(separator: " ").map{Int($0)!-1}
    let A = io.readInt()-1
    let B = io.readInt()-1
    edges.insert([B,A])
}

for edge in edges {
    let A = edge[0]
    let B = edge[1]
    
    arr[A].append(B)
    indegree[B] += 1
}

var q = [Int]()
for i in 0..<N{
    if indegree[i] == 0{
        q.append(i)
    }
}

var idx = 0
while idx < q.count{
    let curr = q[idx]
    
    for next in arr[curr]{
        indegree[next] -= 1
        if indegree[next] == 0{
            q.append(next)
        }
    }
    
    idx += 1
}
print(idx)
