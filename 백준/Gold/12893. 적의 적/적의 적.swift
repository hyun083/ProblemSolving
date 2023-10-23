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

var enemy = Array(repeating: -1, count: N)
var arr = Array(repeating: -1, count: N)
var ans = 1

func root(of node:Int)->Int{
    if arr[node]<0 {return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int,b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB{
        return
    }
    arr[rootA] = rootB
}

var edges = [(u:Int, v:Int)]()
for _ in 0..<M{
    let u = file.readInt()-1
    let v = file.readInt()-1
    edges.append((u, v))
}

for edge in edges{
    let A = root(of: edge.u)
    let B = root(of: edge.v)
    
    if A == B {
        ans = 0
        break
    }
    
    if enemy[A]<0{
        enemy[A] = B
    }else{
        union(a: enemy[A], b: edge.v)
    }
    
    if enemy[B]<0{
        enemy[B] = A
    }else{
        union(a: enemy[B], b: edge.u)
    }
}

print(ans)