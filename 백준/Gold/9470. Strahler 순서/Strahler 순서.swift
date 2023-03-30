import Foundation

//fileIO by Rhyno
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

for _ in 0..<io.readInt(){
    let K = io.readInt()
    let M = io.readInt()
    let P = io.readInt()
    
    var income = Array(repeating: 0, count: M)
    var strahler = Array(repeating: [0:0], count: M)
    var arr = Array(repeating: [Int](), count: M)
    
    var q = [(Int,Int)]()
    
    for _ in 0..<P{
        let u = io.readInt() - 1
        let v = io.readInt() - 1
        income[v] += 1
        arr[u].append(v)
    }
    
    for i in 0..<M{
        if income[i] == 0{
            strahler[i][1] = 1
            q.append((i,1))
        }
    }
    
    var idx = 0
    while idx < q.count{
        let currNum = q[idx].0
        let currOrder = q[idx].1
        
        for next in arr[currNum]{
            if strahler[next][currOrder] == nil{
                strahler[next][currOrder] = 1
            }else{
                strahler[next][currOrder]! += 1
            }
            
            income[next] -= 1
            
            if income[next] == 0{
                let nextOrder = strahler[next].keys.max()!
                if strahler[next][nextOrder]! > 1{
                    q.append((next,nextOrder+1))
                }else{
                    q.append((next,nextOrder))
                }
            }
        }
        
        idx += 1
    }
    let strahlerOrder = strahler[M-1].keys.max()!
    if strahler[M-1][strahlerOrder]! > 1{
        print(K, strahlerOrder+1)
    }else{
        print(K, strahlerOrder)
    }
}