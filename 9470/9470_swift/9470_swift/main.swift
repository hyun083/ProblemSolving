//
//  main.swift
//  9470_swift
//
//  Created by Hyun on 2022/05/04.
//

import Foundation

//fileIO by Rhyno
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
let fileIo = FileIO()
for _ in 0..<fileIo.readInt(){
    let K = fileIo.readInt()
    let M = fileIo.readInt()
    let P = fileIo.readInt()
    var income = Array(repeating: 0, count: M)
    var strahler = Array(repeating: 0, count: M)
    var map = Array(repeating: [Int](), count: M)
    var res = [Int]()
    var queue = [Int]()
    
    for _ in 0..<P{
        let u = fileIo.readInt() - 1
        let v = fileIo.readInt() - 1
        income[v] += 1
        map[u].append(v)
    }
    for i in 0..<M{
        if income[i] == 0{
            strahler[i] = 1
            queue.append(i)
            income[i] = -1
        }
    }
    while !queue.isEmpty{
        let u = queue.removeFirst()
        res.append(u)
        for v in map[u]{
            if strahler[v] == strahler[u]{
                strahler[v] += 1
            }else{
                strahler[v] = max(strahler[u], strahler[v])
            }
            income[v] -= 1
        }
        for i in 0..<M{
            if income[i] == 0{
                queue.append(i)
                income[i] = -1
            }
        }
    }
    print(K, strahler.max()!)
}

