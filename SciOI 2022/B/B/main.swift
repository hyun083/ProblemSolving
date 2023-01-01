//
//  main.swift
//  B
//
//  Created by Hyun on 2023/01/01.
//

import Foundation

let ms = readLine()!.split(separator: " ").map{Int($0)!}
let m = ms[0]
let s = ms[1]-1

var arr = readLine()!.split(separator: " ").map{Int($0)!}
var ans = 0

func dfs(from curr:Int, with score:Int){
    if curr-1>=0{
        
    }
}
dfs(from: s, with: 0)
print(ans)
