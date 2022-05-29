//
//  main.swift
//  2610_swift
//
//  Created by Hyun on 2022/05/29.
//

import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var map = Array(repeating: Array(repeating: 101, count: n), count: n)

for _ in 0..<m{
    let people = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = people[0]
    let v = people[1]
    map[u][v] = 1
}

