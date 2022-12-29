//
//  main.swift
//  25587_swift
//
//  Created by Hyun on 2022/12/28.
//
//by rhyno
//final class FileIO {
//    private let buffer:[UInt8]
//    private var index: Int = 0
//
//    init(fileHandle: FileHandle = FileHandle.standardInput) {
//
//        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
//    }
//
//    @inline(__always) private func read() -> UInt8 {
//        defer { index += 1 }
//
//        return buffer[index]
//    }
//
//    @inline(__always) func readInt() -> Int {
//        var sum = 0
//        var now = read()
//        var isPositive = true
//
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
//        while now >= 48, now <= 57 {
//            sum = sum * 10 + Int(now-48)
//            now = read()
//        }
//
//        return sum * (isPositive ? 1:-1)
//    }
//
//    @inline(__always) func readString() -> String {
//        var now = read()
//
//        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        let beginIndex = index-1
//
//        while now != 10,
//              now != 32,
//              now != 0 { now = read() }
//
//        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
//    }
//
//    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
//        var now = read()
//
//        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        let beginIndex = index-1
//
//        while now != 10,
//              now != 32,
//              now != 0 { now = read() }
//
//        return Array(buffer[beginIndex..<(index-1)])
//    }
//}
//let fio = FileIO()
import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var arr = Array(repeating: (-1,0,0), count: n)
var flag = false
var cnt = 0

let size = readLine()!.split(separator: " ").map{Int($0)!}
for i in 0..<n{
    arr[i].1 = size[i]
}

let rain = readLine()!.split(separator: " ").map{Int($0)!}
for i in 0..<n{
    arr[i].2 = rain[i]
}

for i in 0..<n{
    if arr[i].1 < arr[i].2{ cnt -= arr[i].0}
}

func root(of a:Int)->Int{
    if arr[a].0 < 0 {return a}
    arr[a].0 = root(of: arr[a].0)
    return arr[a].0
}

func union(a:Int, b:Int){
    let rootA = root(of: a)
    let rootB = root(of: b)
    if rootA == rootB {return}
    if arr[rootA].1 < arr[rootA].2{ cnt += arr[rootA].0 }
    if arr[rootB].1 < arr[rootB].2{ cnt += arr[rootB].0 }
    
    arr[rootA].0 += arr[rootB].0
    arr[rootB].0 = rootA
    arr[rootA].1 += arr[rootB].1
    arr[rootA].2 += arr[rootB].2
    
    if arr[rootA].1 < arr[rootA].2{ cnt -= arr[rootA].0 }
}

for _ in 0..<m{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    let c = info[0]
    if c == 2{
        print(cnt)
    }else{
        let u = info[1]-1
        let v = info[2]-1
        union(a: u, b: v)
    }
}

