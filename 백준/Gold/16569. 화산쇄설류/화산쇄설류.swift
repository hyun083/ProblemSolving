import Foundation

//by rhyno
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

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

let fio = FileIO()

let M = fio.readInt()
let N = fio.readInt()
let V = fio.readInt()

let X = fio.readInt()-1
let Y = fio.readInt()-1

var volcano = Array(repeating: Array(repeating: false, count: N), count: M)
var visited = Array(repeating: Array(repeating: false, count: N), count: M)
var height = Array(repeating: Array(repeating: Int(), count: N), count: M)
var q = Heap<((x:Int, y:Int, t:Int, isGas:Int))>(comparer: {
    if $0.t == $1.t{
        return $0.isGas < $1.isGas
    }else{
        return $0.t > $1.t
    }
})

var arr = Array(repeating: Array(repeating: Int.max, count: N), count: M)
var ans = (height:height[X][Y], time:0)

for i in 0..<M{
    for k in 0..<N{
        height[i][k] = fio.readInt()
    }
}

let dx = [-1,1,0,0]
let dy = [0,0,-1,1]

for _ in 0..<V{
    let x = fio.readInt()-1
    let y = fio.readInt()-1
    let t = fio.readInt()
    volcano[x][y] = true
    
    q.insert((x,y,t,1))
}

q.insert((X,Y,0,0))

while !q.isEmpty{
    let curr = q.delete()!
    
    if curr.isGas==1{
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=M || ny<0 || ny>=N { continue }
            
            if arr[nx][ny] > curr.t+1{
                arr[nx][ny] = curr.t+1
                q.insert((nx,ny,curr.t+1,1))
            }
        }
    }else{
        if ans.height < height[curr.x][curr.y]{
            ans.height = height[curr.x][curr.y]
            ans.time = curr.t
        }else if ans.height == height[curr.x][curr.y]{
            ans.time = min(ans.time, curr.t)
        }
        
        for i in 0..<4{
            let nx = curr.x + dx[i]
            let ny = curr.y + dy[i]
            
            if nx<0 || nx>=M || ny<0 || ny>=N || visited[nx][ny] || volcano[nx][ny]{ continue }
            
            if arr[nx][ny] > curr.t+1{
                visited[nx][ny] = true
                q.insert((nx,ny,curr.t+1,0))
            }
        }
    }
}

print(ans.height,ans.time)
