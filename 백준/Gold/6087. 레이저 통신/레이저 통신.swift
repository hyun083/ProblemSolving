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

let WH = readLine()!.split(separator: " ").map{Int($0)!}
let W = WH[0]
let H = WH[1]

var arr = Array(repeating: Array(repeating: "", count: W), count: H)
var point = [(x:Int,y:Int)]()

for i in 0..<H{
    let line = readLine()!.map{String($0)}
    for k in 0..<W{
        arr[i][k] = line[k]
        if arr[i][k] == "C"{
            point.append((i,k))
        }
    }
}

func dijk(from:(x:Int,y:Int,cost:Int)) -> Int{
    var visited = Array(repeating: Array(repeating: false, count: W), count: H)
    var minCost = Array(repeating: Array(repeating: Int.max, count: W), count: H)
    var q = Heap<(x:Int, y:Int, cost:Int, dir:Int)>(comparer: {$0.cost > $1.cost})
    let dx = [-1,1,0,0]
    let dy = [0,0,-1,1]
    
    visited[from.x][from.y] = true
    minCost[from.x][from.y] = 0
    
    for nextDir in 0..<4{
        let nx = from.x+dx[nextDir]
        let ny = from.y+dy[nextDir]
        
        if nx<0 || nx>=H || ny<0 || ny>=W { continue }
        if arr[nx][ny] == "*" { continue }
        
        minCost[nx][ny] = 0
        q.insert((nx,ny,0,nextDir))
    }
    
    while !q.isEmpty{
        let curr = q.delete()!
        let x = curr.x
        let y = curr.y
        
        visited[x][y] = true
        if (x,y) == point[1]{
            break
        }
        
        for nextDir in 0..<4{
            let nx = x+dx[nextDir]
            let ny = y+dy[nextDir]
            
            if nx<0 || nx>=H || ny<0 || ny>=W { continue }
            if arr[nx][ny] == "*"{ continue }
            
            let newCost = curr.dir==nextDir ? curr.cost:curr.cost+1
//            print(curr.x,curr.y,curr.cost,curr.dir,"->",nx,ny,newCost,nextDir)
            if visited[nx][ny]{
                if minCost[nx][ny] == newCost{
                    q.insert((nx,ny,newCost,nextDir))
                }
            }else{
                if minCost[nx][ny] > newCost{
                    minCost[nx][ny] = newCost
                    q.insert((nx,ny,newCost,nextDir))
                }
            }
            
        }
    }
    
    return minCost[point[1].x][point[1].y]
}
print(dijk(from: (point[0].x,point[0].y,0)))