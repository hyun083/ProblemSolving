//
//  main.swift
//  15651_swift
//
//  Created by Hyun on 2021/12/08.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let M = inputs[1]

var arr = [String]()

func dfs(cnt:Int){
    if cnt == M{
        if arr.count == M{
            print(arr.joined())
        }
        return
    }
    
    for i in 1...N{
        arr.append(String(i)+" ")
        dfs(cnt: cnt+1)
        
        arr.removeLast()
    }
}
dfs(cnt: 0)
