//
//  main.swift
//  1271_swift
//
//  Created by Hyun on 2022/02/09.
//

import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
print(N/M)
print(N%M)
