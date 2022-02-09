//
//  main.swift
//  1292_swift
//
//  Created by Hyun on 2022/02/09.
//

import Foundation

let AB = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = AB[0]
let B = AB[1]
var arr = [Int]()

var cnt = 1
while arr.count < B{
    for _ in 1...cnt{
        arr.append(cnt)
    }
    cnt += 1
}

var result = 0
for i in A-1...B-1{
    result += arr[i]
}
print(result)
