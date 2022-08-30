//
//  main.swift
//  2851_swift
//
//  Created by Hyun on 2022/08/30.
//

import Foundation

var arr = [Int]()
var sum = 0
var ans = Int.max

for _ in 0..<10{
    let score = Int(readLine()!)!
    sum += score
    arr.append(sum)
}

for i in 0..<10{
    if abs(ans-100) > abs(arr[i]-100){
        ans = arr[i]
    }else if abs(ans-100) == abs(arr[i]-100){
        ans = max(ans, arr[i])
    }else{
        continue
    }
}
print(ans)
