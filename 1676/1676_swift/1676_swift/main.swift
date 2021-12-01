//
//  main.swift
//  1676_swift
//
//  Created by Hyun on 2021/12/01.
//

import Foundation

let N = Int(readLine()!)!
var ans = 1
for n in 1...N{
    ans *= n
}
print(ans)
