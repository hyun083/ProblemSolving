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

let NMP = readLine()!.split(separator: " ").map{Int($0)!}
let N = NMP[0]
let M = NMP[1]
let P = NMP[2]

struct edge{
    let node:Int
    let cost:Int
    let outdoor:Int
}

var map = Array(repeating: [edge](), count: N)


for _ in 0..<M{
    let UVCI = readLine()!.split(separator: " ").map{String($0)}
    let U = Int(UVCI[0])!
    let V = Int(UVCI[1])!
    let C = Int(UVCI[2])!
    let I = UVCI[3]
    
    map[U].append(edge(node: V, cost: C, outdoor: I == "O" ? C:0))
    map[V].append(edge(node: U, cost: C, outdoor: I == "O" ? C:0))
}

func dijkstra(DEP:Int, DES:Int) -> (totalCost:Int, outdoorCost:Int){
    var queue = Heap<edge>(comparer: {
        if $0.outdoor == $1.outdoor{
            return $0.cost > $1.cost
        }else{
            return $0.outdoor > $1.outdoor
        }
    })
    var visited:[Bool] = Array(repeating: false, count: N)
    var minCost:[(totalCost:Int, outdoorCost:Int)] = Array(repeating: (Int.max,Int.max), count: N)
    
    minCost[DEP] = (0,0)
    queue.insert(edge(node: DEP, cost: 0, outdoor: 0))
    
    while !queue.isEmpty{
        let curr =  queue.delete()!
        if curr.node == DES{ break }
        if curr.outdoor > minCost[DEP].outdoorCost{ continue }
        if visited[curr.node]{ continue }
        visited[curr.node] = true
        
        for next in map[curr.node]{
            let newCost = curr.cost + next.cost
            let newOutdoorCost = curr.outdoor + next.outdoor
            
            if newOutdoorCost < minCost[next.node].outdoorCost{
                minCost[next.node].totalCost = newCost
                minCost[next.node].outdoorCost = newOutdoorCost
                queue.insert(edge(node: next.node, cost: newCost, outdoor: newOutdoorCost))
            }else if newOutdoorCost == minCost[next.node].outdoorCost && newCost < minCost[next.node].totalCost{
                minCost[next.node].totalCost = newCost
                queue.insert(edge(node: next.node, cost: newCost, outdoor: newOutdoorCost))
            }
        }
    }
    
    return minCost[DES]
}

for _ in 0..<P{
    let UV = readLine()!.split(separator: " ").map{Int($0)!}
    let res =  dijkstra(DEP: UV[0], DES: UV[1])
    if res == (Int.max,Int.max){
        print("IMPOSSIBLE")
    }else{
        print(res.outdoorCost, res.totalCost)
    }
}
