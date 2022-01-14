//
//  main.swift
//  9935_swift
//
//  Created by Hyun on 2022/01/11.
//

import Foundation

var text = readLine()!
var bomb = readLine()!

var stack = ""
for t in text{
    stack += String(t)
    if stack.count >= bomb.count{
        if stack.last! == bomb.last!{
            let startIdx = stack.index(stack.endIndex, offsetBy: -bomb.count)
            if stack[startIdx..<stack.endIndex] == bomb{
                stack = String(stack.dropLast(bomb.count))
            }
        }
    }
}
if stack == ""{
    print("FRULA")
}else{
    print(stack)
}
