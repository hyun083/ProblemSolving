//
//  main.swift
//  1008_swift
//
//  Created by Hyun on 2021/12/20.
//

import Foundation

let number = readLine()!.split(separator: " ").map{Double(String($0))!}
let num1 = number[0]
let num2 = number[1]
print(num1/num2)

