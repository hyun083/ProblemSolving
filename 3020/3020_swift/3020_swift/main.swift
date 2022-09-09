//
//  main.swift
//  3020_swift
//
//  Created by Hyun on 2022/09/09.
//

import Foundation

let nh = readLine()!.split(separator: " ").map{Int($0)!}
let n = nh[0]
let h = nh[1]

var map = Array(repeating: Array(repeating: false, count: n), count: h)



