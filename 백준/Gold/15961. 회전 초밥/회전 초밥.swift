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

let FIO = FileIO()
let N = FIO.readInt()
let D = FIO.readInt()
let K = FIO.readInt()
let C = FIO.readInt()
var arr = [Int]()
var left = 0
var right = 0
var tmp = Dictionary<Int,Int>()
var ans = 0
tmp[C] = 1

for _ in 0..<N{
    let num = FIO.readInt()
    arr.append(num)
}

while right < K{
    let num = arr[right]
    if tmp[num] == nil{
        tmp[num] = 1
    }else{
        tmp[num]! += 1
    }
    right += 1
}
ans = max(ans, tmp.keys.count)

for _ in 0..<N{
    let l = arr[left]
    let r = arr[right]
    tmp[l]! -= 1
    if tmp[r]==nil{
        tmp[r] = 1
    }else{
        tmp[r]! += 1
    }
    if tmp[l]! == 0{
        tmp.removeValue(forKey: l)
    }
    
    left += 1
    right += 1
    left %= N
    right %= N
    ans = max(ans, tmp.keys.count)
    if ans == K+1{ break }
}
print(ans)
