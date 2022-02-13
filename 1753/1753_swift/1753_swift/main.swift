//
//  main.swift
//  1753_swift
//
//  Created by Hyun on 2022/02/13.
//

import Foundation
//FileIO by Rhyno
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

// Heap by Rhyno
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



struct Edge : Comparable{
    static func < (lhs:Edge, rhs:Edge) -> Bool{
        lhs.cost < rhs.cost
    }
    var cost:Int
    var node:Int
}

let file = FileIO()
let V = file.readInt()
let E = file.readInt()
let K = file.readInt()-1
let inf = Int.max

var D = Array(repeating: [(Int,Int)](), count: V)
for _ in 1...E{
    D[file.readInt()-1].append((file.readInt()-1,file.readInt()))
}

var dist = Array(repeating: inf, count: V)
dist[K] = 0

var pq:Heap = Heap<Edge>()
pq.insert(Edge(cost:0, node:K))
while !pq.isEmpty {
    let curr = pq.delete()!
    if dist[curr.node] < curr.cost{
        continue
    }
    
    for next in D[curr.node]{
        if curr.cost + next.1 < dist[next.0]{
            dist[next.0] = curr.cost + next.1
            pq.insert(Edge(cost: curr.cost + next.1, node: next.0))
        }
    }
}

var result = ""
for d in dist{
    if d == inf{
        result += "INF\n"
    }else{
        result += "\(d)\n"
    }
}
print(result)
