//
//  main.swift
//  1655_swift
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
    
    func count() -> Int{
        return nodes.count
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
var maxHeap = Heap<Int>(comparer: <)
var minHeap = Heap<Int>(comparer: >)

var result = ""
for _ in 1...N{
    let number = file.readInt()
    if maxHeap.count() == minHeap.count(){
        if maxHeap.count() == 0 && minHeap.count() == 0{
            maxHeap.insert(number)
        }else{
            if minHeap.peek()! < number{
                let temp = minHeap.delete()!
                minHeap.insert(number)
                maxHeap.insert(temp)
            }else{
                maxHeap.insert(number)
            }
        }
    }else if maxHeap.count() > minHeap.count(){
        if maxHeap.peek()! > number{
            let temp = maxHeap.delete()!
            maxHeap.insert(number)
            minHeap.insert(temp)
        }else{
            minHeap.insert(number)
        }
    }
    result.append("\(maxHeap.peek()!)\n")
}
print(result)
