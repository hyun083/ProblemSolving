import Foundation

//by Rhyno
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
struct Edge:Comparable{
    let a:Int
    let b:Int
    let c:Int
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.c < rhs.c
    }
}
var fio = FileIO()
let n = fio.readInt()
let m = fio.readInt()
var arr = [Int](0..<n)
var edges = [Edge]()

func root(Of n:Int)->Int{
    if arr[n] == n {return n}
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let ra = root(Of: a)
    let rb = root(Of: b)
    if ra <= rb{
        arr[rb] = ra
    }else{
        arr[ra] = rb
    }
}
for _ in 0..<m{
    let a = fio.readInt()-1
    let b = fio.readInt()-1
    let c = fio.readInt()
    edges.append(Edge(a: a, b: b, c: c))
}
edges.sort(by: <)
var cnt = 0
var mst = 0
for edge in edges {
    if cnt == n-2{
        break
    }
    let ra = root(Of: edge.a)
    let rb = root(Of: edge.b)
    let c = edge.c
    if ra != rb{
        cnt += 1
        union(a: edge.a, b: edge.b)
        mst += c
    }
}
print(mst)