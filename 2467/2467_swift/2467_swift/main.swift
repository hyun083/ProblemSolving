//
//  main.swift
//  2467_swift
//
//  Created by Hyun on 2022/05/23.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var left = 0
var right = n-1
var temp = 2000000001
var str = ""
while left < right{
    if arr[left] + arr[right] == 0{
        str = "\(arr[left]) \(arr[right])"
        break
    }
    if abs(arr[left] + arr[right]) < temp{
        temp = abs(arr[left] + arr[right])
        str = "\(arr[left]) \(arr[right])"
    }
    
    if arr[left] + arr[right] < 0 {
        left += 1
    }else{
        right -= 1
    }
}
print(str)

