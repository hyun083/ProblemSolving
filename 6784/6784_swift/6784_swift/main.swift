//
//  main.swift
//  6784_swift
//
//  Created by Hyun on 2022/09/04.
//

import Foundation

let n = Int(readLine()!)!
var input = [String]()
var score = 0
for _ in 0..<n{
    input.append(readLine()!)
}
for i in 0..<n{
    let answer = readLine()!
    if input[i] == answer{
        score += 1
    }
}
print(score)
