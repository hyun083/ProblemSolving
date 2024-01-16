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

let (N,M,T) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0], $0[1], $0[2])}[0]
var map = Array(repeating: [(node:Int, cost:Int)](), count:N)

for _ in 0..<M{
    let (u,v,h) = [readLine()!.split(separator: " ").map{Int($0)!}].map{($0[0]-1, $0[1]-1, $0[2])}[0]
    map[u].append((v,h))
}

func dijk(from root:Int) -> [Int]{
    var minCost = Array(repeating: -1, count: N)
    var q = Heap<(node:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
    
    minCost[root] = 0
    q.insert((root,0))
    
    while !q.isEmpty{
        let curr = q.delete()!
        if minCost[curr.node] < curr.cost{ continue }
        
        for next in map[curr.node]{
            let newCost = max(curr.cost, next.cost)
            
            if minCost[next.node]<0 || minCost[next.node]>newCost{
                minCost[next.node] = newCost
                q.insert((next.node, newCost))
            }
        }
    }
    
    return minCost
}
var res = Dictionary<Int,[Int]>()

for _ in 0..<T{
    let (S,E) = [readLine()!.split(separator: " ").map{Int($0)!-1}].map{($0[0], $0[1])}[0]
    if res[S] == nil{
        res[S] = dijk(from: S)
    }
    print(res[S]![E])
}