//
//  main.swift
//  B
//
//  Created by Hyun on 2022/08/22.
//

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var battery = 100
var temp = [Int:Bool]()
var pt = 2

for phone in arr{
    if temp[phone] == nil{
        pt = 2
        temp[phone] = true
        battery -= pt
    }else{
        pt *= 2
        battery -= pt
    }
    if battery < 0{
        battery = 100
    }
}
print(100 - battery - 2)

