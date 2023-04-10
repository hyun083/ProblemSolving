//
//  main.swift
//  19638_swift
//
//  Created by Hyun on 2022/02/16.
//

import Foundation
//Heap by Rhyno
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

let NHT = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NHT[0]
let H = NHT[1]
let T = NHT[2]
var max_heap = Heap<Int>(comparer: <)

for _ in 0..<N{
    max_heap.insert(Int(readLine()!)!)
}

var cnt = 0
for _ in 0..<T{
    if max_heap.peek()! < H || max_heap.peek()! == 1{
        break
    }else{
        max_heap.insert(max_heap.delete()! / 2)
        cnt += 1
    }
}

if max_heap.peek()! >= H{
    print("NO\n\(max_heap.peek()!)")
}else{
    print("YES\n\(cnt)")
}
