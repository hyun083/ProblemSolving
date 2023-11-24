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

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var ans = [50001,10000001]
    var map = Array(repeating:[(node:Int, cost:Int)](), count:n)
    var visited = Array(repeating:10000001, count:n)
    var G = Set<Int>()
    var S = Set<Int>()
    
    for gate in gates{
        G.insert(gate-1)
    }
    
    for summit in summits {
        S.insert(summit-1)
    }
    
    for path in paths{
        let u = path[0]-1
        let v = path[1]-1
        let c = path[2]
        
        map[u].append((v,c))
        map[v].append((u,c))
    }
    

    var q = Heap<(node:Int, intense:Int)>(comparer: {$0.intense > $1.intense})
    
    for gate in gates{
        q.insert((gate-1, 0))
        visited[gate-1] = 0
    }
        
    while !q.isEmpty{
        let curr = q.delete()!
        if curr.intense > ans[1] { continue }
        for next in map[curr.node]{
            let newIntense = max(curr.intense, next.cost)
            if visited[next.node]<=newIntense || G.contains(next.node) { continue }
            visited[next.node] = newIntense
            
            if S.contains(next.node){
                if ans[1] > newIntense{
                    ans = [next.node+1, newIntense]
                }else if ans[1] == newIntense{
                    ans[0] = min(ans[0], next.node+1)
                }
                continue
            }
            
            q.insert((next.node, newIntense))
        }
    }    
    
    

    return ans
}