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

let file = FileIO()
let N = file.readInt()
let M = file.readInt()

var arr = Array(repeating: -1, count: M+1)
var keys = [(x:Int, y:Int)]()
var map = Array(repeating: Array(repeating: Int(), count: N), count: N)
var ans = 0
var component = M+1

for i in 0..<N{
    let info = file.readString().map{String($0)}
    for k in 0..<N{
        if info[k] == "S"{
            map[i][k] = keys.count
            keys.append((i,k))
        }else if info[k] == "K"{
            map[i][k] = keys.count
            keys.append((i,k))
        }else if info[k] == "1"{
            map[i][k] = -2
        }else{
            map[i][k] = -1
        }
    }
}

func bfs(from root:(x:Int,y:Int)){
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var q = [(pos:(x:Int, y:Int), length:Int)]()
    var idx = 0
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    q.append((root, 0))
    visited[root.x][root.y] = true
    while idx < q.count{
        let curr = q[idx]
        
        if curr.pos != root && map[curr.pos.x][curr.pos.y] > -1{
            let u = map[root.x][root.y]
            let v = map[curr.pos.x][curr.pos.y]
            edges.append((u,v,curr.length))
        }
        
        for i in 0..<4{
            let nx = curr.pos.x + dx[i]
            let ny = curr.pos.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=N || map[nx][ny] == -2{ continue }
            if !visited[nx][ny]{
                visited[nx][ny] = true
                q.append(((nx,ny), curr.length+1))
            }
        }
        
        idx += 1
    }
}

func root(of node:Int) -> Int{
    if arr[node] < 0{
        return node
    }
    
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int, cost:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A == B { return }
    
    arr[B] = A
    ans += cost
    component -= 1
}

var edges = [(u:Int, v:Int, cost:Int)]()

for i in 0..<M+1{
    bfs(from: keys[i])
}
edges.sort(by: {$0.cost > $1.cost})

while component>1 && !edges.isEmpty{
    let edge = edges.removeLast()
    union(a: edge.u, b: edge.v, cost: edge.cost)
}
print(component>1 ? "-1":ans)