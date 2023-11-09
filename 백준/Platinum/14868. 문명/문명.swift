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
let K = file.readInt()

var arr = Array(repeating: -1, count: K+1)
var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var civil = [(x:Int, y:Int, num:Int)]()
var unionQ = [(x:Int, y:Int, num:Int)]()
var expendQ = [(x:Int, y:Int, num:Int)]()
var comp = K

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

func root(of node:Int) -> Int{
    if arr[node] < 0 {return node}
    arr[node] = root(of: arr[node])
    return arr[node]
}

func union(a:Int, b:Int){
    let A = root(of: a)
    let B = root(of: b)
    
    if A==B {return}
    if a==0{
        arr[A] = B
    }else{
        arr[B] = A
    }
    comp -= 1
}

func unionCivil(){
    var dq = Array(unionQ.reversed())
    unionQ.removeAll()
    
    while !dq.isEmpty{
        let curr = dq.removeLast()
        expendQ.append(curr)
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            if nx<0 || nx>=N || ny<0 || ny>=N{ continue }
            
            let nextNum = map[nx][ny]
            if nextNum>0 && visited[nx][ny]{
                union(a: curr.num, b: nextNum)
            }
        }
    }
}

func civilize(){
    var dq = Array(expendQ.reversed())
    expendQ.removeAll()
    
    while !dq.isEmpty{
        let curr = dq.removeLast()
        expendQ.append(curr)
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=N{ continue }
            if map[nx][ny] == 0 && !visited[nx][ny]{
                visited[nx][ny] = true
                map[nx][ny] = curr.num
                unionQ.append((nx,ny,curr.num))
            }else if map[nx][ny]>0 && visited[nx][ny]{
                union(a: curr.num, b: map[nx][ny])
            }
        }
    }
}

for num in 1...K{
    let x = file.readInt()-1
    let y = file.readInt()-1
    map[x][y] = num
    civil.append((x,y,num))
    visited[x][y] = true
    unionQ.append((x,y,num))
}

var ans = 0
unionCivil()

while comp>1 {
    ans += 1
    civilize()
    
//    print(ans, comp)
//    for m in map{
//        print(m)
//    }
//    print()
    
    if comp == 1 { break }
    unionCivil()
}
print(ans)