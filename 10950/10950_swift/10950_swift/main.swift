//
//  main.swift
//  10950_swift
//
//  Created by Hyun on 2022/11/28.
//

import Foundation

for _ in 0..<Int(readLine()!)!{
    let sum = readLine()!.split(separator: " ").map{Int($0)!}.reduce(0, +)
    print(sum)
}

