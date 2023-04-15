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
let T = io.readInt()
var ans = [String]()
for _ in 0..<T{
    let N = io.readInt()
    var tmp = Dictionary<Int,Set<Int>>()
    
    for _ in 0..<N{
        let x = io.readInt()
        let y = io.readInt()
        
        if tmp[x] == nil{
            tmp[x] = [y]
        }else{
            tmp[x]!.insert(y)
        }
    }
    
    var arr = [Set<Int>]()
    for y in tmp.values{
        arr.append(y)
    }
    
    var flag = true
    for i in 0..<arr.count-1{
        if arr[i] != arr[i+1]{
            flag = false
        }
    }
    ans.append(flag ? "BALANCED":"NOT BALANCED")
}
print(ans.joined(separator: "\n"))