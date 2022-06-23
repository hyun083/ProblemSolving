//
//  main.swift
//  10216_swift
//
//  Created by Hyun on 2022/06/23.
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

struct Camp{
    let x:Int
    let y:Int
    let r:Int
}

var fio = FileIO()
let T = fio.readInt()
var output = ""
for t in 0..<T{
    let n = fio.readInt()
    var ans = n
    var arr = [Int](0..<n)
    func root(Of n:Int)->Int{
        if arr[n] == n {return n}
        arr[n] = root(Of: arr[n])
        return arr[n]
    }
    func union(a:Int, b:Int){
        let ra = root(Of: a)
        let rb = root(Of: b)
        arr[rb] = ra
    }
    var camps =  [Camp]()
    for _ in 0..<n{
        let x = fio.readInt()
        let y = fio.readInt()
        let r = fio.readInt()
        camps.append(Camp(x: x, y: y, r: r))
    }
    for i in 0..<n-1{
        for k in i+1..<n{
            if root(Of: i) == root(Of: k){
                continue
            }
            let a = camps[i]
            let b = camps[k]
            
            let distance = pow(Decimal(a.x-b.x), 2) + pow(Decimal(a.y-b.y), 2)
            let range = pow(Decimal(a.r+b.r), 2)
            if distance <= range{
                union(a: i, b: k)
                ans -= 1
            }
        }
    }
    if t == T-1{
        output += "\(ans)"
        break
    }
    output += "\(ans)\n"
}
print(output)
