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

while true{
    let INF = 5000000
    let NM = readLine()!.split(separator: " ").map{Int($0)!}
    let N = NM[0]
    let M = NM[1]
    
    if N+M == 0{ break }
    
    var arr = Array(repeating: [(node:Int, cost:Int)](), count: N)
    var rev = Array(repeating: [(node:Int, cost:Int)](), count: N)
    
    let SD = readLine()!.split(separator: " ").map{Int($0)!}
    let S = SD[0]
    let D = SD[1]
    
    for _ in 0..<M{
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        let U = line[0]
        let V = line[1]
        let P = line[2]
        
        arr[U].append((V,P))
        rev[V].append((U,P))
    }
    
    func dij(from:Int, arr:[[(node:Int, cost:Int)]]) -> [Int]{
        var visited = Array(repeating: false, count: N)
        var res = Array(repeating: INF, count: N)
        res[from] = 0
        
        var q = Heap<(node:Int, cost:Int)>(comparer: {$0.1 > $1.1})
        q.insert((from,0))
        
        while !q.isEmpty{
            let top = q.delete()!
            let curr = top.node
            let cost = top.cost
            
            visited[curr] = true
            
            for next in arr[curr]{
                if next.node<0 { continue }
                if visited[next.node] { continue }
                
                let newCost = cost+next.cost
                if res[next.node] > newCost{
                    res[next.node] = newCost
                    q.insert((next.node,newCost))
                }
            }
        }
        
        return res
    }
    
    let minCost = dij(from: S, arr: arr)
    var visited = Array(repeating: false, count: N)
    
    func dfs(from:Int, cost:Int){
        let curr = from
        
        for i in 0..<rev[curr].count{
            let next = rev[curr][i].node
            let newCost = rev[curr][i].cost + cost
            
            if newCost + minCost[next] == minCost[D]{
                rev[curr][i].node = -1
                
                if !visited[next]{
                    visited[next] = true
                    dfs(from: next, cost: newCost)
                }
            }
        }
    }
    
    visited[D] = true
    dfs(from: D, cost: 0)
    
    let ans = dij(from: D, arr: rev)[S]
    print(ans==INF ? -1:ans)
}