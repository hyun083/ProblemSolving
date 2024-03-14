
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
}

let fio = FileIO()
let T = fio.readInt()
var output = [String]()

for _ in 0..<T{
    let N = fio.readInt()
    let S = fio.readInt()
    var seat = [Int]()
    
    for _ in 0..<N{
        seat.append(fio.readInt())
    }
    seat.sort(by: <)
//    let (N,S) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1])}[0]
//    var seat = readLine()!.split(separator: " ").map{Int($0)!}.sorted(by: <)
    
    var lo = 1
    var hi = seat.last!
    var ans = 0
    
    while lo<=hi{
        let mid = (lo+hi)/2
        var pre = seat[0]
        var cnt = 1
        var res = Int.max
        
        for i in 1..<N{
            if seat[i] - pre >= mid{
                cnt += 1
                res = min(res, seat[i]-pre)
                pre = seat[i]
            }
        }

        if cnt >= S{
            ans = res
            lo = mid+1
        }else{
            hi = mid-1
        }
    }
    output.append(String(ans))
}
print(output.joined(separator: "\n"))
