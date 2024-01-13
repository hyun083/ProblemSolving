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

let file = FileIO()
let T = file.readInt()

for _ in 0..<T{
    let K = file.readInt()
    let W = file.readInt()
    let H = file.readInt()
    var costOf = Dictionary<String, Int>()
    var map = Array(repeating: Array(repeating: "", count: W), count: H)
    var root:(x:Int, y:Int) = (0,0)
    
    for _ in 0..<K{
        let ship = file.readString()
        let time = file.readInt()
        costOf[ship] = time
    }
    
    for i in 0..<H{
        let info = file.readString().map{String($0)}
        for k in 0..<W{
            map[i][k] = info[k]
            if map[i][k] == "E"{
                root = (i,k)
            }
        }
    }
    
    var q = Heap<(x:Int, y:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var ans = Int.max
    var minCost = Array(repeating: Array(repeating: 100000000000, count: W), count: H)
    
    minCost[root.x][root.y] = 0
    q.insert((root.x, root.y, 0))
    
    while !q.isEmpty{
        let curr = q.delete()!
        if minCost[curr.x][curr.y] < curr.cost { continue }
        if curr.x==0 || curr.x==H-1 || curr.y==0 || curr.y==W-1 {
            ans = curr.cost
            break
        }
        
        for i in 0..<4{
            let nx = curr.x+dx[i]
            let ny = curr.y+dy[i]
            if map[nx][ny] == "E" { continue }
            
            let newCost = costOf[map[nx][ny]]! + curr.cost
            if newCost < minCost[nx][ny]{
                minCost[nx][ny] = newCost
                q.insert((nx,ny,newCost))
            }
        }
    }
    print(ans)
}