//
//  main.swift
//  10773_swift
//
//  Created by Hyun on 2021/11/20.
//

import Foundation

var K = Int(readLine()!)!
var numbers = Array<Int>()
var sum = 0

for _ in 1...K{
    let number = Int(readLine()!)!
    if(number == 0){
        sum -= numbers.removeLast()
    }else{
        sum += number
        numbers.append(number)
    }
}
print(sum)
