//
//  main.swift
//  1766_swift
//
//  Created by Hyun on 2022/04/29.
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

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var heap = Heap<Int>(comparer: >)
var map = Array(repeating: [Int](), count: N)
var income = Array(repeating: 0, count: N)
var result = [Int]()

for _ in 0..<M{
    let line = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
    let u = line[0]
    let v = line[1]
    income[v] += 1
    map[u].append(v)
}

for i in 0..<N{
    if income[i] == 0{
        heap.insert(i)
        income[i] = -1
    }
}

while !heap.isEmpty{
    let u = heap.delete()!
    for v in map[u]{
        income[v] -= 1
    }
    for i in 0..<N{
        if income[i] == 0{
            heap.insert(i)
            income[i] = -1
        }
    }
    result.append(u)
}

for result in result {
    print(result+1,terminator: " ")
}
