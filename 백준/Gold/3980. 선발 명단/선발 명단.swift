import Foundation

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

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
let fio = FileIO()

for _ in 0..<fio.readInt(){
    var players = Array(repeating: [Int](), count: 11)
    var visited = Array(repeating: false, count: 11)
    var ans = 0
    
    for i in 0..<11{
        for _ in 0..<11{
            players[i].append(fio.readInt())
        }
    }
    
    func btk(cnt:Int, sum:Int){
        if cnt == 11{
            ans = max(ans, sum)
            return
        }
        for i in 0..<11{
            if !visited[i] && players[cnt][i] != 0{
                visited[i] = true
                btk(cnt: cnt+1, sum: sum+players[cnt][i])
                visited[i] = false
            }
        }
    }
    btk(cnt: 0, sum: 0)
    print(ans)
}