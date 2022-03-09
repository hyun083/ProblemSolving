//
//  main.swift
//  1037_swift
//
//  Created by Hyun on 2022/03/09.
//

//import Foundation

let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map(){Int(String($0))!}.sorted(by: <)
print(numbers.first! * numbers.last!)
