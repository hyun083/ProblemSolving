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

let io = FileIO()

let N = io.readInt()
let M = io.readInt()

var tree = Array(repeating: 0, count: N*4)
var edges = [(u:Int,v:Int)]()
var ans = 0

for _ in 0..<M{
    let u = io.readInt()-1
    let v = io.readInt()-1
    edges.append((u,v))
}

edges.sort(by: { $0.u==$1.u ? $0.v<$1.v : $0.u<$1.u })

func update_tree(start:Int, end:Int, node:Int, idx:Int){
    if idx < start || end < idx{
        return
    }
    tree[node] += 1
    if start == end{
        return
    }
    
    let mid = (start+end)/2
    update_tree(start: start, end: mid, node: node*2, idx: idx)
    update_tree(start: mid+1, end: end, node: node*2+1, idx: idx)
}

func read_tree(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
    if end < from || to < start{
        return 0
    }
    if from <= start && end <= to{
        return tree[node]
    }
    
    let mid = (start+end)/2
    let left = read_tree(start: start, end: mid, node: node*2, from: from, to: to)
    let right = read_tree(start: mid+1, end: end, node: node*2+1, from: from, to: to)
    return left + right
}

for edge in edges {
    let v = edge.v
    ans += read_tree(start: 0, end: N-1, node: 1, from: v+1, to: N-1)
    update_tree(start: 0, end: N-1, node: 1, idx: v)
}
print(ans)