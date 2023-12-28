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

//let N = Int(readLine()!)!
//let(A,B,C) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
let N = file.readInt()
let A = file.readInt()-1
let B = file.readInt()-1
let C = file.readInt()-1

//let M = Int(readLine()!)!
let M = file.readInt()
var map = Array(repeating: [(node:Int, cost:Int)](), count: N)

for _ in 0..<M{
//    let (u,v,cost) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2]-1)}[0]
    let u = file.readInt()-1
    let v = file.readInt()-1
    let cost = file.readInt()
    
    map[u].append((v,cost))
    map[v].append((u,cost))
}

func dijk(from root:Int) -> [Int]{
    var cost = Array(repeating: 10000000000, count: N)
    cost[root] = 0
    var q = Heap<(node:Int, cost:Int)>(comparer: {($0.cost > $1.cost)})
    q.insert((root,0))
    
    while !q.isEmpty{
        let curr = q.delete()!
        if cost[curr.node] < curr.cost{ continue }
        
        for next in map[curr.node]{
            let newCost = cost[curr.node]+next.cost
            
            if cost[next.node] > newCost{
                cost[next.node] = newCost
                q.insert((next.node, newCost))
            }
            
        }
    }
    
    return cost
}
var res = [[Int]]()
var ans = -1
var tmp = 0
res.append(dijk(from: A))
res.append(dijk(from: B))
res.append(dijk(from: C))

for k in 0..<N{
    let value = min(res[0][k],min(res[1][k],res[2][k]))
    if value > tmp {
        tmp = value
        ans = k
    }
}
print(ans+1)