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

let fio = FileIO()
let T = fio.readInt()

for _ in 0..<T{
    let N = fio.readInt()
    let A = fio.readInt()-1
    let B = fio.readInt()-1
    var map = Array(repeating: (father:-1, mother:-1), count: N)
    
    for idx in 0..<N{
        let F = fio.readInt()-1
        let M = fio.readInt()-1
        map[idx].father = F
        map[idx].mother = M
    }
    
    func dijkstra(from DEP:Int, to DES:Int) -> Int{
        var minCost = Array(repeating: Int.max, count: N)
        var q = Heap<(node:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
        q.insert((DEP,0))
        minCost[DEP] = 0
        
        while !q.isEmpty{
            let curr = q.delete()!
            
            if curr.node == DES{ return minCost[DES] }
            if minCost[curr.node] < curr.cost{ continue }
            
            let father = map[curr.node].father
            let mother = map[curr.node].mother
            
            if father >= 0 && minCost[father] > curr.cost{
                minCost[father] = curr.cost
                q.insert((father, curr.cost))
            }
            if mother >= 0 && minCost[mother] > curr.cost+1{
                minCost[mother] = curr.cost+1
                q.insert((mother, curr.cost+1))
            }
        }
        return minCost[DES]
    }
    let ans = dijkstra(from: A, to: B)
    var tmp = 0
    for i in 0..<N{
        if map[i].mother == B{
            tmp = 1
            break
        }
    }
    print(ans==Int.max ? "no ancestor" : ans-tmp)
}