//
//  main.swift
//  2437_swift
//
//  Created by Hyun on 2022/02/28.
//

import Foundation

let N = Int(readLine()!)!
let weight = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var numbers = Set<Int>()


