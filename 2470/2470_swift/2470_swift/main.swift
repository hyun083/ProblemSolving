//
//  main.swift
//  2470_swift
//
//  Created by Hyun on 2022/03/24.
//

import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var start = 0
var end = N-1
var result = Int.max
var idx1 = 0
var idx2 = 0

while start < end{
    let number = arr[start]+arr[end]
    if result > abs(number){
        result = abs(number)
        idx1 = start
        idx2 = end
    }
    if number<0{
        start += 1
    }else if number>0{
        end -= 1
    }else{
        idx1 = start
        idx2 = end
        break
    }
}
print(arr[idx1], arr[idx2])
