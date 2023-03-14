//
//  main.swift
//  3830_swift
//
//  Created by Hyun on 2023/03/13.
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
}

let io = FileIO()
var ans = [String]()
while true{
    let n = io.readInt()
    let m = io.readInt()

    if n+m == 0{ break }
    
    var weight = Array(repeating: 0, count: n)
    var parent = Array(repeating: -1, count: n)
    
    func root(of a:Int) -> Int{
        if parent[a] < 0 { return a}
        let ra = root(of: parent[a])
        weight[a] += weight[parent[a]]
        parent[a] = ra
        return parent[a]
    }
    
    func union(a:Int, b:Int, value:Int){
        let ra = root(of: a)
        let rb = root(of: b)
        
        if ra == rb { return }
        weight[rb] = weight[a] - weight[b] + value
        parent[rb] = ra
    }
    
    for _ in 0..<m{
        let cmd = io.readString()
        let a = io.readInt()-1
        let b = io.readInt()-1
        
        if cmd == "!"{
            let value = io.readInt()
            union(a: a, b: b, value: value)
        }else{
            if root(of: a) == root(of: b){
                ans.append("\(weight[b]-weight[a])")
            }else{
                ans.append("UNKNOWN")
            }
        }
    }
}
print(ans.joined(separator: "\n"))
