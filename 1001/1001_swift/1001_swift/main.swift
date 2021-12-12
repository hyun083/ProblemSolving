//
//  main.swift
//  1001_swift
//
//  Created by Hyun on 2021/12/12.
//

import Foundation

let n  = readLine()!.split(separator: " ").map{Int(String($0))!}.reduce(0){-$0-$1}
print(n)
