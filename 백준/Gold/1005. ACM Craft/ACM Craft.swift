import Foundation

//FileIO by Rhyno
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

let T = fio.readInt()
for _ in 0..<T{
    
    let N = fio.readInt()
    let K = fio.readInt()
    var time = [Int]()
    for _ in 0..<N{
        time.append(fio.readInt())
    }
    var income = Array(repeating: 0, count: N)
    var map = Array(repeating: [Int](), count: N)
    var result = Array(repeating: 0, count: N)
    var queue = [Int]()
    for _ in 0..<K{
        let u = fio.readInt()-1
        let v = fio.readInt()-1
        income[v] += 1
        map[u].append(v)
    }
    for i in 0..<N{
        result[i] = time[i]
        if income[i] == 0{
            queue.append(i)
            income[i] = -1
        }
    }
    while !queue.isEmpty{
        let u = queue.removeLast()
        for v in map[u]{
            income[v] -= 1
            result[v] = max(result[v], result[u]+time[v])
        }
        for i in 0..<N{
            if income[i] == 0{
                queue.append(i)
                income[i] = -1
            }
        }
    }
    let w = fio.readInt() - 1
    print(result[w])
}