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

let m = fio.readInt()
let n = fio.readInt()
let h = fio.readInt()

var map = Array(repeating: [[Int]](), count: h)
var cnt0 = 0
var cnt1 = 0
var cntm = 0
var queue = [[Int]]()
var dequeue = [[Int]]()

let nx = [1,-1,0,0,0,0]
let ny = [0,0,1,-1,0,0]
let nz = [0,0,0,0,1,-1]

for z in 0..<h{
    var box = [[Int]]()
    for y in 0..<n{
        var tomatos = [Int]()
        for x in 0..<m{
            let tomato = fio.readInt()
            if tomato == 0{
                cnt0 += 1
            }else if tomato == 1{
                cnt1 += 1
                queue.append([z,y,x])
            }else{
                cntm += 1
            }
            tomatos.append(tomato)
        }
        box.append(tomatos)
    }
    map[z] = box
}

func bfs() -> Int{
    var ans = 0
    
    while !queue.isEmpty{
        ans += 1
        dequeue = queue.reversed()
        queue.removeAll()
        for _ in 0..<dequeue.count{
            let curr = dequeue.removeLast()
            for i in 0..<6{
                let Z = curr[0]+nz[i]
                let Y = curr[1]+ny[i]
                let X = curr[2]+nx[i]
                if X<0 || Y<0 || Z<0 || X>=m || Y>=n || Z>=h{
                    continue
                }
                if map[Z][Y][X] == 0{
                    map[Z][Y][X] = 1
                    cnt0 -= 1
                    queue.append([Z,Y,X])
                }
            }
        }
        
    }
    if cnt0 == 0{
        return ans-1
    }else{
        return -1
    }
}

if cnt1 == m*n*h-cntm{
    print(0)
}else{
    print(bfs())
}