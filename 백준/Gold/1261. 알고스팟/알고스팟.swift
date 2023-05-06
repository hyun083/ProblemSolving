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

let INF = 10001
let NM = readLine()!.split(separator: " ").map{Int($0)!}
let N = NM[0]
let M = NM[1]

var arr = Array(repeating: Array(repeating: Int(), count: N), count: M)
var minCost = Array(repeating: Array(repeating: Int(), count: N), count: M)

for i in 0..<M{
    let line = readLine()!.map{Int(String($0))!}
    for k in 0..<N{
        arr[i][k] = line[k]
    }
}

func dijk() -> [[Int]]{
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    var visited = Array(repeating: Array(repeating: false, count: N), count: M)
    var res = Array(repeating: Array(repeating: INF, count: N), count: M)
    var q = Heap<(x:Int, y:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
    
    q.insert((0,0,0))
    res[0][0] = 0
    
    while !q.isEmpty{
        let curr = q.delete()!
        let x = curr.x
        let y = curr.y
        
        visited[x][y] = true
        if x==M-1 && y==N-1{ break }
        
        for i in 0..<4{
            let nx = x+dx[i]
            let ny = y+dy[i]
            
            if nx<0 || nx>=M || ny<0 || ny>=N{ continue }
            if visited[nx][ny] { continue }
            
            let newCost = arr[nx][ny]==1 ? curr.cost+1:curr.cost
            if res[nx][ny] > newCost{
                res[nx][ny] = newCost
                q.insert((nx,ny,newCost))
            }
        }
    }
    return res
}
print(dijk()[M-1][N-1])