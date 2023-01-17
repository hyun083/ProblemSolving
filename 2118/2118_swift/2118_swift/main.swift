//
//  main.swift
//  2118_swift
//
//  Created by Hyun on 2023/01/17.
//

import Foundation

let n = Int(readLine()!)!
var arr = [Int]()
var ans = 0
var total = 0

for _ in 0..<n{
    let num = Int(readLine()!)!
    arr.append(num)
    total += num
}

var head = 0
var tail = 0
var sum = 0

while true{
    if sum > ans{
        sum -= arr[head]
        head += 1
    }else if tail == n{
        break
    }else{
        sum += arr[tail]
        tail += 1
    }
    ans = max(ans, min(sum,total-sum))
}

print(ans)
