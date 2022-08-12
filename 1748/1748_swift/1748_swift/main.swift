//
//  main.swift
//  1748_swift
//
//  Created by Hyun on 2022/08/03.
//

import Foundation

let n = Int(readLine()!)!
var ans = 0

var cnt = 1
var flag = 1

for number in 1...n{
    if number == flag*10{
        flag *= 10
        cnt += 1
    }
    ans += cnt
}
print(ans)
