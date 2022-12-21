//
//  main.swift
//  1263_swift
//
//  Created by Hyun on 2022/12/21.
//

import Foundation

let n = Int(readLine()!)!
var time = 24
var tasks = [(Int,Int)]()

for _ in 0..<n{
    let task = readLine()!.split(separator: " ").map{Int($0)!}
    tasks.append((task[0],task[1]))
}
tasks.sort{$0.1 > $1.1 }

for task in tasks {
    if time > task.1{
        time = task.1-task.0
    }else{
        time -= task.0
    }
}
if time < 0{
    print(-1)
}else{
    print(time)
}
