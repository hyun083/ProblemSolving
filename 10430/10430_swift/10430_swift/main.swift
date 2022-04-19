//
//  main.swift
//  10430_swift
//
//  Created by Hyun on 2022/04/19.
//

//import Foundation

let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
let A = numbers[0]
let B = numbers[1]
let C = numbers[2]

print((A+B)%C)
print((A+B)%C)
print((A*B)%C)
print((A*B)%C)
