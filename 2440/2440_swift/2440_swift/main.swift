//
//  main.swift
//  2440_swift
//
//  Created by Hyun on 2023/02/26.
//

import Foundation

let N = Int(readLine()!)!
var tmp = String(repeating: "*", count: N)
var ans = [String]()

for _ in 0..<N{
    ans.append(tmp)
    tmp.removeLast()
}
print(ans.joined(separator: "\n"))
