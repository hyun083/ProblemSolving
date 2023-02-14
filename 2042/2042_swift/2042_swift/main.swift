//
//  main.swift
//  2042_swift
//
//  Created by Hyun on 2023/02/14.
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

let fio = FileIO()

let N = fio.readInt()
let M = fio.readInt()
let K = fio.readInt()

var tree = Array(repeating: 0, count: N*4)
var arr = [Int]()

for _ in 0..<N{
    arr.append(fio.readInt())
}

func makeTree(from n:Int, end m:Int, idx:Int) -> Int{
    if n == m{
        tree[idx] = arr[n]
        return tree[idx]
    }
    
    let mid = (n+m)/2
    tree[idx] = makeTree(from: n, end: mid, idx: idx*2) + makeTree(from: mid+1, end: m, idx: idx*2+1)
    return tree[idx]
}

func interval_sum(from:Int, end:Int, idx:Int, min:Int, max:Int) -> Int{
    if end < min || max < from{
        return 0
    }
    if min <= from && end <= max{
        return tree[idx]
    }
    
    let mid = (from+end)/2
    return interval_sum(from: from, end: mid, idx: idx*2, min: min, max: max) +
    interval_sum(from: mid+1, end: end, idx: idx*2+1, min: min, max: max)
}

func update_tree(from:Int, end:Int, idx:Int, target:Int, value:Int){
    if target < from || end < target{
        return
    }
    
    tree[idx] += value
    
    if from == end{
        arr[from] += value
        return
    }
    
    let mid = (from+end)/2
    update_tree(from: from, end: mid, idx: idx*2, target: target, value: value)
    update_tree(from: mid+1, end: end, idx: idx*2+1, target: target, value: value)
}

makeTree(from: 0, end: N-1, idx: 1)

for _ in 0..<M+K{
    if fio.readInt() == 1{
        let target_idx = fio.readInt()-1
        let num = fio.readInt()
        update_tree(from: 0, end: N-1, idx: 1, target: target_idx, value: num-arr[target_idx])
    }else{
        let min = fio.readInt()-1
        let max = fio.readInt()-1
        print(interval_sum(from: 0, end: N-1, idx: 1, min: min, max: max))
    }
}
