//
//  main.swift
//  20044_swift
//
//  Created by Hyun on 2022/05/05.
//

//import Foundation

let n = Int(readLine()!)!*2 - 1
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var result = Int.max
for i in 0...n{
    let temp = numbers[i] + numbers[n-i]
    result = result>temp ? temp:result
}
print(result)
