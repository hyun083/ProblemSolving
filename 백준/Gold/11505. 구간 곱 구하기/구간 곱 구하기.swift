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
let N = fio.readInt()
let M = fio.readInt()
let K = fio.readInt()
let MOD = 1000000007

var arr = [Int]()
var tree = Array(repeating: 1, count: N*4)

for _ in 0..<N{
    arr.append(fio.readInt())
}

func make_tree(from n:Int, to m:Int, idx:Int) -> Int{
    if n==m{
        tree[idx] = arr[n]
        return tree[idx]
    }
    
    let mid = (n+m)/2
    let left = make_tree(from: n, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: m, idx: idx*2+1)
    
    tree[idx] = (left*right)%MOD
    return tree[idx]
}

func read_tree(from n:Int, to m:Int, idx:Int, min:Int, max:Int) -> Int{
    if m < min || max < n{
        return 1
    }
    if min <= n && m <= max{
        return tree[idx]
    }
    
    let mid = (n+m)/2
    let left = read_tree(from: n, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: m, idx: idx*2+1, min: min, max: max)
    
    return (left*right)%MOD
}

func update_tree(from n:Int, to m:Int, idx:Int, target_idx:Int, value:Int) -> Int{
    if target_idx < n || m < target_idx{
        return tree[idx]
    }
    if n == m{
        tree[idx] = value
        return tree[idx]
    }
    
    let mid = (n+m)/2
    let left = update_tree(from: n, to: mid, idx: idx*2, target_idx: target_idx, value: value)
    let right = update_tree(from: mid+1, to: m, idx: idx*2+1, target_idx: target_idx, value: value)
    
    tree[idx] = (left*right)%MOD
    return tree[idx]
}

make_tree(from: 0, to: N-1, idx: 1)

for _ in 0..<M+K{
    if fio.readInt() == 1{
        let B = fio.readInt()-1
        let C = fio.readInt()
        arr[B] = C
        update_tree(from: 0, to: N-1, idx: 1, target_idx: B, value: C)
    }else{
        let B = fio.readInt()-1
        let C = fio.readInt()-1
        print(read_tree(from: 0, to: N-1, idx: 1, min: B, max: C))
    }
}