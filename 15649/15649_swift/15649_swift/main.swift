//
//  main.swift
//  15649_swift
//
//  Created by Hyun on 2021/12/06.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = inputs[0]
let M = inputs[1]

var numbers = Array(1...N).map{String($0)}
var arr = Array(repeating: "", count: M)
var visited = Array(repeating: false, count: N)

func dfs(cnt:Int){
    if cnt == M{
        for a in arr{
            print(a,terminator: " ")
        }
        print()
        return
    }
    
    for i in 0..<N{
        if visited[i] == false{
            visited[i] = true
            arr[cnt] = numbers[i]
            dfs(cnt: cnt + 1)
            visited[i] = false
        }
    }
}

dfs(cnt: 0)
