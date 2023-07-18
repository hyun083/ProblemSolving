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

let fio = FileIO()
while true{
    let M = fio.readInt()
    let N = fio.readInt()
    
    if M+N == 0{ break }
    
    var edges = [(u:Int, v:Int, cost:Int)]()
    var arr = Array(repeating: -1, count: M)
    var ans = 0
    
    func root(of node:Int) -> Int{
        if arr[node] < 0{
            return node
        }
        
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, cost:Int){
        let rootOfA = root(of: a)
        let rootOfB = root(of: b)
        
        if rootOfA == rootOfB { return }
        
        arr[rootOfB] = rootOfA
        ans -= cost
    }
    
    for _ in 0..<N{
        let U = fio.readInt()
        let V = fio.readInt()
        let C = fio.readInt()
        
        ans += C
        edges.append((U,V,C))
    }
    
    edges.sort(by: {$0.cost < $1.cost})
    
    for edge in edges {
        let u = edge.u
        let v = edge.v
        let c = edge.cost
        
        union(a: u, b: v, cost: c)
    }
    print(ans)
}