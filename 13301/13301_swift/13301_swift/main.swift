//
//  main.swift
//  13301_swift
//
//  Created by Hyun on 2022/03/31.
//

import Foundation

var n = Int(readLine()!)!
var arr = Array(repeating: 0, count: 81)

func fibonacci(num:Int) -> Int{
    if num == 0 || num == 1{
        return 1
    }
    if arr[num] != 0 {
        return arr[num]
    }else{
        let temp = fibonacci(num: num-1) + fibonacci(num: num-2)
        arr[num] = temp
        return temp
    }
}

if n==1{
    print("4")
}else{
    let result = fibonacci(num: n-1)*2 + (fibonacci(num: n-2)+fibonacci(num: n-1))*2
    print(result)    
}
