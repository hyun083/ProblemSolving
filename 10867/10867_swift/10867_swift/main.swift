//
//  main.swift
//  10867_swift
//
//  Created by Hyun on 2022/03/08.
//

import Foundation

let N = Int(readLine()!)!
let arr = Set(readLine()!.split(separator: " ").map{Int(String($0))!}).sorted(by: <)
for number in arr{
    print(number,terminator: " ")
}

