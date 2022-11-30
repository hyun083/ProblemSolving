//
//  main.swift
//  10818_swift
//
//  Created by Hyun on 2022/11/27.
//

import Foundation

let _ = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int($0)!}
print(arr.min()!,arr.max()!)
