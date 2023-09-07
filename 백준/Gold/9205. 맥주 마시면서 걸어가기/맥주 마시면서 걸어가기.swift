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

let file = FileIO()
let t = file.readInt()

for _ in 0..<t{
    let n = file.readInt()
    var arr = [(x:Int, y:Int)]()
    var visited = Array(repeating: false, count: n+2)
    
    let x1 = file.readInt()
    let y1 = file.readInt()
    
    for _ in 0..<n{
        let x = file.readInt()
        let y = file.readInt()
        arr.append((x,y))
    }
    
    let x2 = file.readInt()
    let y2 = file.readInt()
    
    
    func bfs() -> Bool{
        var dq = [(x:Int, y:Int)]()
        var q = [(x:Int,y:Int)]()
        q.append((x1,y1))
        
        while !q.isEmpty{
            dq = q.reversed()
            q.removeAll()
            
            for _ in 0..<dq.count{
                let curr = dq.removeLast()
                if abs(curr.x-x2)+abs(curr.y-y2) <= 1000{
                    return true
                }
                
                for i in 0..<n{
                    if visited[i] { continue }
                    let dist = abs(curr.x - arr[i].x) + abs(curr.y - arr[i].y)
                    if dist <= 1000{
                        visited[i] = true
                        q.append(arr[i])
                    }
                }
            }
        }
        
        return false
    }
    print(bfs() ? "happy":"sad")
}