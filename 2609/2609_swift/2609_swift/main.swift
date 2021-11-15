//
//  main.swift
//  2609_swift
//
//  Created by Hyun on 2021/11/14.
//

import Foundation

let inputs = readLine()!.split(separator: " ").map{Int(String($0))!}

var num1 = inputs.max()!
var num2 = inputs.min()!
var mod = Int()

while(num2 != 0){
    mod = num1 % num2
    num1 = num2
    num2 = mod
}

print(num1)
print(inputs[0] * inputs[1] / num1)



