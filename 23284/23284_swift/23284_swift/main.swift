//
//  main.swift
//  23284_swift
//
//  Created by Hyun on 2022/07/20.
//

import Foundation

let n = Int(readLine()!)!
var ans = [Int]()
var res = 0
var numbers = [Int](1...n)
var stack = [Int]()
var visited = Array(repeating: false, count: n+1)

func btk(cnt:Int){
    if cnt == n{
        ans.append(res)
        return
    }
    for i in 1...n{
        if !visited[i]{
            visited[i] = true
            res *= 10
            res += i
            btk(cnt: cnt+1)
            res -= 1
            res /= 10
            visited[i] = false
        }
    }
}
btk(cnt: 0)
print(ans)
