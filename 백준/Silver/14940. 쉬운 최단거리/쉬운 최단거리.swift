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
let N = fio.readInt()
let M = fio.readInt()

var ans = Array(repeating: Array(repeating: Int.max, count: M), count: N)
var arr = Array(repeating: Array(repeating: 0, count: M), count: N)
//var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var q = [(x:Int,y:Int,cost:Int)]()

for i in 0..<N{
    for k in 0..<M{
        arr[i][k] = fio.readInt()
        if arr[i][k] == 2{
            q.append((i,k,0))
            ans[i][k] = 0
        }else if arr[i][k] == 0{
            ans[i][k] = 0
        }
    }
}

func bfs(){
    var idx = 0
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    while idx < q.count{
        let curr = q[idx]
        let x = curr.x
        let y = curr.y
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=M { continue }
            if ans[nx][ny] > curr.cost+1{
                ans[nx][ny] = curr.cost+1
                q.append((nx,ny,ans[nx][ny]))
            }
        }
        idx += 1
    }
}

bfs()
for i in 0..<N{
    for k in 0..<M{
        print(ans[i][k]==Int.max ? -1:ans[i][k], terminator: " ")
    }
    print("")
}