//
//  main.swift
//  1182_swift
//
//  Created by Hyun on 2021/12/02.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

let N = inputs[0]
let S = inputs[1]

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var cnt = 0
var total = 0

func dfs(from curr:Int){
    if curr == N {return}
    if total + arr[curr] == S {cnt += 1}
    
    dfs(from: curr+1)
    
    total += arr[curr]
    dfs(from: curr+1)
    
    total -= arr[curr]
}

dfs(from: 0)
print(cnt)
