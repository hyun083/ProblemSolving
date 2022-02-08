//
//  main.swift
//  1072_swift
//
//  Created by Hyun on 2022/02/08.
//

import Foundation

let XY = readLine()!.split(separator: " ").map{UInt64(String($0))!}
var X = XY[0]
var Y = XY[1]
let Z = UInt64(100*Y/X)

var cnt = 0
if Z >= 99{
    print("-1")
}else{
    var left = UInt64(0)
    var right = UInt64(1000000000)
    var tempZ = Z
    while left <= right{
        let mid = (left+right) / 2
        tempZ = 100*(Y+mid) / (X+mid)
        if Z < tempZ{
            right = mid-1
        }else{
            left = mid+1
        }
    }
    print(left)
}
