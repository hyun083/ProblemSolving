//
//  main.swift
//  2166_swift
//
//  Created by Hyun on 2022/11/22.
//

import Foundation

let n = Int(readLine()!)!
var dx = [Double]()
var dy = [Double]()

for _ in 0..<n{
    let line = readLine()!.split(separator: " ").map{Double($0)!}
    dx.append(line[0])
    dy.append(line[1])
}
dx.append(dx[0])
dy.append(dy[0])

var sum1 = 0.00
var sum2 = 0.00
for i in 0..<n{
    sum1 += dx[i]*dy[i+1]
    sum2 += dy[i]*dx[i+1]
}

let ans = Double(abs(sum1-sum2))/2.00
let result = round(ans*10)/10
print(String(format: "%.1f", result))
