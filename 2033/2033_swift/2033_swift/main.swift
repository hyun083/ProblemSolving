//
//  main.swift
//  2033_swift
//
//  Created by Hyun on 2022/08/04.
//

import Foundation

var number = Int(readLine()!)!
var detent = 10

while number > detent{
    let mod = number%detent
    if mod >= detent/2{
        number = (number/detent)*detent+detent
    }else{
        number -= mod
    }
    detent *= 10
}
print(number)
