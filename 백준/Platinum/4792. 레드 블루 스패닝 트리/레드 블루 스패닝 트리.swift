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

while true{
    let N = file.readInt()
    let M = file.readInt()
    let K = file.readInt()
    
    if N+M+K == 0{ break }
    
    var arr = Array(repeating: -1, count: N)
    var comp = N
    var ans = 0
    var edges = [(u:Int, v:Int, color:String)]()
    
    func root(of node:Int) -> Int{
        if arr[node] < 0 {
            return node
        }
        
        arr[node] = root(of: arr[node])
        return arr[node]
    }
    
    func union(a:Int, b:Int, color:String){
        let A = root(of: a)
        let B = root(of: b)
        
        if A==B { return }
        arr[B] = A
        comp -= 1
        ans += color=="B" ? 1:0
    }
    
    for _ in 0..<M{
        let c = file.readString()
        let u = file.readInt()-1
        let v = file.readInt()-1
        edges.append((u,v,c))
    }
    var blueEdges = edges.sorted(by: {$0.color > $1.color})
    var redEdges = edges.sorted(by: {$0.color < $1.color})
    
    while comp>1 && !blueEdges.isEmpty{
        let edge = blueEdges.removeLast()
        
        union(a: edge.u, b: edge.v, color: edge.color)
    }
    let myMax = ans
    
    ans = 0
    arr = Array(repeating: -1, count: N)
    comp = N
    
    while comp>1 && !redEdges.isEmpty{
        let edge = redEdges.removeLast()
        
        union(a: edge.u, b: edge.v, color: edge.color)
    }
    let myMin = ans
    
    print(myMin<=K&&K<=myMax ? 1:0)
}