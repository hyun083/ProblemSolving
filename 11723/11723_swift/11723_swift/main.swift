//
//  main.swift
//  11723_swift
//
//  Created by Hyun on 2021/12/01.
//

import Foundation

let M = Int(readLine()!)!
var num = UInt32(0)
var result = ""

for _ in 1...M{
    let inputs = readLine()!.split(separator: " ").map{$0}
    if inputs.count == 2{
        let k = UInt32(String(inputs[1]))! - 1
        if inputs[0] == "add"{ num |= (1 << k)}
        if inputs[0] == "remove"{ num &= ~(1 << k)}
        if inputs[0] == "check"{
            let out = num & (1 << k)
            if out == 0{
                result.write(String("0") + "\n")
            }else{
                result.write(String("1") + "\n")
            }
        }
        if inputs[0] == "toggle"{
            if num & (1 << k) == 0{
                num |= (1 << k)
            }else{
                num &= ~(1 << k)
            }
        }
    }
    if inputs[0] == "all" {num = 4294967295}
    if inputs[0] == "empty" {num = 0}
}
print(result)
