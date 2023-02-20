//
//  main.swift
//  2268_swift
//
//  Created by Hyun on 2023/02/19.
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

var arr = Array(repeating: 0, count: N)
var tree = Array(repeating: 0, count: N*4)

func read_tree(from:Int, to:Int, idx:Int, min:Int, max:Int) -> Int{
    if to < min || max < from{
        return 0
    }
    
    if min <= from && to <= max{
        return tree[idx]
    }
    
    let mid = (from+to)/2
    let left = read_tree(from: from, to: mid, idx: idx*2, min: min, max: max)
    let right = read_tree(from: mid+1, to: to, idx: idx*2+1, min: min, max: max)
    return left + right
}

func modify_tree(from:Int, to:Int, node_idx:Int, target_idx:Int, value:Int){
    if target_idx < from || to < target_idx{
        return
    }
    
    tree[node_idx] += value
    
    if from == to{
        arr[target_idx] += value
        return
    }
    
    let mid = (from+to)/2
    modify_tree(from: from, to: mid, node_idx: node_idx*2, target_idx: target_idx, value: value)
    modify_tree(from: mid+1, to: to, node_idx: node_idx*2+1, target_idx: target_idx, value: value)
}

for _ in 0..<M{
    let cmd = fio.readInt()
    if cmd == 0{
        let I = fio.readInt()-1
        let J = fio.readInt()-1
        print(read_tree(from: 0, to: N-1, idx: 1, min: I<J ? I:J, max: I>J ? I:J))
    }else{
        let I = fio.readInt()-1
        let K = fio.readInt()
        modify_tree(from: 0, to: N-1, node_idx: 1, target_idx: I, value: K-arr[I])
    }
}
