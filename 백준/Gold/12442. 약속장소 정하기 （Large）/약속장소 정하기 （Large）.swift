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

let T = Int(readLine()!)!
for t in 1...T{
    let NPM = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NPM[0], P = NPM[1], M = NPM[2]
    
    var map = Array(repeating: [(node:Int, cost:Int)](), count: N)
    var info = [(startCity:Int, speed:Int)]()
    
    for _ in 0..<P{
        let XV = readLine()!.split(separator: " ").map{Int($0)!}
        let X = XV[0]-1, V = XV[1]
        info.append((X, V))
    }
    
    for _ in 0..<M{
        var edge = Array(readLine()!.split(separator: " ").map{Int($0)!}.reversed())
        let distance = edge.removeLast()
        let size = edge.removeLast()
        for i in 0..<size-1{
            let u = edge[i]-1
            let v = edge[i+1]-1
            map[u].append((v,distance))
            map[v].append((u,distance))
        }
    }
    
    func dijkstra(from DEP:Int, speed:Int) -> [Int] {
        let MAX = Int.max
        var visited = Array(repeating: false, count: N)
        var queue = Heap<(node:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
        var minCost = Array(repeating: MAX, count: N)
        
        queue.insert((DEP,0))
        minCost[DEP] = 0
        
        while !queue.isEmpty{
            let curr = queue.delete()!
            
            if curr.cost > minCost[curr.node]{ continue }
            if visited[curr.node]{ continue }
            
            visited[curr.node] = true
            
            for next in map[curr.node]{
                let nextCost = curr.cost + (next.cost*speed)
                if nextCost < minCost[next.node]{
                    minCost[next.node] = nextCost
                    queue.insert((next.node, nextCost))
                }
            }
        }
        
        return minCost
    }
    
    var res = Array(repeating: 0, count: N)
    var ans = Int.max
    
    for i in 0..<P{
        let minCost = dijkstra(from: info[i].startCity, speed: info[i].speed)
        
        for k in 0..<N{
            res[k] = max(res[k], minCost[k])
        }
    }
    print("Case #\(t):",terminator: " ")
    for value in res{
        ans = min(ans, value)
    }
    print(ans==Int.max ? "-1":ans)
}