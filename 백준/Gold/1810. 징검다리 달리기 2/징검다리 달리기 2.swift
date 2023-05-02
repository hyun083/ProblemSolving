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

let INF = Double(20000000)
let NF = readLine()!.split(separator: " ").map{Int($0)!}
let N = NF[0]
let F = NF[1]

var edges = Dictionary<[Int],Bool>()
var minCost = Dictionary<[Int],Double>()

for _ in 0..<N{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let x = line[0]
    let y = line[1]
    
    edges[[x,y]] = false
    minCost[[x,y]] = INF
}

func dijk(from: (Int,Int), cost:Double) -> Int{
    var res = INF
    
    var q = Heap<((x:Int, y:Int), cost:Double)>(comparer: {$0.cost > $1.cost})
    q.insert((from,0.0))
    
    while !q.isEmpty{
        let curr = q.delete()!
        let currNode = curr.0
        let x = Double(currNode.x)
        let y = Double(currNode.y)
        
        edges[[currNode.x,currNode.y]] = true
        
        if currNode.y == F{
            res = min(res, curr.cost)
            break
        }
        
        for nx in currNode.x-2...currNode.x+2{
            for ny in currNode.y-2...currNode.y+2{
                if nx<0 || nx>=1000000 || ny<0 || ny>=1000000 || edges[[nx,ny]]==nil{
                    continue
                }
                if edges[[nx,ny]]! { continue }
                
                let newCost = sqrt(pow(Double(nx) - x, 2) + pow(Double(ny) - y, 2)) + curr.cost
                if minCost[[nx,ny]]! > newCost{
                    minCost[[nx,ny]] = newCost
                    q.insert(((nx,ny),newCost))
                }
            }
        }
    }
    return Int(res+0.5)
}
let ans = dijk(from: (0,0), cost: 0)
print(ans==20000000 ? -1:ans)