//
//  main.swift
//  9663_swift
//
//  Created by Hyun on 2021/12/06.
//

import Foundation

let N = Int(readLine()!)!
var map = Array(repeating: Array(repeating: false, count: N), count: N)
var ans = 0

let nx = [1,-1,0,0,1,1,-1,-1]
let ny = [0,0,-1,1,-1,1,-1,1]


