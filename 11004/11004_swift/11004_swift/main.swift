//
//  main.swift
//  11004_swift
//
//  Created by Hyun on 2022/03/24.
//

import Foundation

let NK = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NK[0]
let K = NK[1]

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: < )
print(arr[K-1])
