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
var fileIo = FileIO()

let t = fileIo.readInt()
var output = ""
for _ in 0..<t{
    let n = fileIo.readInt()
    let k = fileIo.readInt()
    var s = [Int]()
    for _ in 0..<n{
        s.append(fileIo.readInt())
    }
    s.sort(by: <)
    var left = 0
    var right = n-1
    var cnt = 0
    var m = 200000001
    while left < right{
        let temp = s[left]+s[right]
        if temp-k == 0{
            if m == temp-k{
                cnt += 1
            }else{
                m=0
                cnt = 1
            }
            left += 1
            right -= 1
        }
        if temp-k < 0{
            if m == k-temp{
                cnt += 1
            }else if m > k-temp{
                m = k-temp
                cnt = 1
            }
            left += 1
        }
        if temp-k > 0 {
            if m == temp-k{
                cnt += 1
            }else if m > temp-k{
                m = temp-k
                cnt = 1
            }
            right -= 1
        }
    }
    output.append("\(cnt)\n")
}
print(output)