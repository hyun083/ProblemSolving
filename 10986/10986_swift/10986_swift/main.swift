//
//  main.swift
//  10986_swift
//
//  Created by Hyun on 2022/08/31.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0]
let m = nm[1]
var temp = 0
var sum = [0]+readLine()!.split(separator: " ").map{ num -> Int in
    temp += Int(num)!
    return temp
}
var ans = 0
for i in 0..<n{
    for k in i+1...n{
        let num = sum[k] - sum[i]
        if num % m == 0{
            ans += 1
        }
    }
}
print(ans)
