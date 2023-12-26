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

let file = FileIO()
let N = file.readInt()
let M = file.readInt()

var node = [Bool]()
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
var visited = Array(repeating: false, count: N)
var q = Heap<(node:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
var cost = Array(repeating: -1, count: N)

for _ in 0..<N{
    node.append(file.readInt()==0 ? true:false)
}

for _ in 0..<M{
    let u = file.readInt()
    let v = file.readInt()
    let cost = file.readInt()

    if (u==N-1 && node[v]) || (v==N-1 && node[u]) || (node[u] && node[v]){
        map[u].append((v,cost))
        map[v].append((u,cost))
    }
}

if map[N-1].isEmpty{
    print(-1)
}else{
    cost[0] = 0
    visited[0] = true
    q.insert((0,0))
    
    while !q.isEmpty{
        let curr = q.delete()!
        if cost[curr.node] < curr.cost { continue }
        visited[curr.node] = true
        
        for next in map[curr.node]{
            let newCost = cost[curr.node] + next.cost
            if visited[next.node] { continue }
            
            if cost[next.node]<0 || cost[next.node]>newCost{
                cost[next.node] = newCost
                q.insert((next.node, newCost))
            }
        }
    }
    print(cost[N-1])
}