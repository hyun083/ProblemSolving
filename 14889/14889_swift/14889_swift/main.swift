//
//  main.swift
//  14889_swift
//
//  Created by Hyun on 2022/06/29.
//

import Foundation
//by Rhyno
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
let n = fio.readInt()
var map = Array(repeating: Array(repeating: 0, count: n), count: n)
var team = Array(repeating: false, count: n)
var ans = Int.max
for i in 0..<n{
    for k in 0..<n{
        map[i][k] = fio.readInt()
    }
}

func dfs(count:Int, next:Int){
    if count==n/2{
        var start = 0
        var link = 0
        for i in 0..<n{
            for k in 0..<n{
                if team[i] && team[k]{ start += map[i][k] }
                if !team[i] && !team[k]{ link += map[i][k] }
            }
        }
        let result = abs(start-link)
        ans = min(ans, result)
        return
    }
    for i in next..<n{
        if !team[i]{
            team[i] = true
            dfs(count: count+1, next: i)
            team[i] = false
        }
    }
}
dfs(count: 0, next: 1)
print(ans)
