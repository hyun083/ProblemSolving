//
//  main.swift
//  2525_swift
//
//  Created by Hyun on 2022/05/23.
//

import Foundation

let time = readLine()!.split(separator: " ").map{Int(String($0))!}
var a = time[0]
var b = time[1]
let c = Int(readLine()!)!
a += c/60
b += c%60

a += b/60
b %= 60

a %= 24
print(a, b)


