//
//  main.swift
//  1904_swift
//
//  Created by Hyun on 2021/12/18.
//

import Foundation

let N = Int(readLine()!)!

func fibonacci(num:Int) -> Int{
    var idx1 = 1
    var idx2 = 2
    
    if num == 1{
        return idx1
    }else if num == 2{
        return idx2
    }else{
        var result = 0
        for _ in 3...num{
            result = (idx1 + idx2) % 15746
            idx1 = idx2 % 15746
            idx2 = result
        }
        return result
    }
}
print(fibonacci(num: N))
