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
let H = file.readInt()

var bottom = Array(repeating: 0, count: H)
var up = Array(repeating: 0, count: H)
var ans = Array(repeating: 0, count: H)
var value = Int.max
var cnt = 0

for _ in 0..<N/2{
    let b = file.readInt()-1
    let u = file.readInt()-1
    bottom[b] += 1
    up[H-u-1] += 1
}

for i in 0..<H-1{
    up[i+1] += up[i]
    bottom[H-i-2] += bottom[H-i-1]
}

for i in 0..<H{
    ans[i] += bottom[i] + up[i]
    if ans[i] < value{
        value = ans[i]
        cnt = 1
    }else if ans[i] == value{
        cnt += 1
    }
}
print(value, cnt)