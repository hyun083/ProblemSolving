//
//  main.swift
//  15652_swift
//
//  Created by Hyun on 2021/12/09.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = inputs[0]
let M = inputs[1]

var arr = [String]()
var visited = Array(repeating: false, count: N)

func dfs(num:Int, cnt:Int){
    if cnt == M{
        if arr.count == M{
            print(arr.joined())
        }
        return
    }
    
    for i in num...N{
        arr.append(String(i)+" ")
        dfs(num: i, cnt: cnt+1)
        
        arr.removeLast()
    }
}
dfs(num: 1, cnt: 0)

