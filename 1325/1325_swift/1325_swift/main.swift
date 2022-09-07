//
//  main.swift
//  1325_swift
//
//  Created by Hyun on 2022/09/07.
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

let n = fio.readInt()
let m = fio.readInt()
var map = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)

for _ in 0..<m{
    let v = fio.readInt() - 1
    let u = fio.readInt() - 1
    map[u].append(v)
}

func dfs(from curr:Int)->Int{
    visited[curr] = true
    var cnt = 1
    for next in map[curr]{
        if !visited[next]{
            cnt += dfs(from: next)
        }
    }
    return cnt
}

var ans = Array(repeating: 0, count: n)
var target = 0
for u in 0..<n{
    visited = Array(repeating: false, count: n)
    ans[u] = dfs(from: u)
    target = max(target, ans[u])
}
var output = ""
for i in 0..<n{
    if ans[i] == target{
        output += "\(i+1) "
    }
}
print(output)

