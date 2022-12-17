//
//  main.swift
//  3052_swift
//
//  Created by Hyun on 2022/12/17.
//

import Foundation

var cnt = Set<Int>()
for _ in 0..<10{
    cnt.insert(Int(readLine()!)!%42)
}
print(cnt.count)
