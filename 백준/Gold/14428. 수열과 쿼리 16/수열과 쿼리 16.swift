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
var tree = Array(repeating: 0, count: (N+1)*4)
var arr = [1000000001]
for _ in 0..<N{
    arr.append(fio.readInt())
}

func make_tree(from n:Int, to m:Int, idx:Int) -> Int{
    if n == m{
        tree[idx] = n
        
        return tree[idx]
    }
    
    let mid = (n+m)/2
    let left = make_tree(from: n, to: mid, idx: idx*2)
    let right = make_tree(from: mid+1, to: m, idx: idx*2+1)
    if arr[left] == arr[right]{
        tree[idx] = left<right ? left:right
    }else {
        tree[idx] = arr[left]<arr[right] ? left:right
    }
    
    return tree[idx]
}

func read_tree(from n:Int, to m:Int, idx:Int, min:Int, max:Int) -> Int{
    if m < min || max < n{
        return 0
    }
    if min <= n && m <= max{
        return tree[idx]
    }
    
    let mid = (n+m)/2
    let left = read_tree(from: n, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: m, idx: idx*2+1, min: min, max: max)
    
    if arr[left] == arr[right]{
        return left<right ? left:right
    }else {
        return arr[left]<arr[right] ? left:right
    }
}

func update_tree(from n:Int, to m:Int, idx:Int, target_idx:Int) -> Int{
    if target_idx < n || m < target_idx{
        return tree[idx]
    }
    if n==m{
        return tree[idx]
    }
    
    let mid = (n+m)/2
    let left = update_tree(from: n, to: mid, idx: idx*2, target_idx: target_idx)
    let right = update_tree(from: mid+1, to: m, idx: idx*2+1, target_idx: target_idx)
    
    if arr[left] == arr[right]{
        tree[idx] = left<right ? left:right
    }else {
        tree[idx] = arr[left]<arr[right] ? left:right
    }
    
    return tree[idx]
}

make_tree(from: 1, to: N, idx: 1)

let M = fio.readInt()
for _ in 0..<M{
    if fio.readInt() == 1{
        let idx = fio.readInt()
        let value = fio.readInt()
        arr[idx] = value
        update_tree(from: 1, to: N, idx: 1, target_idx: idx)
    }else{
        let min = fio.readInt()
        let max = fio.readInt()
        print(read_tree(from: 1, to: N, idx: 1, min: min, max: max))
    }
}