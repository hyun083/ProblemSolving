//
//  main.swift
//  18429_swift
//
//  Created by Hyun on 2022/07/13.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
let k = nk[1]
let kit = readLine()!.split(separator: " ").map{Int(String($0))!-k}
var visited = Array(repeating: false, count: n)
var power = 500
var arr = [Int]()
var ans = 0

func btk(cnt:Int){
    if cnt==n{
        ans += 1
        return
    }
    for i in 0..<n{
        if !visited[i] && power+kit[i]>=500{
            visited[i] = true
            power += kit[i]
            btk(cnt: cnt+1)
            visited[i] = false
            power -= kit[i]
        }
    }
}
btk(cnt: 0)
print(ans)
