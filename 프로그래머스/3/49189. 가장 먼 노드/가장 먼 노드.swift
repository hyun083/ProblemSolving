import Foundation

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

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var cost = Array(repeating: Int.max, count:n)
    cost[0] = 0
    
    var map = Array(repeating: Set<Int>(), count:n)
    var visited = Set<Int>()
    
    for edge in edge{
        let u = edge[0]-1
        let v = edge[1]-1
        
        map[u].insert(v)
        map[v].insert(u)
    }
    
    var maxCost = 0
    var q = Heap<(Int,Int)>(comparer: {$0.1 > $1.1})
    visited.insert(0)
    q.insert((0,0))
    
    while !q.isEmpty{
        let curr = q.delete()!

        for next in map[curr.0]{
            if visited.contains(next) { continue }
            visited.insert(next)
            maxCost = max(maxCost, curr.1+1)
            cost[next] = curr.1+1
            q.insert((next,cost[next]))
        }
    }
    
    var ans = cost.filter{$0 == maxCost}.count
    
    return ans
}