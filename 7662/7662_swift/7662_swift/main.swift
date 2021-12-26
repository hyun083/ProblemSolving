//
//  main.swift
//  7662_swift
//
//  Created by Hyun on 2021/12/18.
//

import Foundation

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

let f = FileIO()
let T = f.readInt()
var ans = Array(repeating: [Int](), count: T)
let out = 2147483648

for i in 0..<T{
    let N = f.readInt()

    for _ in 1...N{
        let command = f.readString()
        let number = f.readInt()
        if command == "I"{
            ans[i].append(number)
        }else{
            if ans[i].count >= 1{
                if number == 1{
                    var max = -2147483649
                    var idx = 0
                    for k in 0..<ans[i].count{
                        if ans[i][k] == out{
                            continue
                        }else if ans[i][k] > max{
                            max = ans[i][k]
                            idx = k
                        }
                    }
                    ans[i][idx] = out
                }else{
                    var min = 2147483648
                    var idx = 0
                    for k in 0..<ans[i].count{
                        if ans[i][k] == out{
                            continue
                        }else if ans[i][k] < min{
                            min = ans[i][k]
                            idx = k
                        }
                    }
                    ans[i][idx] = out
                }
            }else{
                continue
            }
        }
    }
}

for i in 0..<T{
    var max = -2147483649
    var min = 2147483648
    
    for k in 0..<ans[i].count{
        if ans[i][k] == out{
            continue
        }else if max < ans[i][k]{
            max = ans[i][k]
        }
    }
    
    for k in 0..<ans[i].count{
        if ans[i][k] == out{
            continue
        }else{
            if min > ans[i][k]{
                min = ans[i][k]
            }
        }
    }
    
    if max == -2147483649 && min == 2147483648{
        print("EMPTY")
    }else{
        print("\(max) \(min)")
    }
}

