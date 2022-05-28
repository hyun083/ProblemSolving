//
//  main.swift
//  13549_swift
//
//  Created by Hyun on 2022/05/28.
//

import Foundation
//Heap by rhyno

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

struct Location:Comparable {
    static func < (lhs: Location, rhs: Location) -> Bool {
        lhs.sec > rhs.sec
    }
    
    var sec:Int
    var num:Int
    init(sec:Int, num:Int){
        self.sec = sec
        self.num = num
    }
    
}


var visited = Array(repeating: false, count: 100001)

func findLocation(sec:Int, num:Int) -> Int{
    var pq = Heap<Location>(comparer: <)
    pq.insert(Location(sec: sec, num: num))
    visited[num] = true
    
    while(!pq.isEmpty){
        let curr = pq.delete()!
        if curr.num == k{
            return curr.sec
        }
        if curr.num*2<100001 && !visited[num*2]{
            pq.insert(Location(sec: curr.sec, num: curr.num*2))
            visited[curr.num*2] = true
        }
        if curr.num+1<100001 && !visited[num+1]{
            pq.insert(Location(sec: curr.sec+1, num: curr.num+1))
            visited[curr.num+1] = true
        }
        if curr.num-1<100001 && !visited[num-1]{
            pq.insert(Location(sec: curr.sec+1, num: curr.num-1))
            visited[curr.num-1] = true
        }
    }
}

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]
print(findLocation(sec: 0, num: n))
