//
//  main.swift
//  10989_swift
//
//  Created by Hyun on 2021/11/10.
//

import Foundation

let N  = Int(readLine()!)!
var arr = Array(repeating: 0, count: 10000)

for _ in 1...N{
    let number = Int(readLine()!)!
    arr[number-1] += 1
}

for index in arr.indices{
    while(arr[index] != 0){
        print(index+1)
        arr[index] -= 1
    }
}
