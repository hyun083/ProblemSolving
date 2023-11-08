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
}

let file = FileIO()
let N = file.readInt()
let Q = file.readInt()
var station = [(xmin:Int, xmax:Int, ymin:Int, ymax:Int, num:Int)]()
var arr = Array(repeating: -1, count: N)

func root(of node:Int) -> Int{
    if arr[node] < 0 {return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A == B { return }
    arr[B] = A
}

for num in 0..<N{
    let x1 = file.readInt()
    let y1 = file.readInt()
    let x2 = file.readInt()
    let y2 = file.readInt()
    
    station.append((min(x1, x2), max(x1, x2), min(y1, y2), max(y1, y2), num))
}

var xq = station.sorted(by: {$0.xmin < $1.xmin})
var yq = station.sorted(by: {$0.ymin < $1.ymax})

var p = xq[0].num
var end = xq[0].xmax

for idx in 1..<N{
    let nextStation = xq[idx]
    if nextStation.xmin <= end{
        end = max(end, nextStation.xmax)
        union(a: p, b: nextStation.num)
    }else{
        p = root(of: nextStation.num)
        end = nextStation.xmax
    }
}

p = yq[0].num
end = yq[0].ymax

for idx in 1..<N{
    let nextStation = yq[idx]
    if nextStation.ymin <= end{
        end = max(end, nextStation.ymax)
        union(a: p, b: nextStation.num)
    }else{
        p = root(of: nextStation.num)
        end = nextStation.ymax
    }
}

for _ in 0..<Q{
    let u = file.readInt()-1
    let v = file.readInt()-1
    print(root(of: u) == root(of: v) ? 1:0)
}