//
//  main.swift
//  2357_swift
//
//  Created by Hyun on 2023/02/15.
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

var arr = [Int]()
var tree = Array(repeating: (1000000001,0), count: N*4)

for _ in 0..<N{
    arr.append(fio.readInt())
}

func make_tree(from:Int, to:Int, idx:Int) -> (Int,Int){
    if from == to{
        tree[idx] = (arr[from],arr[from])
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let l = make_tree(from: from, to: mid, idx: idx*2)
    let r = make_tree(from: mid+1, to: to, idx: idx*2+1)
    
    tree[idx].0 = min(l.0, r.0)
    tree[idx].1 = max(l.1, r.1)
    
    return tree[idx]
}

func read_tree(from:Int, to:Int, idx:Int, head:Int, tail:Int) -> (Int,Int){
    if to < head || tail < from{
        return (1000000001,0)
    }
    
    if head <= from && to <= tail{
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let l = read_tree(from: from, to: mid, idx: idx*2, head: head, tail: tail)
    let r = read_tree(from: mid+1, to: to, idx: idx*2+1, head: head, tail: tail)
    
    return (min(l.0, r.0),max(l.1, r.1))
}

make_tree(from: 0, to: N-1, idx: 1)

for _ in 0..<M{
    let start = fio.readInt()-1
    let end = fio.readInt()-1
    let res = read_tree(from: 0, to: N-1, idx: 1, head: start, tail: end)
    print(res.0,res.1)
}
