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

func root(of node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, num:Int ,cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A == B{
        tmp.append((num,a,b,cost))
        return
    }
    
    arr[B] = A
    ans.append("\(num)")
    cnt -= 1
}

let N = fio.readInt()
let M = fio.readInt()

var tmp = [(num:Int, u:Int, v:Int, c:Int)]()
var edges = [(num:Int, u:Int, v:Int, c:Int)]()
var arr = Array(repeating: -1, count: N)
var ans = [String]()
var cnt = N

for num in 0..<M{
    let u = fio.readInt()-1
    let v = fio.readInt()-1
    let c = fio.readInt()
    
    edges.append((num+1,u,v,c))
}

if M<N || N==1{
    print("NO")
}else{
    var q = edges.sorted(by: {$0.c > $1.c})
    
    while cnt > 1{
        let edge = q.removeLast()
        union(a: edge.u, b: edge.v, num: edge.num, cost: edge.c)
    }
    
    let edge: (num:Int, u:Int, v:Int, c:Int)
    if tmp.isEmpty{
        edge = q.last!
    }else{
        edge = tmp.last!
    }
    
    arr = Array(repeating: -1, count: N)
    ans = [String]()
    cnt = N
    union(a: edge.u, b: edge.v, num: edge.num, cost: edge.c)
    
    q = edges.sorted(by: {$0.c > $1.c})
    while cnt > 1{
        let edge = q.removeLast()
        union(a: edge.u, b: edge.v, num: edge.num, cost: edge.c)
    }
    
    print("YES")
    print(ans.joined(separator: " "))
}