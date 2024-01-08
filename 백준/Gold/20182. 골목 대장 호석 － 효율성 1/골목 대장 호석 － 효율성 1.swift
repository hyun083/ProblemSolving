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
let M = file.readInt()
let A = file.readInt()-1
let B = file.readInt()-1
let C = file.readInt()

var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
    let u = file.readInt()-1
    let v = file.readInt()-1
    let c = file.readInt()
    
    map[u].append((v,c))
    map[v].append((u,c))
}

var q = [(node:Int, cost:Int, shame:Int)]()
var dq = q
var minShame = Array(repeating: -1, count: N)
minShame[A] = 0
q.append((A,0,0))

while !q.isEmpty{
    dq = q.reversed()
    q.removeAll()
    
    for _ in 0..<dq.count{
        let curr = dq.removeLast()
        if curr.cost>C || minShame[curr.node]<curr.shame{ continue }
        if curr.node == B { break }
        
        for next in map[curr.node]{
            let nextShame = max(next.cost, curr.shame)
            if curr.cost+next.cost > C { continue }
            
            if minShame[next.node]<0 || minShame[next.node]>nextShame{
                minShame[next.node] = nextShame
                q.append((next.node, curr.cost+next.cost, nextShame))
            }
        }
    }
    q.sort(by: {$0.shame < $1.shame})
}
print(minShame[B])