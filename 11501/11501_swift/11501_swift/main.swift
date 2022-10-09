//
//  main.swift
//  11501_swift
//
//  Created by Hyun on 2022/10/09.
//

import Foundation

var result = ""
for _ in 0..<Int(readLine()!)!{
    let n = Int(readLine()!)!
    let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.reversed()
    var target = arr.first!
    var ans = 0
    for price in arr{
        if price < target{
            ans += (target-price)
        }else if price > target{
            target = price
        }
    }
    result += "\(ans)\n"
}
print(result)
