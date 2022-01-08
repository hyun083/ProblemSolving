//
//  main.swift
//  11660_swift
//
//  Created by Hyun on 2022/01/08.
//

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var map = Array(repeating: [Int](), count: input[0])
func sum(x1:Int, y1:Int, x2:Int, y2:Int) -> Int{
    var sum = 0
    for i in x1...x2{
        for k in y1...y2{
            sum += map[i][k]
        }
    }
    return sum
}

for i in 0..<input[0]{
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
    map[i] = arr
}

for _ in 0..<input[1]{
    let range = readLine()!.split(separator: " ").map{Int(String($0))!-1}
    print(sum(x1: range[0], y1: range[1], x2: range[2], y2: range[3]))
}

