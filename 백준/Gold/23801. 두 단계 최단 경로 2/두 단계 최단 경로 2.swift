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

var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
for _ in 0..<M{
    let u = file.readInt()-1
    let v = file.readInt()-1
    let w = file.readInt()

    map[u].append((v,w))
    map[v].append((u,w))
}

func dijk(from root:Int) -> [Int]{
    var q = [(node:Int, cost:Int)]()
    var dq = q
    var minCost = Array(repeating: -1, count: N)
    
    minCost[root] = 0
    q.append((root,0))
    
    while !q.isEmpty{
        dq = q.reversed()
        q.removeAll()
        for _ in 0..<dq.count{
            let curr = dq.removeLast()
            if curr.cost > minCost[curr.node]{ continue }
            
            for next in map[curr.node]{
                let newCost = minCost[curr.node] + next.cost
                
                if minCost[next.node]<0 || minCost[next.node]>newCost{
                    minCost[next.node] = newCost
                    q.append((next.node, newCost))
                }
            }
        }
        q.sort(by: {$0.cost < $1.cost})
    }
    
    return minCost
}

let X = file.readInt()-1
let Z = file.readInt()-1
let P = file.readInt()
var arr = [Int]()
var ans = -1

for _ in 0..<P{
    arr.append(file.readInt()-1)
}

let costFromXto = dijk(from: X)
let costFromZto = dijk(from: Z)

for p in arr{
    if costFromXto[p]<0 || costFromZto[p]<0 { continue }
    if ans<0 || ans>costFromXto[p] + costFromZto[p]{
        ans = costFromXto[p] + costFromZto[p]
    }
}
print(ans)