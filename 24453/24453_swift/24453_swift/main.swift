//
//  main.swift
//  24453_swift
//
//  Created by Hyun on 2023/01/23.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]

var arr = Array(repeating: false, count: 20000001)
let errors = readLine()!.split(separator: " ").map{Int($0)!}
for err in errors{
    arr[err] = true
}

let xy = readLine()!.split(separator: " ").map{Int($0)!}
let detent = max(xy[0], xy[1])

var head = 1
var tail = 1
var cnt = 0
var ans = Int.max
var errCnt = 0


while tail<n{
    
}
