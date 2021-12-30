//
//  main.swift
//  11444_swift
//
//  Created by Hyun on 2021/12/29.
//

import Foundation

let N = Int(readLine()!)! % 1000000007

var arr = Array(repeating: -1, count: (N%1000000007)+1)

func fibonacci(num:Int) -> Int{
    if num%1000000007 == 0{
        return 0
    }
    if num%1000000007 == 1{
        return 1
    }
    if arr[num%1000000007] != -1{
        return arr[num%1000000007]
    }
    arr[num%1000000007] = (fibonacci(num: num-1)%1000000007 + fibonacci(num: num-2)%10000000007)%1000000007
    return arr[num%1000000007]
}

print(fibonacci(num: N))
