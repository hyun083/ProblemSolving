//
//  main.swift
//  2170.swift
//
//  Created by Hyun on 2023/03/27.
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
var lines = [(S:Int,E:Int)]()

for _ in 0..<N{
    let s = io.readInt()
    let e = io.readInt()
    lines.append((s,e))
}
lines.sort(by: { return $0.S==$1.S ? ($0.E<$1.E):($0.S<$1.S)})

var ans = lines[0].E - lines[0].S
var target = lines[0].E

for i in 1..<N{
    let start = lines[i].S
    let end = lines[i].E
    
    if start <= target{
        ans += end<target ? 0:end-target
    }else{
        ans += end-start
    }
    target = max(target, end)
}
print(ans)