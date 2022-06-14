//
//  main.swift
//  1644_swift
//
//  Created by Hyun on 2022/06/14.
//

import Foundation

let n = Int(readLine()!)!
var arr = [Int](0...4000000)
var prime = [Int]()
arr[1] = 0
for i in 2...4000000{
    arr[i] = i
}
for i in 2...4000000{
    if arr[i] == 0 {continue}
    for j in stride(from: i*2, through: 4000000, by: +i){
        arr[j] = 0
    }
}
for a in arr{
    if a != 0{
        prime.append(a)
    }
}
var left = 0
var right = 0
var sum = prime[left]
var cnt = 0
while right < prime.count{
    if sum < n{
        right += 1
        if right == prime.count{break}
        sum += prime[right]
    }else if sum == n{
        cnt += 1
        right += 1
        if right == prime.count{break}
        sum += prime[right]
    }else{
        sum -= prime[left]
        left += 1
    }
}
print(cnt)
