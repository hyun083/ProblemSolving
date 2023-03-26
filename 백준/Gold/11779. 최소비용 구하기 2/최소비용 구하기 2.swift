import Foundation

//by Rhyno
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

let INF = Int.max
let N = Int(readLine()!)!
let M = Int(readLine()!)!

var map = Array(repeating: [(num:Int, cost:Int)](), count: N)
var visited = Array(repeating: false, count: N)
var ans = Array(repeating: (cost:INF,num:-1), count: N)

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int($0)!}
    let u = line[0]-1
    let v = line[1]-1
    let cost = line[2]
    map[u].append((v,cost))
}

let line = readLine()!.split(separator: " ").map{Int($0)!-1}
let U = line[0]
let V = line[1]
ans[U] = (0,U)

var pq = Heap<(num:Int,cost:Int)>(comparer: {$0.1>$1.1})
pq.insert((U,0))

while !pq.isEmpty{
    let curr = pq.delete()!
    visited[curr.num] = true
    if visited[V]{ break }
    for next in map[curr.num]{
        if visited[next.num]{ continue }
        if ans[next.num].cost > ans[curr.num].cost+next.cost{
            ans[next.num] = (ans[curr.num].cost+next.cost, curr.num)
            pq.insert((next.num,ans[next.num].cost))
        }
    }
}

var degree = 0
var path = [String]()
func dfs(from u:Int,to v:Int){
    degree += 1
    path.append("\(u+1)")
    if u == v{
        return
    }
    dfs(from: ans[u].num, to: v)
}
dfs(from: V, to: U)

print(ans[V].cost)
print(degree)
print(Array(path.reversed()).joined(separator: " "))