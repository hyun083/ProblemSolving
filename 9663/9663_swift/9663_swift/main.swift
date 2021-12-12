//
//  main.swift
//  9663_swift
//
//  Created by Hyun on 2021/12/06.
//

import Foundation

let N = Int(readLine()!)!
var arr = Array(repeating: 15, count: 15)
var ans = 0

func check(level:Int) -> Bool{
    for i in 0..<level{
        if arr[i] == arr[level] || level - i == abs(arr[level] - arr[i]){
            return false
        }
    }
    return true
}

func btk(cnt:Int){
    if cnt == N{
        ans += 1
    }
    for i in 0..<N{
        arr[cnt] = i
        if check(level: cnt){
            btk(cnt: cnt+1)
        }
    }
}

btk(cnt: 0)
print(ans)
