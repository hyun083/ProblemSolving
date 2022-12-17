//
//  main.swift
//  10871_swift
//
//  Created by Hyun on 2022/12/17.
//

import Foundation

let nx = readLine()!.split(separator: " ").map{Int($0)!}
let numbers = readLine()!.split(separator: " ").filter({Int($0)!<nx[1]})
print(numbers.joined(separator: " "))
