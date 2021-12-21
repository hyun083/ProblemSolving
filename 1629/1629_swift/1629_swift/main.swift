//
//  main.swift
//  1629_swift
//
//  Created by Hyun on 2021/12/21.
//

import Foundation

let numbers = readLine()!.split(separator: " ").map{UInt64(String($0))!}

let A = numbers[0]
var B = numbers[1]
let C = numbers[2]

func p(num1:UInt64, num2:UInt64) -> UInt64{
    if B == 0{
        return UInt64(1)
    }else if B == 1{
        return num1
    }else{
        if B % 2 == 0{
            return 
        }
    }
    
}


