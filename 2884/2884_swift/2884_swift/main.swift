//
//  main.swift
//  2884_swift
//
//  Created by Hyun on 2022/12/04.
//

import Foundation

var time = readLine()!.split(separator: " ").map{Int($0)!}

if time[1] >= 45{
    time[1] -= 45
}else{
    time[1] = 60 - (45-time[1])
    time[0] = (time[0]-1)<0 ? 23:time[0]-1
}
print(time[0],time[1])

