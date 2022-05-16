//
//  main.swift
//  24763_swift
//
//  Created by Hyun on 2022/05/15.
//

import Foundation

let arr = [6,3,2,1,2]
var line1 = readLine()!.split(separator: " ").map{Int(String($0))!}
var line2 = readLine()!.split(separator: " ").map{ Int(String($0))!}

for i in 0..<5{
    line1[i] *= arr[i]
    line2[i] *= arr[i]
}
print(line1.reduce(0, +), line2.reduce(0, +))
