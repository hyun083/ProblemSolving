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

let FIO = FileIO()
let E = FIO.readInt()
var edges = [(u:Int, v:Int, c:Int)]()
var station = Dictionary<String, Int>()
station["sasa"] = 0
station["home"] = 1

for _ in 0..<E{
    let U = FIO.readString()
    let V = FIO.readString()
    let C = FIO.readInt()
    if station[U] == nil{
        station[U] = station.count
    }
    if station[V] == nil{
        station[V] = station.count
    }
    edges.append((station[U]!,station[V]!,C))
}

var map = Array(repeating: [(node:Int, cost:Int)](), count: station.count)
for edge in edges{
    let u = edge.u
    let v = edge.v
    let c = edge.c
    
    map[u].append((v,c))
}
func dijk(from dep:Int, to dest:Int) -> Int{
    var minCost = Array(repeating: Int.max, count: station.count)
    var q = Heap<(node:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
    q.insert((dep,0))
    minCost[dep] = 0
    
    while !q.isEmpty{
        let curr = q.delete()!
        if minCost[curr.node] < curr.cost{ continue }
        if minCost[dest] > Int.max { break }
        
        for next in map[curr.node]{
            let newCost = curr.cost + next.cost
            if minCost[next.node] > newCost{
                minCost[next.node] = newCost
                q.insert((next.node, newCost))
            }
        }
    }
    return minCost[dest]
}

let costFromsasaToHome = dijk(from: 0, to: 1)
let costFromHomeToSasa = dijk(from: 1, to: 0)

if costFromsasaToHome == Int.max{
    print(-1)
}else if costFromHomeToSasa == Int.max{
    print(-1)
}else{
    print(costFromsasaToHome + costFromHomeToSasa)
}