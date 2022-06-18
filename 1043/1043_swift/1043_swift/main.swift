//
//  main.swift
//  1043_swift
//
//  Created by Hyun on 2022/06/18.
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
var arr = [Int](0..<n)
func root(Of n:Int)->Int{
    if arr[n]<0 || arr[n]==n{return n}
    arr[n] = root(Of: arr[n])
    return arr[n]
}
func union(a:Int, b:Int){
    let rootOfA = root(Of: a)
    let rootOfB = root(Of: b)
    if rootOfA == rootOfB{
        return
    }
    if arr[rootOfB]<0{
        arr[rootOfA] = rootOfB
    }else if arr[rootOfA]<0{
        arr[rootOfB] = rootOfA
    }else{
        arr[rootOfB] = rootOfA
    }
}

let k = fio.readInt()
for _ in 0..<k{
    arr[fio.readInt()-1] = -1
}

var partys = [[Int]]()
for _ in 0..<m{
    let p = fio.readInt()
    var party = [Int]()
    for _ in 0..<p{
        party.append(fio.readInt()-1)
    }
    for i in 0..<p-1{
        union(a: party[i], b: party[i+1])
    }
    partys.append(party)
}

var ans = m
for party in partys {
    if arr[root(Of: party.first!)]<0{
        ans -= 1
    }
}
print(ans)
