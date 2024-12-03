import Foundation

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

let INF = 2000000000
let info = readLine()!.split(separator: " ").map{Int($0)!}
let C = info[0]     //edges
let P = info[1]     //nodes
let PB = info[2]-1    //starting point
let PA1 = info[3]-1   //destination1
let PA2 = info[4]-1   //destination2

var map = Array(repeating: [(node:Int, cost:Int)](), count: P)

for _ in 0..<C{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let U = info[0]-1
    let V = info[1]-1
    let C = info[2]
    
    map[U].append((V,C))
    map[V].append((U,C))
}

func dijk(from DES:Int) -> [Int]{
    var minCost = Array(repeating: Int.max, count: P)
    var q = Heap<(node:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
    
    q.insert((DES,0))
    minCost[DES] = 0
    
    while !q.isEmpty{
        let curr = q.delete()!
        if minCost[curr.node] < curr.cost{ continue }
        
        for next in map[curr.node]{
            let newCost = curr.cost + next.cost
            if newCost < minCost[next.node]{
                minCost[next.node] = newCost
                q.insert((next.node, newCost))
            }
        }
    }
    
    return minCost
}
let minCostFromPB = dijk(from: PB)
let minCostFromPA1 = dijk(from: PA1)
let minCostFromPA2 = dijk(from: PA2)

var ans = minCostFromPB[PA1] + minCostFromPA1[PA2]
ans = min(ans,minCostFromPB[PA2] + minCostFromPA2[PA1])
print(ans)