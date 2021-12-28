//
//  main.swift
//  10870_swift
//
//  Created by Hyun on 2021/12/28.
//

import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: 21)

func fi(num:Int) -> Int{
    if num == 0{
        return 0
    }
    if num == 1{
        return 1
    }
    if arr[num] != 0 {
        return arr[num]
    }
    arr[num] = fi(num: num-1) + fi(num: num-2)
    return arr[num]
}
print(fi(num: n))
