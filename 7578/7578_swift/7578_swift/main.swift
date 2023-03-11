//
//  main.swift
//  7578_swift
//
//  Created by Hyun on 2023/03/11.
//

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

let io = FileIO()
let N = io.readInt()

var A = [Int]()
for _ in 0..<N{ A.append(io.readInt()) }

var B = [Int:Int]()
for i in 0..<N{ B[io.readInt()] = i }

var tree = Array(repeating: 0, count: N*4)
var ans = 0

func update_tree(start:Int, end:Int, node:Int, target_idx:Int){
    if target_idx < start || end < target_idx{
        return
    }
    tree[node] += 1
    if start == end{
        return
    }
    
    let mid = (start+end)/2
    update_tree(start: start, end: mid, node: node*2, target_idx: target_idx)
    update_tree(start: mid+1, end: end, node: node*2+1, target_idx: target_idx)
}

func read_tree(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
    if end < from || to < start{
        return 0
    }
    if from <= start && end <= to{
        return tree[node]
    }
    
    let mid = (start+end)/2
    let left = read_tree(start: start, end: mid, node: node*2, from: from, to: to)
    let right = read_tree(start: mid+1, end: end, node: node*2+1, from: from, to: to)
    return left + right
}

for i in 0..<N{
    let idx = B[A[i]]!
    ans += read_tree(start: 0, end: N-1, node: 1, from: idx, to: N-1)
    update_tree(start: 0, end: N-1, node: 1, target_idx: idx)
}
print(ans)
