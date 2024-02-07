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

let N = fio.readInt()
var stk = [Int]()

for _ in 0..<N{
    let cmd = fio.readInt()
    if cmd == 1{
        let X = fio.readInt()
        stk.append(X)
    }else if cmd==2{
        if stk.isEmpty{
            print(-1)
        }else{
            print(stk.removeLast())
        }
    }else if cmd==3{
        print(stk.count)
    }else if cmd==4{
        print(stk.isEmpty ? 1:0)
    }else{
        print(stk.isEmpty ? -1:stk.last!)
    }
}