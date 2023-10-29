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

let file = FileIO()
var T = 1
while true{
    let N = file.readInt()
    if N == 0 { break }
    
    var arr = Array(repeating: -1, count: N)
    var people = Dictionary<String,Int>()
    var comp = N
    
    func root(of node:Int) -> Int{
        if arr[node] < 0 { return node }
        arr[node] = root(of: arr[node])
        return arr[node]
    }

    func union(a:Int, b:Int){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B{ return }
        arr[A] = B
        comp -= 1
    }
    
    for _ in 0..<N{
        let u = file.readString()
        let v = file.readString()
        if people[u] == nil{ people[u] = people.count }
        if people[v] == nil{ people[v] = people.count }
        
        let a = people[u]!
        let b = people[v]!
        
        union(a: a, b: b)
    }
    print(T, comp)
    T += 1
}