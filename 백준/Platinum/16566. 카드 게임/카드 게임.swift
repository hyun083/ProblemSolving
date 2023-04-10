import Foundation

//fileIO by rhyno
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

var file = FileIO()
let n = file.readInt()
let m = file.readInt()
let k = file.readInt()

var arr = [Int]()
for _ in 0..<m{
    arr.append(file.readInt())
}
arr.sort(by: <)

var cards = [Int]()
for _ in 0..<k{
    cards.append(file.readInt())
}

var answers = ""
var idx = [Int](0..<m)
func root(Of n:Int)->Int{
    if idx[n]==n {return n}
    idx[n] = root(Of: idx[n])
    return idx[n]
}
func union(a:Int, b:Int){
    let rootOfA = root(Of: a)
    let rootOfB = root(Of: b)
    if rootOfA == rootOfB{
        return
    }
    idx[rootOfA] = rootOfB
}

for card in cards{
    var start = 0
    var end = arr.count-1
    var ans = 0
    while start <= end{
        let mid = (start+end)/2
        if arr[mid] > card{
            ans = mid
            end = mid-1
        }else{
            start = mid+1
        }
    }
    let temp = root(Of: ans)
    answers.append("\(arr[temp])\n")
    if temp < m-1{
        union(a: temp, b: temp+1)
    }
}
print(answers)