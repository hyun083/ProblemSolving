//
//  main.swift
//  12865_swift
//
//  Created by Hyun on 2022/03/13.
//

import Foundation

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
let file = FileIO()

let N = file.readInt()
let K = file.readInt()

var W = [0]
var V = [0]
for _ in 0..<N{
    W.append(file.readInt())
    V.append(file.readInt())
}

func knapsack(n:Int, k:Int, w:[Int], v:[Int]) -> Int{
    if n<=0 || k<=0{
        return 0
    }
    if w[n] > k{
        return knapsack(n: n-1, k: k, w: w, v: v)
    }else{
        let lhs = knapsack(n: n-1, k: k, w: w, v: v)
        let rhs = knapsack(n: n-1, k: k-w[n], w: w, v: v)
        return max(lhs, v[n] + rhs)
    }
}
print(knapsack(n: N, k: K, w: W, v: V))
