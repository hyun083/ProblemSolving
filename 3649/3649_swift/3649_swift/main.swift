//
//  main.swift
//  3649_swift
//
//  Created by Hyun on 2022/06/06.
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
var file = FileIO()
while let line = readLine(){
    let x = file.readInt()*10000000
    let n = file.readInt()
    var arr = [Int]()
    for _ in 0..<n{
        arr.append(file.readInt())
    }
    arr.sort(by: <)
    var start = 0
    var end = n-1
    var result = 0
    var str = "danger"
    while start<end{
        let sum = arr[start]+arr[end]
        if sum == x{
            if result < abs(arr[start] - arr[end]){
                result = abs(arr[start] - arr[end])
                str = "yes \(arr[start]) \(arr[end]))"
            }
            start += 1
            end -= 1
        }
        if sum < x{
            start += 1
        }
        if sum > x{
            end -= 1
        }
    }
    print(str)
}
