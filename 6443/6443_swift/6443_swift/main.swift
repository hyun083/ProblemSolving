//
//  main.swift
//  6443_swift
//
//  Created by Hyun on 2022/06/25.
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
let T = fio.readInt()
for _ in 0..<T{
    let arr = fio.readString().map{String($0)}.sorted(by: <)
    let n = arr.count
    var visited = Array(repeating: false, count: n)
    var ans = [String]()
    var str = ""
    func btk(cnt:Int ,curr:Int){
        if cnt == n{
            if !ans.contains(str){
                ans.append(str)
            }
            return
        }
        for i in 0..<n{
            if !visited[i]{
                visited[i] = true
                str.append(arr[i])
                btk(cnt: cnt+1, curr: i)
                visited[i] = false
                str.removeLast()
            }
        }
    }
    btk(cnt: 0, curr: 0)
    print(ans.joined(separator: "\n"))
}

