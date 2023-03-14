//
//  main.swift
//  3770_swift
//
//  Created by Hyun on 2023/03/14.
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
let T = io.readInt()
var ans = [String]()

for tc in 1...T{
    let N = io.readInt()
    let M = io.readInt()
    let K = io.readInt()
    var result = 0
    
    var tree = Array(repeating: 0, count: M*4)
    var edges = [(u:Int,v:Int)]()
    
    func update_tree(start:Int, end:Int, node:Int, idx:Int){
        if idx < start || end < idx{ return }
        tree[node] += 1
        if start == end{ return }
        
        let mid = (start+end)/2
        update_tree(start: start, end: mid, node: node*2, idx: idx)
        update_tree(start: mid+1, end: end, node: node*2+1, idx: idx)
    }
    
    func read_tree(start:Int, end:Int, node:Int, from:Int, to:Int) -> Int{
        if end<from || to<start || to<from{ return 0 }
        if from<=start && end<=to{ return tree[node] }
        
        let mid = (start+end)/2
        let left = read_tree(start: start, end: mid, node: node*2, from: from, to: to)
        let right = read_tree(start: mid+1, end: end, node: node*2+1, from: from, to: to)
        return left+right
    }
    
    for _ in 0..<K{
        let u = io.readInt()-1
        let v = io.readInt()-1
        edges.append((u,v))
    }
    
    edges.sort(by: {
        if $0.u == $1.u{
            return $0.v < $1.v
        }else{
            return $0.u < $1.u
        }
    })
    
    for edge in edges{
        let v = edge.v
        result += read_tree(start: 0, end: M-1, node: 1, from: v+1, to: M-1)
        update_tree(start: 0, end: M-1, node: 1, idx: v)
    }
    
    ans.append("Test case \(tc): \(result)")
}
print(ans.joined(separator: "\n"))
