//
//  main.swift
//  2210_swift
//
//  Created by Hyun on 2022/09/11.
//

import Foundation

var map = Array(repeating: [String](), count: 5)
for i in 0..<5{
    map[i] = readLine()!.split(separator: " ").map{String($0)}
}

var ans = Set<String>()
var temp = ""

