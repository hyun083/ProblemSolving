//
//  main.swift
//  1202_swift
//
//  Created by Hyun on 2022/02/21.
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

struct Gem : Comparable {
    public static func < (lhs: Gem, rhs: Gem) -> Bool {
        lhs.value < rhs.value
    }
    var weight:Int
    var value:Int
    
}

let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
var sum = 0
var gem = Heap<Gem>(comparer: <)
var bag = [Int]()

for _ in 1...NK[0]{
    var g = readLine()!.split(separator: " ").map{Int(String($0))!}
    gem.insert(Gem(weight: g[0], value: g[1]))
}
for _ in 1...NK[1]{
    bag.append(Int(readLine()!)!)
}
bag.sort(by: <)
print(gem)
print(bag)

while !gem.isEmpty{
    if bag.isEmpty{
        break
    }else{
        
    }
}
