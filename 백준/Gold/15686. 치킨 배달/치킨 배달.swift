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

let n = fio.readInt()
let m = fio.readInt()
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
var house = [[Int]]()
var chicken = [[Int]]()
var ans = Int.max

for i in 0..<n{
    for k in 0..<n{
        map[i][k] = fio.readInt()
        if map[i][k] == 1{
            house.append([i,k])
        }
        if map[i][k] == 2{
            chicken.append([i,k])
        }
    }
}

var temp = [[Int]]()
var visited = Array(repeating: false, count: chicken.count)

func btk(cnt:Int, idx:Int){
    if cnt == m{
        var result = 0
        for house in house {
            var distance = Int.max
            for temp in temp{
                distance = min(distance, abs(house[0]-temp[0])+abs(house[1]-temp[1]))
            }
            result += distance
        }
        ans = min(ans, result)
    }
    for i in idx..<chicken.count{
        if !visited[i]{
            visited[i] = true
            temp.append(chicken[i])
            btk(cnt: cnt+1, idx: i)
            temp.removeLast()
            visited[i] = false
        }
    }
}
btk(cnt: 0, idx: 0)
print(ans)