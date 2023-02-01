//
//  main.swift
//  14469_swift
//
//  Created by Hyun on 2023/02/01.
//

import Foundation

let n = Int(readLine()!)!
var cow = [(Int,Int)]()
var time = 0

for _ in 0..<n{
    let info = readLine()!.split(separator: " ").map{Int($0)!}
    cow.append((info[0],info[1]))
}
cow.sort(by: { $0.0 < $1.0 })

for cow in cow{
    if time < cow.0{
        time = cow.0 + cow.1
    }else{
        time += cow.1
    }
}
print(time)
