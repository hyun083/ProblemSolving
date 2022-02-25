//
//  main.swift
//  1789_swift
//
//  Created by Hyun on 2022/02/24.
//

import Foundation

var S = Int(readLine()!)!
var N = 1

while S > 0{
    S -= N
    if S <= N{
        break
    }
    N += 1
}
print(N)
