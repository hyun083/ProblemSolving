//
//  main.swift
//  C
//
//  Created by Hyun on 2022/05/14.
//

import Foundation

let n = Int(readLine()!)!
let foods = readLine()!
var c = 0
var temp = 1

for food in foods{
    if food == "C"{
        c += 1
    }else{
        temp += 1
    }
}

if c == n{
    print(n)
}else{
    if c%temp == 0{
        print(c/temp)
    }else{
        print(c/temp+1)
    }
}


