//
//  main.swift
//  2750_swift
//
//  Created by Hyun on 2022/02/21.
//

import Foundation

let N = Int(readLine()!)!
var arr = [Int]()
for _ in 0..<N{
    arr.append(Int(readLine()!)!)
}
for number in arr.sorted(by: <){
    print(number)
}
