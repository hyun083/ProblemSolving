import Foundation

//by Rhyno
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

func dist(x1:Double, x2:Double, y1:Double, y2:Double) -> Double{
    return sqrt(((x1-x2)*(x1-x2))+((y1-y2)*(y1-y2)))
}

var fio = FileIO()
var output = ""

for _ in 0..<fio.readInt(){
    let n = fio.readInt()
    var arr = Array(repeating: -1, count: n)
    var map = [(x:Double,y:Double,r:Double)]()
    
    func root(of n:Int) -> Int{
        if arr[n]<0 {return n}
        arr[n] = root(of: arr[n])
        return arr[n]
    }
    
    func union(a:Int, b:Int){
        let rootOfA = root(of: a)
        let rootOfB = root(of: b)
        if rootOfA == rootOfB{ return }
        arr[rootOfB] = rootOfA
    }
    
    for i in 0..<n{
//        let info = readLine()!.split(separator: " ").map{Int($0)!}
        let x = Double(fio.readInt())
        let y = Double(fio.readInt())
        let r = Double(fio.readInt())
        map.append((x,y,r))
        
        for k in 0..<i{
            let target = map[k]
            if target.r + r >= dist(x1: target.x, x2: x, y1: target.y, y2: y){
                union(a: i, b: k)
            }
        }
    }
    var ans = 0
    for i in 0..<n{
        if arr[i]<0{
            ans += 1
        }
    }
    output += "\(ans)\n"
}
print(output)