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

var io = FileIO()
let N = io.readInt()
var points = [(Int,Int)]()
var ans = 0

func isRightTriangle(a:(Int,Int),b:(Int,Int),c:(Int,Int)) -> Bool{
    let AB = ((a.0-b.0)*(a.0-b.0)) + ((a.1-b.1)*(a.1-b.1))
    let AC = ((a.0-c.0)*(a.0-c.0)) + ((a.1-c.1)*(a.1-c.1))
    let BC = ((b.0-c.0)*(b.0-c.0)) + ((b.1-c.1)*(b.1-c.1))
    
    let res = (AB==AC+BC) || (AC == AB+BC) || (BC==AB+AC)
    
    return res ? true:false
}

for _ in 0..<N{
    let point = [io.readInt(), io.readInt()]
    points.append((point[0],point[1]))
}

for a in 0..<N-2{
    for b in a+1..<N-1{
        for c in b+1..<N{
            if isRightTriangle(a: points[a], b: points[b], c: points[c]){ ans += 1 }
        }
    }
}
print(ans)