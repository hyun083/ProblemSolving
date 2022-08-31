//
//  main.swift
//  2559_swift
//
//  Created by Hyun on 2022/08/31.
//

import Foundation

let nk = readLine()!.split(separator: " ").map{Int($0)!}
let n = nk[0]
let k = nk[1]
var temp = 0
let arr = [0] + readLine()!.split(separator: " ").map{ num -> Int in
    temp += Int(num)!
    return temp
}
var ans = Int.min
for i in k...n{
    ans = max(ans, arr[i]-arr[i-k])
}
print(ans)
