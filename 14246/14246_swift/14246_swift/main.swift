//
//  main.swift
//  14246_swift
//
//  Created by Hyun on 2023/01/12.
//

import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int($0)!}
let k = Int(readLine()!)!

var head = 0
var tail = 0
var sum = 0
var cnt = 0

while true{
    if sum>k{
        cnt += (n-tail+1)
        sum -= arr[head]
        head += 1
    }else if tail == n{
        break
    }else{
        sum += arr[tail]
        tail += 1
    }
}
print(cnt)
