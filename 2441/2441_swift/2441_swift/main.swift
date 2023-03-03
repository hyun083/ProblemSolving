//
//  main.swift
//  2441_swift
//
//  Created by Hyun on 2023/03/03.
//

import Foundation

let N = Int(readLine()!)!
var blank = ""
var stars = String(repeating: "*", count: N)
for _ in 0..<N{
    print(blank+stars)
    blank += " "
    stars.removeLast()
}
