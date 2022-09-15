//
//  main.swift
//  16926_swift
//
//  Created by Hyun on 2022/09/15.
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
let m = fio.readInt()
let r = fio.readInt()%(n*m)

var arr = Array(repeating: Array(repeating: Int(), count: m), count: n)
for i in 0..<n{
    for k in 0..<m{
        arr[i][k] = fio.readInt()
    }
}

func rotate(cnt:Int){
    if cnt == r{
        return
    }
    var temp = Array(repeating: Array(repeating: Int(), count: m), count: n)
    var x1 = 0
    var y1 = 0
    
    var x2 = n-1
    var y2 = 0
    
    var x3 = n-1
    var y3 = m-1
    
    var x4 = 0
    var y4 = m-1
    for _ in 0..<min(n, m)/2{
        for x in x1+1...x2{
            temp[x][y1] = arr[x-1][y1]
        }
        for y in y2+1...y3{
            temp[x2][y] = arr[x2][y-1]
        }
        for x in stride(from: x3-1, through: x4, by: -1){
            temp[x][y3] = arr[x+1][y3]
        }
        for y in stride(from: y4-1, through: y1, by: -1){
            temp[x4][y] = arr[x4][y+1]
        }
        x1+=1; y1+=1
        x2-=1; y2+=1
        x3-=1; y3-=1
        x4+=1; y4-=1
    }
    arr = temp
    rotate(cnt: cnt+1)
}
rotate(cnt: 0)
var ans = ""
for i in 0..<n{
    for k in 0..<m{
        ans += "\(arr[i][k]) "
    }
    
    ans += "\n"
}
print(ans)
