import Foundation

//heap by rhyno
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

let nmx = readLine()!.split(separator: " ").map{Int($0)!}
let n = nmx[0]
let m = nmx[1]
let x = nmx[2]-1

var map = Array(repeating: [(Int,Int)](), count: n)

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let u = info[0]-1
    let v = info[1]-1
    let cost = info[2]
    map[u].append((v,cost))
}

for i in 0..<n{
    map[i].sort(by: { $0.1 < $1.1 })
}

func dij(from a:Int) -> [Int]{
    var q = Heap<(Int,Int)>(comparer: { $0.1 > $1.1 })
    var visited = Array(repeating: false, count: n)
    var result = Array(repeating: -1, count: n)
    result[a] = 0
    q.insert((a,0))
    
    while !q.isEmpty{
        let curr = q.delete()!
        let idx = curr.0
        
        if !q.isEmpty && visited[idx]{ continue }
        visited[idx] = true
        
        for next in map[idx]{
            if (result[next.0] == -1) || (result[next.0] > result[idx] + next.1){
                result[next.0] = result[idx] + next.1
                q.insert((next.0,result[next.0]))
            }
        }
    }
    
    return result
}

var ans = dij(from: x)
for i in 0..<n{
    ans[i] += dij(from: i)[x]
}

print(ans.max()!)