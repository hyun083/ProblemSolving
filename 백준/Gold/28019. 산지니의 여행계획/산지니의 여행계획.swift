import Foundation

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

let N = file.readInt()
let M = file.readInt()
var arr = Array(repeating: -1, count: N)
var edges = [(u:Int, v:Int, cost:Int)]()
var comp = N
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
var visited = Array(repeating: false, count: N)
var totalCost = 0

func rootOf(node:Int) -> Int{
    if arr[node]<0 { return node }
    arr[node] = rootOf(node: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int) {
    let ra = rootOf(node: a)
    let rb = rootOf(node: b)
    
    if ra == rb { return }
    arr[ra] = rb
    map[a].append((b,cost))
    map[b].append((a,cost))
    totalCost += cost
    comp -= 1
}

var MAXCOST = 0
func dfs(from node:Int, currCost:Int){
    for next in map[node]{
        if !visited[next.node]{
            visited[next.node] = true
            MAXCOST = max(MAXCOST, currCost+next.cost)
            dfs(from: next.node, currCost: currCost+next.cost)
        }
    }
}

for _ in 0..<M{
    let u = file.readInt()-1
    let v = file.readInt()-1
    let c = file.readInt()
    edges.append((u,v,c))
}
edges.sort(by: {$0.cost < $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}

let dep = file.readInt()-1
visited[dep] = true

dfs(from: dep, currCost: 0)
print(totalCost*2-MAXCOST)