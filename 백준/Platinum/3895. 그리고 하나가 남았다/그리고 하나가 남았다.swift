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
}

let io = FileIO()
var ans = [String]()

while true{
    let n = io.readInt()
    let k = io.readInt()
    let m = io.readInt()
    
    if n+k+m == 0{ break }
    
    var tree = Array(repeating: 0, count: n*4)
    
    func init_tree(start:Int, end:Int, node:Int) -> Int{
        if start == end{
            tree[node] += 1
            return tree[node]
        }
        
        let mid = (start+end)/2
        let left = init_tree(start: start, end: mid, node: node*2)
        let right = init_tree(start: mid+1, end: end, node: node*2+1)
        tree[node] = left + right
        return tree[node]
    }
    
    func read_idx(start:Int, end:Int, node:Int, count:Int) -> Int{
        tree[node] -= 1
        if start == end{ return start }
        
        let mid = (start+end)/2
        let left = tree[node*2]
        
        if left >= count{
            return read_idx(start: start, end: mid, node: node*2, count: count)
        }else{
            return read_idx(start: mid+1, end: end, node: node*2+1, count: count-left)
        }
    }
    
    func read_count(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
        if end < from || to < start{
            return 0
        }
        if from <= start && end <= to{
            return tree[node]
        }
        
        let mid = (start+end)/2
        let left = read_count(start: start, end: mid, node: node*2, from: from, to: to)
        let right = read_count(start: mid+1, end: end, node: node*2+1, from: from, to: to)
        return left + right
    }
    
    init_tree(start: 0, end: n-1, node: 1)

    var idx = read_idx(start: 0, end: n-1, node: 1, count: m)
    var cnt = read_count(start: 0, end: n-1, node: 1, from: 0, to: idx)
    for _ in 0..<n-1{
        idx = read_idx(start: 0, end: n-1, node: 1, count: (k+cnt)%tree[1]==0 ? tree[1]:(k+cnt)%tree[1])
        cnt = read_count(start: 0, end: n-1, node: 1, from: 0, to: idx)
    }
    ans.append("\(idx+1)")
}
print(ans.joined(separator: "\n"))