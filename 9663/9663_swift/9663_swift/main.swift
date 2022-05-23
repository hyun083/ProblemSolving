//
//  main.swift
//  9663_swift
//
//  Created by Hyun on 2021/12/06.
//

import Foundation

let N = Int8(readLine()!)!
var arr = Array(repeating: Int8(-1), count: 15)
var ans = Int(0)

func check(level:Int8) -> Bool{
    for i in 0..<level{
        if arr[Int(i)] == arr[Int(level)] || level - i == abs(arr[Int(level)] - arr[Int(i)]){
            return false
        }
    }
    return true
}

func btk(cnt:Int8){
    if cnt == N{
        ans += 1
        return
    }
    for i in 0..<N{
        arr[Int(cnt)] = i
        if check(level: cnt){
            btk(cnt: cnt+1)
        }
    }
}

btk(cnt: Int8(0))
print(ans)
