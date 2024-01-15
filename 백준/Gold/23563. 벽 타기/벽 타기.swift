import Foundation

//by thyno
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

let line = readLine()!.split(separator: " ").map{Int($0)!}
let H = line[0]
let W = line[1]

var map = Array(repeating: Array(repeating: "", count: W), count: H)
var side = Array(repeating: Array(repeating: false, count: W), count: H)
var S:(x:Int, y:Int) = (-1,-1)
var E:(x:Int, y:Int) = (-1,-1)
let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for i in 0..<H{
    let info = readLine()!.map{String($0)}
    for k in 0..<W{
        map[i][k] = info[k]
        if map[i][k] == "S"{
            S = (i,k)
        }else if map[i][k] == "E"{
            E = (i,k)
        }else if map[i][k] == "#"{
            for p in 0..<4{
                let nx = i+dx[p]
                let ny = k+dy[p]
                
                if nx<0 || nx>=H || ny<0 || ny>=W{ continue }
                side[nx][ny] = true
            }
        }
    }
}

var q = Heap<(x:Int, y:Int, cost:Int)>(comparer: {$0.cost > $1.cost})
var minCost = Array(repeating: Array(repeating: H*W, count: W), count: H)

q.insert((S.x, S.y, 0))
minCost[S.x][S.y] = 0

while !q.isEmpty{
    let curr = q.delete()!
    if map[curr.x][curr.y] == "E"{ break }
    
    if minCost[curr.x][curr.y] < curr.cost { continue }
    for i in 0..<4{
        let nx = curr.x + dx[i]
        let ny = curr.y + dy[i]
        
        if nx<0 || nx>=H || ny<0 || ny>=W || map[nx][ny]=="#"{ continue }
        
        let newCost = (side[curr.x][curr.y]&&side[nx][ny]) ? curr.cost:curr.cost+1
        if minCost[nx][ny] > newCost{
            minCost[nx][ny] = newCost
            q.insert((nx,ny,newCost))
        }
    }
}
print(minCost[E.x][E.y])