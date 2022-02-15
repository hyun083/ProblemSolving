//
//  main.swift
//  5619_swift
//
//  Created by Hyun on 2022/02/15.
//

import Foundation
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
        self.init(comparer: >)
    }
}

let N = Int(readLine()!)!
var min_heap = Heap<Int>(comparer: >)
for _ in 1...N{
    min_heap.insert(Int(readLine()!)!)
}

var arr = [Int]()
if N == 3{
    for _ in 0..<3{
        arr.append(min_heap.delete()!)
    }
}else{
    for _ in 0..<4{
        arr.append(min_heap.delete()!)
    }
}

var answer = [Int]()
for i in 0..<arr.count{
    for k in 0..<arr.count{
        if i == k{
            continue
        }
        let number = Int(String(arr[i]) + String(arr[k]))!
        answer.append(number)
    }
}
answer.sort(by: <)
print(answer[2])
