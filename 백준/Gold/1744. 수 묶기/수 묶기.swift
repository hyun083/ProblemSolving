//
//  main.swift
//  1744_swift
//
//  Created by Hyun on 2022/02/20.
//

import Foundation
//FileIO by Rhyno
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

    @inline(__always) func readString() -> String {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index-1

        while now != 10,
              now != 32,
              now != 0 { now = read() }

        return Array(buffer[beginIndex..<(index-1)])
    }
}
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
let file = FileIO()

let N = file.readInt()
var sum = 0
var zeroCnt = 0
var minHeap = Heap<Int>(comparer: >)
var maxHeap = Heap<Int>(comparer: <)
for _ in 1...N{
    let number = file.readInt()
    if number == 1{
        sum += 1
    }else if number == 0{
        zeroCnt += 1
    }else if number < 0{
        minHeap.insert(number)
    }else if number > 1{
        maxHeap.insert(number)
    }
}

if minHeap.nodes.count > 1{
    if minHeap.nodes.count%2 == 0{
        while !minHeap.isEmpty{
            sum += minHeap.delete()! * minHeap.delete()!
        }
    }else{
        while minHeap.nodes.count != 1{
            sum += minHeap.delete()! * minHeap.delete()!
        }
    }
}

if !minHeap.isEmpty{
    for _ in 0..<zeroCnt{
        if minHeap.delete() == nil{
            break
        }
    }
    if !minHeap.isEmpty{
        sum += minHeap.delete()!
    }
}

if maxHeap.nodes.count%2 == 0{
    while !maxHeap.isEmpty{
        sum += maxHeap.delete()! * maxHeap.delete()!
    }
}else{
    while maxHeap.nodes.count != 1{
        sum += maxHeap.delete()! * maxHeap.delete()!
    }
    sum += maxHeap.delete()!
}

print(sum)
