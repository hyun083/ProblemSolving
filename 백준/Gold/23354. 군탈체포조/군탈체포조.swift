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

//by rhyno
public struct Heap<T> {
  var nodes: [T] = []
  let comparer: (T,T) -> Bool

  var isEmpty: Bool {
      return nodes.isEmpty
  }

  init(comparer: @escaping (T,T) -> Bool) {
      self.comparer = comparer
  }

  func peek() -> T? {
      return nodes.first
  }

  mutating func insert(_ element: T) {
      var index = nodes.count

      nodes.append(element)

      while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
          nodes.swapAt(index, (index-1)/2)
          index = (index-1)/2
      }
  }

  mutating func delete() -> T? {
      guard !nodes.isEmpty else {
          return nil
      }

      if nodes.count == 1 {
          return nodes.removeFirst()
      }

      let result = nodes.first
      nodes.swapAt(0, nodes.count-1)
      _ = nodes.popLast()

      var index = 0

      while index < nodes.count {
          let left = index * 2 + 1
          let right = left + 1

          if right < nodes.count {
              if comparer(nodes[left], nodes[right]),
                  !comparer(nodes[right], nodes[index]) {
                  nodes.swapAt(right, index)
                  index = right
              } else if !comparer(nodes[left], nodes[index]){
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else if left < nodes.count {
              if !comparer(nodes[left], nodes[index]) {
                  nodes.swapAt(left, index)
                  index = left
              } else {
                  break
              }
          } else {
              break
          }
      }

      return result
  }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: <)
    }
}

let io = FileIO()
let N = io.readInt()
var map = Array(repeating: Array(repeating: 0, count: N), count: N)
var target = [(0,0)]

for i in 0..<N{
    for k in 0..<N{
        map[i][k] = io.readInt()
        if map[i][k] == 0{
            target.append((i,k))
        }else if map[i][k] == -1{
            map[i][k] = 0
            target[0] = (i,k)
        }
    }
}

var table = Array(repeating: Array(repeating: 0, count: target.count), count: target.count)

func dij(from: (Int,Int)) -> [Int]{
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    var tmp = Array(repeating: Array(repeating: Int.max, count: N), count: N)
    var res = Array(repeating: 0, count: target.count)
    tmp[from.0][from.1] = 0
    
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    var q = Heap<((Int,Int),Int)>(comparer: { $0.1 > $1.1 })
    q.insert((from,0))
    
    while !q.isEmpty{
        let curr = q.delete()!
        let x = curr.0.0
        let y = curr.0.1
        let cost = curr.1
        
        visited[x][y] = true
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            
            if nx<0 || nx>=N || ny<0 || ny>=N || visited[nx][ny]{ continue }
            let nc = cost+map[nx][ny]
            
            if tmp[nx][ny] > nc{
                tmp[nx][ny] = nc
                q.insert(((nx,ny),nc))
            }
        }
    }
    
    for i in 0..<target.count{
        let nx = target[i].0
        let ny = target[i].1
        
        res[i] = tmp[nx][ny]
    }
    
    return res
}

var visited = Array(repeating: false, count: target.count)
var ans = Int.max

func btk(from:[Int], cnt:Int, cost:Int){
    let curr = from.last!
    
    if cnt == target.count{
        ans = min(ans, cost+table[curr][0])
        return
    }
    
    for next in 1..<target.count{
        if !visited[next] {
            visited[next] = true
            btk(from: from+[next], cnt: cnt+1, cost: cost+table[curr][next])
            visited[next] = false
        }
    }
}

if target.count==1{
    print(0)
}else{
    for i in 0..<target.count{
        table[i] = dij(from: target[i])
    }
    
    btk(from: [0], cnt: 1, cost: 0)
    print(ans)
}