//
//  main.swift
//  1652_swift
//
//  Created by Hyun on 2023/01/16.
//

import Foundation

let n = Int(readLine()!)!
var horizen = Array(repeating: "", count: n)
var vertical = Array(repeating: "", count: n)
var ans = [0,0]

for i in 0..<n{
    let line = readLine()!.map{String($0)}
    for k in 0..<n{
        horizen[i] += line[k]
        vertical[k] += line[k]
    }
}

for i in 0..<n{
    let h = horizen[i].split(separator: "X")
    let v = vertical[i].split(separator: "X")
    
    for space in h{
        if space.contains(".."){ ans[0] += 1}
    }
    for space in v{
        if space.contains(".."){ ans[1]+=1 }
    }
}
print(ans[0],ans[1])
