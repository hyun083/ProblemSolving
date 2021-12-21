//
//  main.swift
//  1427_swift
//
//  Created by Hyun on 2021/12/21.
//

import Foundation

let input = readLine()!
var arr = [Int]()

for i in input{
    arr.append(Int(String(i))!)
}

for a in arr.sorted(by: >){
    print(a,terminator: "")
}
