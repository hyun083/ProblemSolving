import Foundation

//by Rhyno
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)]
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
                || now == 32 { now = read() }
        if now == 45 { isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        return sum * (isPositive ? 1:-1)
    }
}

let fio = FileIO()
let N = fio.readInt()
let M = fio.readInt()
let R = fio.readInt()

var arr = Array(repeating: Array(repeating: Int(), count: M), count: N)
for i in 0..<N{
    for k in 0..<M{
        arr[i][k] = fio.readInt()
    }
}

func rotate(){
    let cnt = min(N, M)/2
    
    for idx in 0..<cnt{
        var res = [Int]()
        
        let maxN = N-idx-1
        let maxM = M-idx-1
        
        for i in idx..<maxM{
            res.append(arr[idx][i])
        }
        
        for i in idx..<maxN{
            res.append(arr[i][maxM])
        }
        
        for i in (idx..<maxM).reversed(){
            res.append(arr[maxN][i+1])
        }
        
        for i in (idx..<maxN).reversed(){
            res.append(arr[i+1][idx])
        }
        
        let length = res.count
        res = Array(res[R%length..<length] + res[0..<R%length])
        var k = 0
        
        for i in idx..<maxM{
            arr[idx][i] = res[k]
            k += 1
        }
        
        for i in idx..<maxN{
            arr[i][maxM] = res[k]
            k += 1
        }
        
        for i in (idx..<maxM).reversed(){
            arr[maxN][i+1] = res[k]
            k += 1
        }
        
        for i in (idx..<maxN).reversed(){
            arr[i+1][idx] = res[k]
            k += 1
        }
    }
    
}
rotate()

for i in 0..<N{
    for k in 0..<M{
        print(arr[i][k],terminator: k==M-1 ? "\n":" ")
    }
}