//
//  main.swift
//  2230_swift
//
//  Created by Hyun on 2022/05/31.
//

import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nm[0]
let m = nm[1]
var arr = [Int]()
for _ in 0..<n{
    arr.append(Int(readLine()!)!)
}
arr.sort(by: <)

var start = 0
var end = 0
var result = 2000000001

while start<n && end<n{
    let diff = abs(arr[end] - arr[start])
    if diff >= m{
        result = min(result, diff)
        if end < n{
            start += 1
        }
    }else{
        if start < n{
            end += 1
        }
    }
}
    
print(result)
