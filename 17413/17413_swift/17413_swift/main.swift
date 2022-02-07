//
//  main.swift
//  17413_swift
//
//  Created by Hyun on 2022/02/07.
//

import Foundation

let txt = readLine()!
var result = ""
var temp = ""
var flag = false

for t in txt{
    if t == "<"{
        result += String(temp.reversed()) + "<"
        temp = ""
        flag = true
        continue
    }
    
    if t == ">"{
        flag = false
        result.append(">")
        continue
    }
    
    if flag{
        result.append(t)
        continue
    }else{
        if t == " "{
            result += String(temp.reversed()) + " "
            temp = ""
            continue
        }
        temp.append(t)
        continue
    }
}
if temp != ""{
    result += String(temp.reversed())
}
print(result)
