//
//  main.swift
//  11444_swift
//
//  Created by Hyun on 2021/12/29.
//

import Foundation

let N = Int(readLine()!)!

var arr = Array(repeating: -1, count: N)

func fibonacci(num:Int) -> Int{
    if num == 0{
        return 0
    }
    if num == 1{
        return 1
    }
    if arr[num] != -1{
        return arr[num]
    }
    arr[num] = (fibonacci(num: (num-1)%1000000007) + fibonacci(num: (num-2)%10000000007))%1000000007
    return arr[num]
}

print(fibonacci(num: N))

