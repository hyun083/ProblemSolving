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

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
let fio = FileIO()

let n = fio.readInt()
let m = fio.readInt()
var map = Array(repeating: [Int](), count: n)

for _ in 0..<m{
    let v = fio.readInt() - 1
    let u = fio.readInt() - 1
    map[u].append(v)
}

var cnt = 1
func bfs(from a:Int) -> Int{
    var visited = Array(repeating: false, count: n)
    var q = [a]
    var idx = 0
    visited[a] = true
    while idx < q.count{
        let curr = q[idx]
        for next in map[curr]{
            if !visited[next]{
                visited[next] = true
                q.append(next)
            }
        }
        idx += 1
    }
    return idx
}

var myMax = 0
var output = [String]()
for u in 0..<n{
    let cnt = bfs(from: u)
    if myMax < cnt{
        myMax = cnt
        output = ["\(u+1)"]
    }else if myMax == cnt{
        output.append("\(u+1)")
    }
}
print(output.joined(separator: " "))