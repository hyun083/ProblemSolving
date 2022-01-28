//
//  main.swift
//  2075_swift
//
//  Created by Hyun on 2022/01/28.
//

import Foundation

var arr = [Int]()
let N = Int(readLine()!)!

for _ in 1...N{
    arr += readLine()!.split(separator: " ").map{Int(String($0))!}
}
arr.sort(by: >)
print(arr[N-1])

