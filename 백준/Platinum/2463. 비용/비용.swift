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

var edges = [(u:Int, v:Int, cost:Int)]()
var arr = Array(repeating: -1, count: N)
var comp = N
var currCost = 0
var ans = 0

func root(of node:Int) -> Int{
    if arr[node] < 0{ return node }
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B { return }
    ans += cost*((-1*arr[A])*(-1*arr[B]))
    arr[A] += arr[B]
    arr[B] = A
    comp -= 1
    
}

for _ in 0..<M{
    let u = file.readInt()-1
    let v = file.readInt()-1
    let cost = file.readInt()
    currCost += cost
    
    edges.append((u,v,cost))
}

edges.sort(by: {$0.cost < $1.cost})

while comp>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    
    union(a: edge.u, b: edge.v, cost: currCost)
    currCost -= edge.cost
}
print(ans%1000000000)