//
//  main.swift
//  10942_swift
//
//  Created by Hyun on 2022/07/30.
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
var arr = [Int]()
for _ in 0..<n{
    arr.append(fio.readInt())
}
var pd = Array(repeating: Array(repeating: false, count: n), count: n)
for i in 0..<n{
    pd[i][i] = true
}
for i in 0..<n-1{
    if arr[i] == arr[i+1]{
        pd[i][i+1] = true
    }
}
for s in stride(from: n-2, through: 0, by: -1){
    for e in s+2..<n{
        if arr[s]==arr[e] && pd[s+1][e-1]{
            pd[s][e] = true
        }
    }
}
var ans = ""
for _ in 0..<fio.readInt(){
    let s = fio.readInt()-1
    let e = fio.readInt()-1
    if pd[s][e]{
        ans += "1\n"
    }else{
        ans += "0\n"
    }
}
print(ans)
