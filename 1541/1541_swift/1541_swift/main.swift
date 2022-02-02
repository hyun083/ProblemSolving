//
//  main.swift
//  1541_swift
//
//  Created by Hyun on 2022/01/21.
//

import Foundation

let input = readLine()!
var number = ""
var numbers = [Int]()
var minusFlag = false

for text in input{
    if text == "+" || text == "-"{
        if minusFlag{
            numbers.append(Int(number)! * -1)
        }else{
            numbers.append(Int(number)!)
        }
        if text == "-"{
            minusFlag = true
        }
    }else{
        number.append(text)
        continue
    }
    number = ""
}
if minusFlag{
    numbers.append(Int(number)! * -1)
}else{
    numbers.append(Int(number)!)
}
print(numbers.reduce(0, +))
